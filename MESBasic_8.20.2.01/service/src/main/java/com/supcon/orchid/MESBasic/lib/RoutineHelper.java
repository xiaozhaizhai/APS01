package com.supcon.orchid.MESBasic.lib;

import com.supcon.orchid.MESBasic.daos.MESBasicConfigDao;
import com.supcon.orchid.MESBasic.daos.MESBasicRoutineDao;
import com.supcon.orchid.MESBasic.daos.MESBasicSwitcherModelDao;
import com.supcon.orchid.MESBasic.entities.MESBasicItemSetup;
import com.supcon.orchid.MESBasic.entities.MESBasicRoutine;
import com.supcon.orchid.MESBasic.entities.MESBasicSwitcherModel;
import com.supcon.orchid.foundation.entities.SystemCode;
import org.hibernate.Query;

import java.util.*;
import java.util.Map.Entry;

/**
 * 刷新路径状态
 *
 * @author malipeng
 * @version 2014-11-11
 */
public class RoutineHelper {

    /*路径源、路径目的的类型*/
    public static final String TANK = "ROUTINE_TERMINAL_TYPE/1";
    /*路径状态*/
    /**
     * 空闲
     */
    public static final String FREE = "ROUTINE_STATUS/0";
    /**
     * 繁忙
     */
    public static final String BUSY = "ROUTINE_STATUS/1";
    /**
     * 错误，双向路径同时打开了正向和反向泵
     */
    public static final String ERROR = "ROUTINE_STATUS/2";

    /**
     * 开关量是一个泵
     */
    public static final String PUMP = "MES_SWITHER/1";
    /**
     * 开关量是一个阀门
     */
    public static final String SWITHER = "MES_SWITHER/0";

    /**
     * 灌区信号总开关
     */
    public static final String TAG = "TAG_";
    /*路径方向*/
    /**
     * 正向
     */
    public static final String FORWORD = "0";
    /**
     * 反向
     */
    public static final String BACKWORD = "1";

    /*路径工作模式*/
    /**
     * 双向
     */
    public static final String DOUBLE = "ROUTINE_STRATEGY/1";
    /**
     * 单向
     */
    public static final String SINGLE = "ROUTINE_STRATEGY/0";
    /*路径状态*/
    /**
     * 启用
     */
    private final static String ROUTINE_STATUS_ON = "rootStatus/001";
    /**
     * 停用
     */
    private final static String ROUTINE_STATUS_OFF = "rootStatus/002";

    /**
     * 开关值等于0时表示关闭，不等于0时，表示开启
     */
    private final double FALSE = 0d;
    /**
     * 路径表，对于单向路径来说，判断路径是否启用使用路径表记录
     */
    private MESBasicRoutineDao routineDao;
    /**
     * 路径配置表，对于双向路径，路径的启用判断需要根据位号信息以及路径配置来确定
     */
    private MESBasicConfigDao configDao;
    /**
     * 路径上的所有开关量，包括了泵的开关信号和阀门的开关信号
     */
    private MESBasicSwitcherModelDao switcherModelDao;

    /**
     * 保存当前已经处于启用状态的路径
     * hashtable key:路径的id, value:路径运行的方向，0表示正向，1表示反向；对于单向路径来说，永远用0
     */
    private static Hashtable<Long, RoutineDir> activeRoutine;

    public static Hashtable<Long, RoutineDir> getActiveRoutine() {
        if (activeRoutine == null) {
            activeRoutine = new Hashtable<Long, RoutineDir>();
        }
        /**
         * 将已经从前台删除的路径，从数据缓存中删除
         */
        Set<Entry<Long, RoutineDir>> entries = activeRoutine.entrySet();
        List<Long> keyForRemove = new ArrayList<Long>();
        for (Entry<Long, RoutineDir> entry : entries) {
            List<MESBasicRoutine> routineList = getRoutineHelper().routineDao.findByHql("from MESBasicRoutine where id=? and valid=1", entry.getKey());
            if (routineList.size() == 0) {
                keyForRemove.add(entry.getKey());
            }
        }

        for (Long key : keyForRemove) {
            if (activeRoutine.containsKey(key)) {
                activeRoutine.remove(key);
            }
        }
        return activeRoutine;
    }

    /**
     * 前一次更新路径状态时处于启用状态的路径集合
     * hashtable key:路径的id, value:路径运行的方向，0表示正向，1表示反向；对于单向路径来说，永远用0
     */
    private static Hashtable<Long, RoutineDir> preActiveRoutine;

    public static Hashtable<Long, RoutineDir> getPreActiveRoutine() {
        if (preActiveRoutine == null) {
            preActiveRoutine = new Hashtable<Long, RoutineDir>();
        }
        return preActiveRoutine;
    }

    /**
     * 获取到路径上的所有开关设置
     *
     * @param routine
     * @return
     */
    private List<MESBasicSwitcherModel> getSwitcherModelList(MESBasicRoutine routine) {
        String hql = "from MESBasicSwitcherModel where config.id=?";
        return switcherModelDao.findByHql(hql, routine.getId());
    }

    public void setRoutineDao(MESBasicRoutineDao routineDao) {
        if (this.routineDao == null) {
            this.routineDao = routineDao;
        }
    }

    public void setRoutineConfig(MESBasicConfigDao configDao) {
        if (this.configDao == null) {
            this.configDao = configDao;
        }
    }

    public MESBasicSwitcherModelDao getSwitcherModelDao() {
        return switcherModelDao;
    }

    public void setSwitcherModelDao(MESBasicSwitcherModelDao switcherModelDao) {
        this.switcherModelDao = switcherModelDao;
    }

    static private RoutineHelper helper = new RoutineHelper();

    private RoutineHelper() {
    }

    static public RoutineHelper getRoutineHelper() {
        return helper;
    }

    /**
     * 刷新所有可用路径的状态
     */
    public void refreshRoutineStatus() {
        /**
         * 更新前一次启用路径集合
         */
        getPreActiveRoutine().clear();
        Enumeration<Long> it = getActiveRoutine().keys();
        while (it.hasMoreElements()) {
            Long key = it.nextElement();
            getPreActiveRoutine().put(key, getActiveRoutine().get(key));
        }

        refreshSingleDirRoutine();
        refreshDoubleDirRoutine();
    }

    /**
     * 刷新双向路径，双向路径是否启用由路径上的阀门决定。
     * 当路径上的阀门全部开启的时候，路径被判定为开启，
     */
    private void refreshDoubleDirRoutine() {
        // 可使用外联优化
        String hql = "from MESBasicSwitcherModel model where model.valid = true and model.config.routineStrategy.id = :routineStrategy and model.config.rootineUse.id = :rootineUse and model.config.valid = true order by config";
        // 找出所有的双向工作的路径 valid=1 + 路径状态为启用 - modified by ww 2019-02-21
        Map<String, Object> params = new HashMap<>();
        params.put("routineStrategy", DOUBLE);
        params.put("rootineUse", ROUTINE_STATUS_ON);
        Query query = configDao.createQuery(hql, params);

        List configList = query.list();
        // 正向泵
        boolean sourPumpOpen = false;
        // 反向泵
        boolean desPumpOpen = false;
        // 一条路径上所有的阀门开时为true
        boolean allSwitcherOpen = true;
        MESBasicRoutine preRoutine = null;

        /**
         * 判断是否全部的阀门都已经打开
         */
        for (Object c : configList) {

            MESBasicSwitcherModel config = (MESBasicSwitcherModel) c;
            MESBasicRoutine crtRoutine = routineDao.load(config.getConfig().getId());

            /**
             *  判断路径的方向
             */
            for (Object c1 : configList) {
                MESBasicSwitcherModel config1 = (MESBasicSwitcherModel) c1;
                if (!config1.getConfig().getId().equals(crtRoutine.getId())) {
                    continue;
                }
                if (config1.getForword() && config1.getSwitcher().getCrtValue() != null && config1.getSwitcher().getCrtValue().doubleValue() != FALSE && config1.getStype().getId().equals(PUMP)) {
                    // 正向泵开
                    sourPumpOpen = true;
                } else if (config1.getBackword() && config1.getSwitcher().getCrtValue() != null && config1.getSwitcher().getCrtValue().doubleValue() != FALSE && config1.getStype().getId().equals(PUMP)) {
                    // 反向泵开
                    desPumpOpen = true;
                }
            }

            if (!config.getStype().getId().equals(SWITHER)) {
                continue;
            }
            // 阀门
            MESBasicItemSetup switcher = config.getSwitcher();

            if (allSwitcherOpen) {
                if (preRoutine != null && crtRoutine.getId() != preRoutine.getId()) {

                    if (RoutineHelper.getActiveRoutine().containsKey(preRoutine.getId())) {
                        RoutineHelper.getActiveRoutine().remove(preRoutine.getId());
                    }
                    // 正向阀门和反向阀门只能同时开启一个
                    if (sourPumpOpen ^ desPumpOpen) {
                        // 如果正向阀门开启，则路径工作在正反向上
                        if (sourPumpOpen) {
                            RoutineHelper.getActiveRoutine().put(preRoutine.getId(), new RoutineDir(preRoutine, RoutineDir.WORK_DIR_F));
                        } else {
                            // 如果反向阀门开启，则路径工作在相反的反向上
                            RoutineHelper.getActiveRoutine().put(preRoutine.getId(), new RoutineDir(preRoutine, RoutineDir.WORK_DIR_B));
                        }
                        SystemCode sc = new SystemCode(BUSY);
                        preRoutine.setRoutineStatus(sc);
                    } else {
                        SystemCode sc = new SystemCode(ERROR);
                        preRoutine.setRoutineStatus(sc);
                    }

                    routineDao.save(preRoutine);

                    sourPumpOpen = false;
                    desPumpOpen = false;
                    allSwitcherOpen = true;
                }

                if (switcher != null) {
                    // 如果有一只阀门是关闭的，则当前路径为关闭
                    allSwitcherOpen = switcher.getCrtValue().doubleValue() != FALSE;
                }
            } else {
                // 如果不是所有的阀门都打开的话，路径为关闭状态
                if (preRoutine != null && crtRoutine.getId() != preRoutine.getId()) {

                    if (RoutineHelper.getActiveRoutine().containsKey(preRoutine.getId())) {
                        RoutineHelper.getActiveRoutine().remove(preRoutine.getId());
                    }
                    SystemCode sc = new SystemCode(FREE);
                    preRoutine.setRoutineStatus(sc);
                    routineDao.save(preRoutine);
                }
            }
            preRoutine = crtRoutine;
        }
        if (preRoutine != null) {
            // 如果不是所有的阀门都打开的话，路径为关闭状态
            if (!allSwitcherOpen) {
                if (RoutineHelper.getActiveRoutine().containsKey(preRoutine.getId())) {
                    RoutineHelper.getActiveRoutine().remove(preRoutine.getId());
                }
                SystemCode sc = new SystemCode(FREE);
                preRoutine.setRoutineStatus(sc);
            } else {
                if (RoutineHelper.getActiveRoutine().containsKey(preRoutine.getId())) {
                    RoutineHelper.getActiveRoutine().remove(preRoutine.getId());
                }
                // 正向阀门和反向阀门只能同时开启一个
                if (sourPumpOpen ^ desPumpOpen) {
                    // 如果正向阀门开启，则路径工作在正反向上
                    if (sourPumpOpen) {
                        RoutineHelper.getActiveRoutine().put(preRoutine.getId(), new RoutineDir(preRoutine, RoutineDir.WORK_DIR_F));

                    } else {
                        // 如果反向阀门开启，则路径工作在相反的反向上
                        RoutineHelper.getActiveRoutine().put(preRoutine.getId(), new RoutineDir(preRoutine, RoutineDir.WORK_DIR_B));
                    }
                    SystemCode sc = new SystemCode(BUSY);
                    preRoutine.setRoutineStatus(sc);
                } else {
                    SystemCode sc = new SystemCode(ERROR);
                    preRoutine.setRoutineStatus(sc);
                }
            }
            routineDao.save(preRoutine);

            sourPumpOpen = false;
            desPumpOpen = false;
            allSwitcherOpen = true;
        }
    }

    /**
     * 刷新单向路径的状态，单向路径的状态由路径开关决定。
     */
    private void refreshSingleDirRoutine() {
        String hql = "from MESBasicRoutine where valid = true and routineStrategy.id = :routineStrategy and rootineUse.id = :rootineUse";
        // 找出所有的单向工作的路径 valid=1 + 路径状态为启用 - modified by ww 2019-02-21
        Map<String, Object> params = new HashMap<>();
        params.put("routineStrategy", SINGLE);
        params.put("rootineUse", ROUTINE_STATUS_ON);
        Query query = routineDao.createQuery(hql, params);

        List routineList = query.list();
        for (Object r : routineList) {
            MESBasicRoutine routine = (MESBasicRoutine) r;
            MESBasicItemSetup item = routine.getSwitcher();
            boolean allSwticherOpen = true;
            boolean bumpFlag = false;
            List<MESBasicSwitcherModel> switcherList = getSwitcherModelList(routine);

            for (MESBasicSwitcherModel model : switcherList) {
                if (model.getStype().getId().equals(SWITHER)) {
                    // 判断是否所有阀门开关都开启
                    if (model.getSwitcher().getCrtValue() == null || model.getSwitcher().getCrtValue().doubleValue() == FALSE) {
                        allSwticherOpen = false;
                        break;
                    }
                }
            }

            if (!allSwticherOpen) {
                // 路径关闭
                SystemCode sc = new SystemCode(FREE);
                // 设置路径状态为空闲
                routine.setRoutineStatus(sc);
                if (RoutineHelper.getActiveRoutine().containsKey(routine.getId())) {
                    // 从繁忙路径列表中移除
                    RoutineHelper.getActiveRoutine().remove(routine.getId());
                }
            } else {
                // 路径开启
                SystemCode sc = new SystemCode(BUSY);
                // 设置路径状态为繁忙
                routine.setRoutineStatus(sc);
                if (!RoutineHelper.getActiveRoutine().containsKey(routine.getId())) {
                    // 添加到繁忙路径列表
                    RoutineHelper.getActiveRoutine().put(routine.getId(), new RoutineDir(routine, RoutineDir.WORK_DIR_F));
                }
            }
            routineDao.save(routine);

        }
    }

}
