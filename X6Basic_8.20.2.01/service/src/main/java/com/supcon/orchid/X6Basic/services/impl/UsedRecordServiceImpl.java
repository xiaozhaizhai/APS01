package com.supcon.orchid.X6Basic.services.impl;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map; 
import java.util.Arrays;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.supcon.orchid.audit.annotation.AuditLog;
import com.supcon.orchid.audit.entities.AuditUtil;
import com.supcon.orchid.id.IdGenerator;
import org.apache.commons.beanutils.PropertyUtils;
import java.io.Serializable;
import org.hibernate.Hibernate;
import org.hibernate.type.Type;
import org.hibernate.type.TypeFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.util.HtmlUtils;
import com.supcon.orchid.workflow.engine.transformers.PendingResultTransformer;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.DisposableBean;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.services.BaseServiceImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.supcon.orchid.security.OrchidAuthenticationToken;

import com.supcon.orchid.services.IModelTreeLayRecService;
import com.supcon.orchid.container.mvc.struts2.results.BAPEntityTransformer;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.counter.Counter;
import com.supcon.orchid.counter.CounterManager;
import com.supcon.orchid.counter.CounterType;
import com.supcon.orchid.counter.support.NonCachedCounterBean;
import com.supcon.orchid.X6Basic.services.UsedRecordService;
import com.supcon.orchid.X6Basic.services.UsedRecordImportService;
import com.supcon.orchid.utils.DateUtils;
import com.supcon.orchid.utils.Inflector;
import com.supcon.orchid.utils.OrchidUtils;
import com.supcon.orchid.utils.Param;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.db.DbUtils;
import com.supcon.orchid.utils.JSONPlainSerializer;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.entities.CustomPropertyModelMapping;
import com.supcon.orchid.ec.entities.CustomPropertyViewMapping;
import com.supcon.orchid.ec.entities.Sql;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.entities.DealInfo;
import com.supcon.orchid.ec.entities.Event;
import com.supcon.orchid.ec.entities.ExtraView;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.SqlService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.services.EventService;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.utils.ReflectUtils;
import com.supcon.orchid.ec.services.CreatorService;
import com.supcon.orchid.foundation.services.DataPermissionService;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.SynchronizeInfoService;
import com.supcon.orchid.script.entities.Script;
import com.supcon.orchid.script.EngineScriptExecutor;
import com.supcon.orchid.script.services.ScriptService;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.orm.dao.BaseDao.DBTYPE;
import com.supcon.orchid.orm.enums.DealInfoType;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.X6Basic.entities.MessageCenter;
import com.supcon.orchid.X6Basic.daos.MessageCenterDao;
import com.supcon.orchid.X6Basic.services.MessageCenterService;
import com.supcon.orchid.X6Basic.entities.X6BasicBaseUnit;
import com.supcon.orchid.X6Basic.daos.X6BasicBaseUnitDao;
import com.supcon.orchid.X6Basic.services.X6BasicBaseUnitService;
import com.supcon.orchid.X6Basic.entities.X6BasicUnitGroups;
import com.supcon.orchid.X6Basic.daos.X6BasicUnitGroupsDao;
import com.supcon.orchid.X6Basic.services.X6BasicUnitGroupsService;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegion;
import com.supcon.orchid.X6Basic.daos.X6BasicTimeRegionDao;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionService;
import com.supcon.orchid.X6Basic.entities.X6BasicTimeRegionPar;
import com.supcon.orchid.X6Basic.daos.X6BasicTimeRegionParDao;
import com.supcon.orchid.X6Basic.services.X6BasicTimeRegionParService;
import com.supcon.orchid.X6Basic.entities.MeetingRoom;
import com.supcon.orchid.X6Basic.daos.MeetingRoomDao;
import com.supcon.orchid.X6Basic.services.MeetingRoomService;
import com.supcon.orchid.X6Basic.entities.UsedRecord;
import com.supcon.orchid.X6Basic.daos.UsedRecordDao;
import com.supcon.orchid.X6Basic.services.UsedRecordService;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.X6Basic.daos.X6BasicSyncLogDao;
import com.supcon.orchid.X6Basic.services.X6BasicSyncLogService;
import com.supcon.orchid.X6Basic.entities.ProductManage;
import com.supcon.orchid.X6Basic.daos.ProductManageDao;
import com.supcon.orchid.X6Basic.services.ProductManageService;
import com.supcon.orchid.X6Basic.entities.X6BasicPlanDaily;
import com.supcon.orchid.X6Basic.daos.X6BasicPlanDailyDao;
import com.supcon.orchid.X6Basic.services.X6BasicPlanDailyService;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlan;
import com.supcon.orchid.X6Basic.daos.X6BasicRangePlanDao;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanService;
import com.supcon.orchid.X6Basic.entities.X6BasicRangePlanPart;
import com.supcon.orchid.X6Basic.daos.X6BasicRangePlanPartDao;
import com.supcon.orchid.X6Basic.services.X6BasicRangePlanPartService;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriod;
import com.supcon.orchid.X6Basic.daos.X6BasicAccountPeriodDao;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodService;
import com.supcon.orchid.X6Basic.entities.X6BasicAccountPeriodPart;
import com.supcon.orchid.X6Basic.daos.X6BasicAccountPeriodPartDao;
import com.supcon.orchid.X6Basic.services.X6BasicAccountPeriodPartService;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.daos.X6BasicSyncConfigsDao;
import com.supcon.orchid.X6Basic.services.X6BasicSyncConfigsService;
import com.supcon.orchid.X6Basic.entities.X6BasicMailServer;
import com.supcon.orchid.X6Basic.daos.X6BasicMailServerDao;
import com.supcon.orchid.X6Basic.services.X6BasicMailServerService;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRule;
import com.supcon.orchid.X6Basic.daos.X6BasicSpellRuleDao;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRuleService;
import com.supcon.orchid.X6Basic.entities.X6BasicSpellRulePart;
import com.supcon.orchid.X6Basic.daos.X6BasicSpellRulePartDao;
import com.supcon.orchid.X6Basic.services.X6BasicSpellRulePartService;
import com.supcon.orchid.X6Basic.entities.X6BasicDocumentClasses;
import com.supcon.orchid.X6Basic.daos.X6BasicDocumentClassesDao;
import com.supcon.orchid.X6Basic.services.X6BasicDocumentClassesService;
import com.supcon.orchid.X6Basic.entities.X6BasicSignature;
import com.supcon.orchid.X6Basic.daos.X6BasicSignatureDao;
import com.supcon.orchid.X6Basic.services.X6BasicSignatureService;
import com.supcon.orchid.X6Basic.entities.SignetSetting;
import com.supcon.orchid.X6Basic.daos.SignetSettingDao;
import com.supcon.orchid.X6Basic.services.SignetSettingService;
import com.supcon.orchid.X6Basic.entities.AttMachine;
import com.supcon.orchid.X6Basic.daos.AttMachineDao;
import com.supcon.orchid.X6Basic.services.AttMachineService;
import com.supcon.orchid.X6Basic.entities.X6BasicAbook;
import com.supcon.orchid.X6Basic.daos.X6BasicAbookDao;
import com.supcon.orchid.X6Basic.services.X6BasicAbookService;
import com.supcon.orchid.X6Basic.entities.X6BasicTeamInfo;
import com.supcon.orchid.X6Basic.daos.X6BasicTeamInfoDao;
import com.supcon.orchid.X6Basic.services.X6BasicTeamInfoService;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.tree.PrepareData;
import com.supcon.orchid.tree.Tree;
import com.supcon.orchid.tree.TreeDao;
import javax.annotation.Resource;
import com.supcon.orchid.ec.entities.Field;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.Property;
import com.supcon.orchid.ec.services.IBAPBaseService;
import com.supcon.orchid.ec.services.ModelServiceFoundation;
import com.supcon.orchid.ec.enums.RegionType;
import com.supcon.orchid.utils.SerializeUitls;
import com.supcon.orchid.ec.services.EcConfigService;
import com.supcon.orchid.ec.services.FieldService;
import com.supcon.orchid.ec.enums.DbColumnType;
import com.supcon.orchid.workflow.engine.transformers.PendingResultTransformer;
import com.supcon.orchid.X6Basic.daos.impl.UsedRecordDaoImpl;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.hibernate.jdbc.Work;
import com.supcon.orchid.annotation.BAPIsMneCode;
import com.supcon.orchid.annotation.BAPMneField;
import javax.persistence.Table;
import com.supcon.orchid.utils.MneCodeGenterate;
import com.supcon.orchid.audit.service.DataAuditLogService;
import com.supcon.orchid.audit.entities.SignatureLog;
import com.supcon.orchid.workflow.engine.services.TransitionService;
import com.supcon.orchid.foundation.services.ReliableMessageSenderService;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
/* CUSTOM CODE START(serviceimpl,import,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码
import java.util.Date;
/* CUSTOM CODE END */

@Service("x6Basic_usedRecordService")
@Transactional
public class UsedRecordServiceImpl  extends BaseServiceImpl<UsedRecord> implements UsedRecordService, InitializingBean, DisposableBean {
	private static final Pattern pattern = Pattern.compile("( AS | as )((\"?)(.*?)(\"?))(,| )");
	private static final Pattern p = Pattern.compile("( JOIN | join )((.*?)) ((\"?)(.*?)(\"?))( ON | on )");
	private static final Pattern countPattern = Pattern.compile("(SUM\\()((\"?)(.*?)(\"?))(\\) AS | as )");
	@Autowired
	ReliableMessageSenderService  reliableMessageSenderService;//消息发送服务
	@Autowired
	private SqlService sqlService;
	@Autowired
	EventService eventService;
	@Autowired
	ScriptService scriptService;
	@Autowired
	private IdGenerator autoGeneratorID;
	@Autowired
	private DataAuditLogService dataAuditLogService;
	@Value("${bap.company.single}")
	private Boolean isSingleMode = false;
	
	public Boolean getIsSingleMode() {
		if(null == isSingleMode)
			isSingleMode = false;
		return isSingleMode;
	}
	@Autowired
	private DocumentService documentService;
	@Autowired
	private MessageCenterDao messageCenterDao;
	@Autowired
	private MessageCenterService messageCenterService;
	@Autowired
	private X6BasicBaseUnitDao baseUnitDao;
	@Autowired
	private X6BasicBaseUnitService baseUnitService;
	@Autowired
	private X6BasicUnitGroupsDao unitGroupsDao;
	@Autowired
	private X6BasicUnitGroupsService unitGroupsService;
	@Autowired
	private X6BasicTimeRegionDao timeRegionDao;
	@Autowired
	private X6BasicTimeRegionService timeRegionService;
	@Autowired
	private X6BasicTimeRegionParDao timeRegionParDao;
	@Autowired
	private X6BasicTimeRegionParService timeRegionParService;
	@Autowired
	private MeetingRoomDao meetingRoomDao;
	@Autowired
	private MeetingRoomService meetingRoomService;
	@Autowired
	private UsedRecordDao usedRecordDao;
	@Autowired
	private X6BasicSyncLogDao syncLogDao;
	@Autowired
	private X6BasicSyncLogService syncLogService;
	@Autowired
	private ProductManageDao productManageDao;
	@Autowired
	private ProductManageService productManageService;
	@Autowired
	private X6BasicPlanDailyDao planDailyDao;
	@Autowired
	private X6BasicPlanDailyService planDailyService;
	@Autowired
	private X6BasicRangePlanDao rangePlanDao;
	@Autowired
	private X6BasicRangePlanService rangePlanService;
	@Autowired
	private X6BasicRangePlanPartDao rangePlanPartDao;
	@Autowired
	private X6BasicRangePlanPartService rangePlanPartService;
	@Autowired
	private X6BasicAccountPeriodDao accountPeriodDao;
	@Autowired
	private X6BasicAccountPeriodService accountPeriodService;
	@Autowired
	private X6BasicAccountPeriodPartDao accountPeriodPartDao;
	@Autowired
	private X6BasicAccountPeriodPartService accountPeriodPartService;
	@Autowired
	private X6BasicSyncConfigsDao syncConfigsDao;
	@Autowired
	private X6BasicSyncConfigsService syncConfigsService;
	@Autowired
	private X6BasicMailServerDao mailServerDao;
	@Autowired
	private X6BasicMailServerService mailServerService;
	@Autowired
	private X6BasicSpellRuleDao spellRuleDao;
	@Autowired
	private X6BasicSpellRuleService spellRuleService;
	@Autowired
	private X6BasicSpellRulePartDao spellRulePartDao;
	@Autowired
	private X6BasicSpellRulePartService spellRulePartService;
	@Autowired
	private X6BasicDocumentClassesDao documentClassesDao;
	@Autowired
	private X6BasicDocumentClassesService documentClassesService;
	@Autowired
	private X6BasicSignatureDao signatureDao;
	@Autowired
	private X6BasicSignatureService signatureService;
	@Autowired
	private SignetSettingDao signetSettingDao;
	@Autowired
	private SignetSettingService signetSettingService;
	@Autowired
	private AttMachineDao attMachineDao;
	@Autowired
	private AttMachineService attMachineService;
	@Autowired
	private X6BasicAbookDao abookDao;
	@Autowired
	private X6BasicAbookService abookService;
	@Autowired
	private X6BasicTeamInfoDao teamInfoDao;
	@Autowired
	private X6BasicTeamInfoService teamInfoService;
	
	@Autowired
	private DataPermissionService dataPermissionService;
	@Autowired
	private CounterManager counterManager;
	@Autowired
	private ConditionService conditionService;
	@Autowired
	private ViewServiceFoundation viewServiceFoundation;
	private Counter counter;
	@Autowired
	private CreatorService creatorService;
	@Autowired
	private BundleContext bundleContext;
	@Autowired
	private SynchronizeInfoService synchronizeInfoService;
	@Autowired
	private ModelServiceFoundation modelServiceFoundation;
	@Resource
	private IBAPBaseService<UsedRecord> bapBaseService;
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private EcConfigService ecConfigService;
	@Autowired
	private UsedRecordImportService usedRecordImportService;
	/**
	 * 根据主显示字段列表获取Map
	 * @param mainDisplayKeys 主显示字段
	 * @return Map<String,String> key：count  value：数据数量；  key：idMap  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getMainDisplayMap(Serializable mainDisplayName, Serializable businessKeyName,List<Serializable> mainDisplayKeys) {
		String hql = "select " + mainDisplayName + ",id,"+ businessKeyName + " from " + UsedRecord.JPA_NAME + " where " + mainDisplayName + " in (:mainDisplayKeys)"  + "and VALID = 1";
		Query query =  usedRecordDao.createQuery(hql);
		query.setParameterList("mainDisplayKeys", mainDisplayKeys);
		List<Object[]> list = query.list();
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("count", list.size());
		Map<Serializable, Serializable> map = new HashMap<Serializable, Serializable>();
		if (list != null && !list.isEmpty()) {
			for (Object[] objs : list) {
				map.put((Serializable) (String.valueOf(objs[0])), (Serializable) objs[1]);
				map.put(businessKeyName, (Serializable) objs[2]);
			}
		}
		m.put("idMap", map);
		return m;
	}
	/**
	 * 根据业务主键列表获取Map
	 * @param businessKeys 业务主键列表
	 * @return Map<String,String> key：businessKey  value：id
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<Serializable,Serializable> getBusinessKeyMap(Serializable businessKeyName,List<Serializable> businessKeys){
		if(businessKeyName!=null && String.valueOf(businessKeyName).length() > 0){
			String hql = "select " + businessKeyName + ",id from " + UsedRecord.JPA_NAME + " where " + businessKeyName + " in (:businessKeys)";
			Query query = usedRecordDao.createQuery(hql);
			query.setParameterList("businessKeys", businessKeys);
			List<Object[]> list = query.list();
			Map<Serializable,Serializable> map = new HashMap<Serializable,Serializable>();
			if(list!=null && !list.isEmpty()){
				for (Object[] objs : list) {
					map.put((Serializable)(String.valueOf(objs[0])), (Serializable)objs[1]);
				}
			}
			return map;
		}
		return null;	
		
	}
	
	/**
	 * 获取父节点对象
	*/
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Map<String, Object> getParentNodeMap(Serializable mainDisplayName, Serializable businessKeyName, List<Serializable> serial, String queryParam) {
		String hql = null;
		if(queryParam!=null && queryParam.equals("md")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + UsedRecord.JPA_NAME + " where " + mainDisplayName + " in (:serial)";
		}else if(queryParam!=null && queryParam.equals("bk")){
			hql = "select " + mainDisplayName + ",id,"+ businessKeyName + ",fullPathName,layNo,layRec,parentId,leaf from " + UsedRecord.JPA_NAME + " where " + businessKeyName + " in (:serial)";
		}
		Query query =  usedRecordDao.createQuery(hql);
		query.setParameterList("serial", serial);
		List<Object[]> list = query.list();
		/*String sql = null;
		if(queryParam!=null && queryParam.equals("md")){
			sql = "select * from " + UsedRecord.TABLE_NAME + " where " + mainDisplayName + " = ?";
		}else if(queryParam!=null && queryParam.equals("bk")){
			sql = "select * from " + UsedRecord.TABLE_NAME + " where " + businessKeyName + " = ?";
		}
		List<UsedRecord> list = (List<UsedRecord>) usedRecordDao.createNativeQuery(sql,serial.get(0)).list();
		*/
		Map<String, Object> m = new HashMap<String, Object>();
		if(queryParam!=null && queryParam.equals("md")){
			m.put("count", list.size());
		}
		if (list != null && !list.isEmpty()) {
			for (Object[] obj : list) {
				m.put(serial.get(0).toString(), obj);
			}
		}
		
		return m;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public UsedRecord getUsedRecord(long id){
		return getUsedRecord(id, null);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public UsedRecord getUsedRecord(long id, String viewCode){
		UsedRecord usedRecord = usedRecordDao.load(id);

		// 一对多情况处理
		if(usedRecord != null){
		}
		return usedRecord;
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getUsedRecordAsJSON(long id, String include){
		UsedRecord usedRecord = usedRecordDao.load(id);
		// 一对多情况处理

		if(usedRecord == null) {
			return "";
		}
		return JSONPlainSerializer.serializeAsJSON(usedRecord, include, new BAPEntityTransformer());
	}
	

	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(UsedRecord usedRecord){
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		beforeDeleteUsedRecord(usedRecord);
		usedRecordDao.deletePhysical(usedRecord);
		afterDeleteUsedRecord(usedRecord);
		usedRecordDao.flush();
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		params.add(usedRecord);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		props.put("eventType", "delete");
		String delIds = "";
		// 一对多情况处理
			// TODO delete
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(List<Long> usedRecordIds){
		deleteUsedRecord(usedRecordIds, null);
	}

	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(List<Long> usedRecordIds, String eventTopic) {
		List<UsedRecord> usedRecords = new ArrayList<UsedRecord>();
		for(Long usedRecordId : usedRecordIds){
			UsedRecord usedRecord = getUsedRecord(usedRecordId);
			usedRecords.add(usedRecord);
			if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringA())){
					AuditUtil.setColumnStringA(AuditUtil.getColumnStringA() + (null == usedRecord.getId() ? "" : "," + usedRecord.getId().toString()));
				} else {
					AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringB())){
					AuditUtil.setColumnStringB(AuditUtil.getColumnStringB() + (null == usedRecord.getId() ? "" : "," + usedRecord.getId().toString()));
				} else {
					AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
				}
				if(!StringUtils.isEmpty(AuditUtil.getColumnStringC())){
					AuditUtil.setColumnStringC(AuditUtil.getColumnStringC() + (null == usedRecord.getId() ? "" : "," + usedRecord.getId().toString()));
				} else {
					AuditUtil.setColumnStringC(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
				}
			}
		}
		
		for(UsedRecord usedRecord : usedRecords){
			beforeDeleteUsedRecord(usedRecord);
		}
		
		
		/**
		 * 真删
		 * 增加SQL/HQL执行的数据日志记录
		 */
		if(usedRecords != null && usedRecords.size() > 0 ){
			for(UsedRecord usedRecord : usedRecords){
				List<String> propertyNames = new ArrayList<String>();
				List<Object> previousState = new ArrayList<Object>();
				java.lang.reflect.Field[] fields = UsedRecord.class.getDeclaredFields();
				try {
					for(java.lang.reflect.Field field : fields){
						field.setAccessible(true);
						try{
							field.get(null);
							continue;
						}catch(NullPointerException e){
							if(field.getName().equalsIgnoreCase("bapAttachmentInfo")
									||field.getName().equalsIgnoreCase("document")
									||field.getName().equalsIgnoreCase("company")){
								continue;
							}
							propertyNames.add(field.getName());
							previousState.add(field.get(usedRecord));
						}
					}
					dataAuditLogService.saveCustomerAudit(InternationalResource.get("foundation.common.delete"),usedRecord, usedRecord.getId(), null, previousState.toArray(), propertyNames.toArray(new String[propertyNames.size()]));
				} catch (IllegalArgumentException | IllegalAccessException e) {
				}
			}
		}
		if(usedRecordIds != null && usedRecordIds.size() > 0) {
			String hql = "delete " + UsedRecord.JPA_NAME + " where id in(:ids)";
			Query query = usedRecordDao.createQuery(hql);
			query.setParameterList("ids", usedRecordIds);
			query.executeUpdate();
		}
		
		for(UsedRecord usedRecord : usedRecords){
			afterDeleteUsedRecord(usedRecord);
		}
		
		if(eventTopic==null){
			for(UsedRecord usedRecordz : usedRecords){
				usedRecordz.setValid(false);
				List<UsedRecord> params = new ArrayList<UsedRecord>();
				params.add(usedRecordz);
				Map<String, Object> props = new HashMap<String, Object>();
				props.put("callType", "service");
				props.put("entityCode", "X6Basic_1.0_meetingroom");
				props.put("eventType", "delete");
			}
		}
	}

	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(long usedRecordId, int usedRecordVersion){
		this.deleteUsedRecord(usedRecordId, usedRecordVersion,null);
	}
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(long usedRecordId, int usedRecordVersion,SignatureLog signatureLog){
		UsedRecord usedRecord = getUsedRecord(usedRecordId);
		if(usedRecord != null && !usedRecord.isValid()){
			throw new BAPException(BAPException.Code.OBJECT_HAVE_BEAN_DELETED);
		}
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		beforeDeleteUsedRecord(usedRecord);
		usedRecordDao.delete(usedRecordId, usedRecordVersion);
		afterDeleteUsedRecord(usedRecord);
		usedRecordDao.flush();
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		params.add(usedRecord);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		props.put("eventType", "delete");
		
		if(signatureLog != null ) {
			Object businessKey=null;
			businessKey=usedRecord.getId();
			signatureLog.setTableId(usedRecord.getId());
			if(businessKey != null) {
				if(StringUtils.isEmpty(signatureLog.getBusinessKey())){
					signatureLog.setBusinessKey(businessKey.toString());
				} else {
					signatureLog.setBusinessKey(signatureLog.getBusinessKey() + "," + businessKey.toString());
				}
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
		}
		
	}
	
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(String usedRecordIds){
		this.deleteUsedRecord(usedRecordIds,null);
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.delete",operType="3")
	public void deleteUsedRecord(String usedRecordIds,SignatureLog signatureLog){
		deleteCollection(usedRecordIds,signatureLog);
	}
	
	private void deleteCollection(String ids,SignatureLog signatureLog) {
		if(ids.isEmpty()){
			throw new BAPException("ec.common.checkselected");
		}
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			String version = idVersion.split("@")[1];
			if (id != null && id.trim().length() > 0 && version != null && version.trim().length() > 0) {
				deleteUsedRecord(Long.valueOf(id), Integer.valueOf(version),signatureLog);
			}
		}
		if(null != signatureLog){
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			String msgId="moduleCode:X6Basic_1.0#entityCode:X6Basic_1.0_meetingroom#modelCode:X6Basic_1.0_meetingroom_UsedRecord#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.engine.restore",operType="10")
	public void restoreUsedRecord(String usedRecordIds){
		restoreCollection(usedRecordIds);
	}
	
	public void restoreCollection(String ids) {
		String[] idst = ids.split(",");
		for(String idVersion : idst) {
			String id = idVersion.split("@")[0];
			if (id != null && id.trim().length() > 0) {
				restoreUsedRecord(Long.valueOf(id));
			}
		}
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.engine.restore",operType="10")
	public void restoreUsedRecord(long usedRecordId){
		
		findBusinessKeyUsed(usedRecordId);	//判断业务主键是否重复
		
		UsedRecord usedRecord = getUsedRecord(usedRecordId);
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		beforeRestoreUsedRecord(usedRecord);
		usedRecord.setValid(true);
		usedRecordDao.update(usedRecord);
		afterRestoreUsedRecord(usedRecord);
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		params.add(usedRecord);
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		props.put("eventType", "restore");
	}
	
	public void findBusinessKeyUsed(long usedRecordId){
		Property property = modelServiceFoundation.getBussinessProperty("X6Basic_1.0_meetingroom_UsedRecord");
		if(property != null){
			String propertyName = property.getColumnName();
			String sql  = "select * from " + UsedRecord.TABLE_NAME + " where valid = 1 and " + 
					propertyName + " =  (select "+ propertyName +" from "+ UsedRecord.TABLE_NAME +" where id = ? )";
			List<Object> list =  usedRecordDao.createNativeQuery(sql,usedRecordId).list();
			if(list.size() > 0){
				throw new BAPException("foundation.bussinessKey.repeat");
			}
			
		}
	}
	
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.batch.import",operType="4")
	public  void batchImportBaseUsedRecord(List<UsedRecord>  usedRecords){
		for(UsedRecord usedRecord:usedRecords)  {
			saveUsedRecord(usedRecord, null, null, null);
		}
	}
	
	@Override
	public  void excelBatchImportBaseUsedRecord(List<UsedRecord>  usedRecords){
		for(UsedRecord usedRecord:usedRecords)  {
			saveUsedRecord(usedRecord, null);
		}
	}
	
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.flow.save")
	public void saveUsedRecord(UsedRecord usedRecord, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		saveUsedRecord(usedRecord, dgLists,dgDeleteIDs,assFileUploads, null);
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.flow.save")
	public void saveUsedRecord(UsedRecord usedRecord, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads, String viewCode){
		saveUsedRecord(usedRecord, dgLists,dgDeleteIDs,assFileUploads, viewCode, null,null);
	}


	public void generateUsedRecordCodes(UsedRecord usedRecord) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateUsedRecordCodes(usedRecord, false);
	}
	
	public void generateUsedRecordCodes(UsedRecord usedRecord, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	public void generateUsedRecordSummarys(UsedRecord usedRecord) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		generateUsedRecordSummarys(usedRecord, false);
	}

	public void generateUsedRecordSummarys(UsedRecord usedRecord, Boolean viewIsView) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void saveUsedRecord(UsedRecord usedRecord,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic,boolean... isImport){
		this.saveUsedRecord(usedRecord, dgLists,dgDeleteIDs,assFileUploads, viewCode, eventTopic,null,isImport);
	}

	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void saveUsedRecord(UsedRecord usedRecord,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads,String viewCode, String eventTopic, SignatureLog signatureLog,boolean... isImport){
		boolean isNew = false;
		String entityCode = "X6Basic_1.0_meetingroom";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		String url = null;
		if(usedRecord.getId() != null && usedRecord.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/add";
		}
		List<Event> events = null;
		Boolean viewIsView = false;
		if(viewCode != null && !viewCode.trim().isEmpty()){
			View view = viewServiceFoundation.getView(viewCode);
			if(null != view) {
				viewIsView = (view.getType() == ViewType.VIEW);
			}
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, usedRecord);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord, viewIsView);

		if (viewIsView) {
			usedRecordDao.saveWithRevertVersion(usedRecord);
		} else {
			if(isNew)
				usedRecordDao.save(usedRecord);
			else
				usedRecordDao.merge(usedRecord);
		}
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		dealDatagridsSave(usedRecord,viewCode,dgLists,dgDeleteIDs,assFileUploads);
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateUsedRecordCodes(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateUsedRecordSummarys(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveUsedRecord(usedRecord, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, usedRecord);
			}
		}
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		usedRecordDao.flush();
		usedRecordDao.clear();
		usedRecord = usedRecordDao.load(usedRecord.getId());
		
		
		params.add(usedRecord);
		
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=usedRecord.getId();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(usedRecord.getId());
			String msgId="moduleCode:X6Basic_1.0#entityCode:X6Basic_1.0_meetingroom#modelCode:X6Basic_1.0_meetingroom_UsedRecord#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	private void executeGScript(String entityCode, String scriptType, List<Event> events, UsedRecord usedRecord){
		for(Event e : events){
			if(e.getName().equals(scriptType)){
				if(e.getFunction()!=null && e.getFunction().length() > 0){
					try{
						Script script = scriptService.get(entityCode, e.getFunction());
						if (null == script || null == script.getCode()) {
							throw new BAPException("could not found the script.");
						}
						// 调用执行脚本方法
						Map<String, Object> variables = new HashMap<String, Object>();
						variables.put("db", DbUtils.getInstance());
						variables.put("usedRecord", usedRecord);
						variables.put("userId", getCurrentUser().getId().toString());
						Object retObj = EngineScriptExecutor.eval(script.getCode(), variables);
					}catch(Exception ex){
						log.warn(ex.getMessage());
					}
				}
				break;
			}
		}
	}

	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void mergeUsedRecord(UsedRecord usedRecord, Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord);
		usedRecordDao.merge(usedRecord);
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		dealDatagridsSave(usedRecord,null,dgLists,dgDeleteIDs,assFileUploads);

		afterSaveUsedRecord(usedRecord);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Page<UsedRecord> findUsedRecords(Page<UsedRecord> page, Criterion... criterions) {
		return usedRecordDao.findByPage(page, criterions);
	}
	private static String matchSql(Pattern p, String sql, String prefix, Map<String, String> maps, int n1, int n2) {
		Matcher matcher = p.matcher(sql);
		int i = 1;
		if (null == maps)
			maps = new HashMap<String, String>();
		while (matcher.find()) {
			String tag = (matcher.group(n1));// 含引号
			String tag2 = (matcher.group(n2));// 不含引号
			String symbol = prefix + i++;
			sql = sql.replace(tag, symbol);
			maps.put(symbol, tag2);
		}
		return sql;
	}
	
	private static String replaceSql(Pattern p, String sql, Map<String, String> maps, int n1, int n2) {
		Matcher matcher = p.matcher(sql);
		while (matcher.find()) {
			String tag = matcher.group(n1);
			String tag2 = matcher.group(n2);
			for(Map.Entry<String, String> entry : maps.entrySet()) {
				if(entry.getValue().equals(tag)) {
					sql = sql.replace(tag2,entry.getKey());
				}
			}
		}
		return sql;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findUsedRecords(Page<UsedRecord> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment,Boolean noQueryFlag,String exportSql, Map exportMap, List<Param> params) {
		findUsedRecords(page,  viewCode, type, processKey, flowBulkFlag, hasAttachment, params, viewCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findUsedRecords(Page<UsedRecord> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findUsedRecords(Page<UsedRecord> page,  String viewCode, int type, String processKey,Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
		commonQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, exportMap, objects);
	}
	
	/**
	 * 生成自定义字段查询sql
	 * @param viewCode 视图code
	 * @param sql 查询sql
	 * @return
	 */
	public String generateCustomPropertySql(String viewCode, String sql) {
		View v = viewServiceFoundation.getView(viewCode);
		if (v != null && v.getHasCustomSection() != null && v.getHasCustomSection()) {
			StringBuilder selectSql = new StringBuilder();
			StringBuilder joinSql = new StringBuilder();
			List<CustomPropertyViewMapping> viewMapppingList = viewServiceFoundation.getCustomPropertyViewMappings(viewCode);
			if (viewMapppingList != null && viewMapppingList.size() > 0) {
				Set<String> propLayRecSet = new HashSet<String>();
				for (CustomPropertyViewMapping viewMapping : viewMapppingList) {
					if (viewMapping.getPropertyLayRec() != null && viewMapping.getPropertyLayRec().length() > 0) {
						String[] layRecArr = viewMapping.getPropertyLayRec().split("\\|\\|");
						if (!layRecArr[0].contains(".")) {
						    if (null != sql && sql.indexOf(viewMapping.getProperty().getColumnName()) == -1) {
								selectSql.append(",\"").append(layRecArr[0]).append("\".").append(viewMapping.getProperty().getColumnName()).append(" AS ")
										.append("\"").append(viewMapping.getProperty().getName()).append("\"");
							}
						} else {
							propLayRecSet.add(viewMapping.getPropertyLayRec());
							String modelAlias = layRecArr[0].substring(layRecArr[0].indexOf(".") + 1);
							if (null != sql && sql.indexOf(viewMapping.getProperty().getColumnName()) == -1) {
								selectSql.append(",\"cp_").append(modelAlias).append("\".").append(viewMapping.getProperty().getColumnName()).append(" AS ")
										.append("\"cp_").append(modelAlias).append(".").append(viewMapping.getProperty().getName()).append("\"");
							}
						}
					}
				}
				if (propLayRecSet != null && propLayRecSet.size() > 0) {
					Set<String> tmpPropLayRecSet = new HashSet<String>();
					tmpPropLayRecSet.addAll(propLayRecSet);
					for (Iterator<String> iter = propLayRecSet.iterator(); iter.hasNext();) {
						String propLayRec = iter.next();
						String alias1 = propLayRec.split("\\|\\|")[0];
						for (String tmpPropLayRec : tmpPropLayRecSet) {
							String alias2 = tmpPropLayRec.split("\\|\\|")[0];
							if (!alias2.equals(alias1) && alias2.startsWith(alias1)) {
								iter.remove();
								break;
							}
						}
					}
					for (String propLayrec : propLayRecSet) {
						String[] layRecArr = propLayrec.split("\\|\\|");
						String modelAlias = layRecArr[0].substring(layRecArr[0].indexOf(".") + 1);
						String mainModelAlias = layRecArr[0].substring(0, layRecArr[0].indexOf("."));
						String[] modelAliasTuple = modelAlias.split("\\.");
						String[] relations = layRecArr[1].split("\\-");
						String modelAlias1 = "";
						String modelAlias2 = "";
						for (int i = 0; i < relations.length; i++) {
							String[] relationArr = relations[i].split(",");
							String tableName1 = relationArr[0];
							String colName1 = relationArr[1];
							// String tableName2 = relationArr[2];
							String colName2 = relationArr[3];
							modelAlias1 += (i > 0 ? "." + modelAliasTuple[i] : modelAliasTuple[i]);
							if (i > 0) {
								modelAlias2 += (i > 1 ? "." + modelAliasTuple[i - 1] : modelAliasTuple[i - 1]);
							}
							joinSql.append(" LEFT OUTER JOIN ").append(tableName1).append(" \"cp_").append(modelAlias1).append("\"").append(" ON \"cp_")
									.append(modelAlias1).append("\".").append(colName1).append(" = \"");
							if (i > 0) {
								joinSql.append("cp_").append(modelAlias2);
							} else {
								joinSql.append(mainModelAlias);
							}
							joinSql.append("\".").append(colName2);
						}
					}
				}
				if (selectSql.length() > 0) {
					sql = sql.substring(0, sql.indexOf(" FROM ")) + selectSql.toString() + sql.substring(sql.indexOf(" FROM "));
					if (joinSql.length() > 0) {
						sql += joinSql.toString();
					}
				}
			}
		}
		return sql;
	}
	
	/**
	 * @param page
	 * @param viewCode
	 * @param type
	 * @param processKey
	 * @param flowBulkFlag
	 * @param hasAttachment
	 * @param params
	 * @param permissionCode
	 */
	@SuppressWarnings("unchecked")
	public void commonQuery(Page<UsedRecord> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, Map exportMap, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = "";
		String dgCode = "";
	
		if(viewCode.split(",").length < 2){
			sql = sqlService.getSqlQuery(viewCode, type);
		}else{
			dgCode = viewCode.split(",")[1];
			viewCode = viewCode.split(",")[0];
			sql = sqlService.getDGSqlQuery(dgCode,type);
		}
		//如果存在导出下配置的sql则进行替换
		
		if(!exportSql.trim().isEmpty() ) {
			if(page.isExportFlag() && sql != null && sql.contains("LEFT OUTER JOIN")){//如果用于导出，sql里的left outer join的内容拼到exportSql里
				String sql2 = sql;
				if(sql2.contains("LEFT OUTER JOIN")){
					sql2 = sql2.substring(sql2.indexOf("LEFT OUTER JOIN"), sql2.length());
					String tableNames[] = sql2.split("LEFT OUTER JOIN");
					for(String str : tableNames){
						if(str!=null && !str.equals("") && str.contains(" ON ")){
							String tableNames2[] = str.split(" ON ");
							if(tableNames2[0]!=null && !tableNames2[0].equals("") && !exportSql.contains(tableNames2[0].trim())){
								exportSql += " LEFT OUTER JOIN" + str;
							}
						}
					}
					sql = exportSql;
				}	
			}else{//如果存在导出下配置的sql则进行替换
				sql=exportSql;	
			}
		} 
		 
		// 自定义字段sql拼接
		sql = generateCustomPropertySql(viewCode, sql);
		String countSql = null;
		if(null != dgCode && !"".equals(dgCode)){
			countSql = sqlService.getDGSqlQuery(dgCode,Sql.TYPE_USED_TOTALS);
		}else{
			countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS);
		}
		if(!exportSql.trim().isEmpty())  {
			//FIXME  有小节配置时,需要将小节信息加入
			countSql="SELECT COUNT(*) count FROM ";	
		}
		User currentUser=(User)getCurrentUser();
		if(sql == null){
			sql = "";
		}
		StringBuilder totalSql = new StringBuilder(sql);
		Boolean crossCompanyFlag = null;
		if (null != sql && sql.length() > 0) {
			StringBuilder s = new StringBuilder();
			StringBuilder queryCond = new StringBuilder();
			List<Object> list = new ArrayList<Object>();
			Map<String,Object> customerSqlListMap = new HashMap<String,Object>();
			boolean hasWhere = false;
			String referenceCondition = "";
			String customerSql = "";
			String customerCondition = "";
			String classifySql = "";
			if (null != params && !params.isEmpty()) {
				Param param = params.get(0);
				if("crossCompanyFlag".equals(param.getName())){
					crossCompanyFlag = Boolean.parseBoolean(param.getValue().toString());
					params.remove(0);
				}
			}
			StringBuilder sortOrderByStr = new StringBuilder("");
			if (null != params && !params.isEmpty()) {
				s.append(" WHERE ((");
				hasWhere = true;
				String advQuery = "";
				String classifyCodes = "";
				List<Object> advValues = null;
				String fastQuery = "";
				List<Object> fastValues = null;
				String extraQuery = "";
				List<Object> customerValues = null;
				List<Object> extraQueryValues = null;
				List<Object> customerSqlValues = null;
				List<Object> classifySqlValues = null;
				//组合where条件
				for (int i = 0; i < params.size(); i++) {
					Param param = params.get(i);
					
					if("classifySql".equals(param.getName())){
						classifySql = (String) param.getValue();
						continue;
					}
					
					if("classifySqlValues".equals(param.getName())){
						classifySqlValues = (List<Object>) param.getValue();
						continue;
					}
					
					if(type == Sql.TYPE_LIST_REFERENCE && "referenceCondition".equals(param.getName())) {
						referenceCondition = (String) param.getValue();
						continue;
					}
					
					if("customerValues".equals(param.getName())){
						customerValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerSqlValues".equals(param.getName())){
						customerSqlValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerSqlListMap".equals(param.getName())){
						customerSqlListMap = (Map<String,Object>) param.getValue();
						continue;
					}
					if("customerCondition".equals(param.getName())){
						customerCondition = (String) param.getValue();
						continue;
					}
					if("customerSql".equals(param.getName())){
						customerSql = (String)param.getValue();
						continue;
					}
					
					if ("advQueryCond".equals(param.getName())) {
						AdvQueryCondition cond = conditionService.toSql((String) param.getValue());
						if (cond != null) {
							advValues = cond.getValues();
							advQuery = cond.getSql();
						}
						continue;
					}
					//数据分类内的高级查询
					if ("classifyCodes".equals(param.getName())) {
						classifyCodes = (String)param.getValue();
						continue;
					}
					
					if ("fastQueryCond".equals(param.getName())) {
						AdvQueryCondition cond = conditionService.toSql((String) param.getValue());
						if (cond != null) {
							fastValues = cond.getValues();
							fastQuery = cond.getSql();
						}
						continue;
					}
					
					if ("extraQueryCond".equals(param.getName())) {
						Map<String,String> oneToManyParams = new HashMap<String,String>();
						oneToManyParams = (Map<String, String>) param.getValue();
						String json = sqlService.getExtraQueryJson(viewCode);
						Pattern oneToManyPattern = Pattern.compile("(\"value\":\")(\\$\\$.*?\\$\\$)(\")");
						Matcher matcher = oneToManyPattern.matcher(json);
						while (matcher.find()) {
							String tag = (matcher.group(2));
							String subTag = tag.substring(2, tag.length()-2);
							if(null != oneToManyParams.get(subTag) && ((String)(oneToManyParams.get(subTag))).length() > 0) {
								json = json.replace(tag, oneToManyParams.get(subTag).replace("\"", "SYMBOL_DOUBLE_QUOTE"));
							} else {
								json = json.replace(tag, "");
							}
						}
						if(null != json && json.length() > 0) {
							AdvQueryCondition cond = conditionService.toSql(json);
							if (cond != null) {
								extraQueryValues = cond.getValues();
								extraQuery = cond.getSql();
							}
						}
						continue;
					}
					if ("dataTable-sortColKey".equals(param.getName())) {
						String sortValue = (String) param.getValue();
						String key = null, columnName = null,customKey = null;
						if(sortValue.indexOf("::") > 0) {
							key = sortValue.split("::")[0];
							columnName = sortValue.split("::")[1];
							if(key.indexOf(".") > 0 && key.contains("attrMap")){//自定义字段
								key = key.split("\\.")[1];
								if(key.startsWith("cp_")){//判断排序字段是否是关联模型的字段
									key = key.substring(3).replace("_", ".");
								}
							}
						} else if (sortValue.indexOf(".") > 0){
							customKey = sortValue.split("\\.")[0];
							if(customKey.contains("attrMap")){
								key =customKey;
								columnName = sortValue.split("\\.")[1];
							}else{
								key = sortValue;
							}
						} else {
							key = sortValue;
						}
						int lastDotPos = key.lastIndexOf('.');
						if(null == columnName) {
							columnName = Inflector.getInstance().columnize(key.substring(lastDotPos + 1));
						}
						String tableAlias = lastDotPos < 0 ? "\"usedRecord\"" : "\"" + key.substring(0, lastDotPos) + "\"";
						if("\"pending\"".equals(tableAlias)) {
							tableAlias = "\"p\"";
						}
						sortOrderByStr.append(tableAlias).append(".").append(columnName);
						continue;
					}
					if ("dataTable-sortColOrder".equals(param.getName())) {
						sortOrderByStr.append(" ").append((String) param.getValue());
						continue;
					}
					if(param.getName()!=null&&param.getName().startsWith("\"tree-")){
						if(param.getName().startsWith("\"tree-layRec-")){
							String treeCondition = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TREE);
							if (treeCondition!=null && treeCondition.trim().length() > 0) {
								if (hasWhere){
									s.append(" AND ");
								}else{
									s.append(" WHERE (");
									hasWhere = true;
								}
									
								s.append(treeCondition);
								if(param.getLikeType() == Param.EQUAL_LIKELEFT) {
									list.add(param.getValue());
									list.add((String) param.getValue()+"-%");
								} 
								if(param.getLikeType() == Param.LIKE_UNSUPPORT) { 
									list.add(param.getValue());
								}
							}
						}
						continue;
					}
					if(param.getName()!=null&&!param.getName().startsWith("\"tree-") && param.getLikeType() == Param.EQUAL_LIKELEFT){
						s.append(" AND ( ").append(param.getName()).append("= ? ").append(" OR ")
							.append(param.getName()).append(" like ? )");
						list.add(param.getValue());
						list.add(param.getValue()+"-%");
						continue;
					}
					if (i > 0){
						s.append(" AND ");
					}
					if((null != param.getContainLower() && param.getContainLower())) {
						s.append(" ( ");
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(" UPPER (");
							}
						}
					}
					if(param.getLikeType() != Param.MULTI_LIKE) {
						s.append(param.getName());
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(") ");
							}
						}
					}
					String exp = " = ?";
					if (param.getLikeType() == Param.LIKE_UNSUPPORT) {
						s.append(" = ?");
					} else if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_LEFT) {
						s.append(" LIKE ?");
						exp = " LIKE ?";
					} else if(param.getLikeType() == Param.GREATE_EQUAL) {
						s.append(" >= ?");
						exp = " >= ?";
					}else if(param.getLikeType() == Param.LESS_EQUAL) {
						s.append(" <= ?");
						exp = " <= ?";
					}else if (param.getLikeType() == Param.GREATE_THAN) {
						s.append(" > ?");
						exp = " > ?";
					}else if (param.getLikeType() == Param.LESS_THAN) {
						s.append(" < ?");
						exp = " < ?";
					}else if (param.getLikeType() == Param.NONE_EQUAL) {
						s.append(" <> ?");
						exp = " <> ?";
					}else if (param.getLikeType() == Param.MULTI_LIKE) {
						exp = " LIKE ?";
						String multiValue = param.getValue().toString();
						String[] values = multiValue.split(",");
						StringBuilder multiSb = new StringBuilder();
						for(int m = 0; m < values.length; m++) {
							if(null != values[m] && values[m].length() > 0) {
								multiSb.append(" OR ");
								multiSb.append(param.getName()).append(" LIKE ? ");
								list.add("%," + values[m] + ",%");
							}
						}
						if(multiSb.length() > 0) {
							s.append(" ( ");
							s.append(multiSb.toString().substring(4));
							s.append(" ) ");
						}
					}else {}
					if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT) {
						String upperStr = (String) param.getValue();
						if(!param.getCaseSensitive()) {
							upperStr = upperStr.toUpperCase();
						}
						if(param.getLikeType() == Param.LIKE_ALL) {
							param.setValue('%' + upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_LEFT) {
							param.setValue(upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_RIGHT) {
							param.setValue('%' + upperStr);
						}	
					}
					if(param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						} else {
							if(param.getValue() instanceof String){
								String upperStr = (String) param.getValue();
								if(!param.getCaseSensitive()) {
									upperStr = upperStr.toUpperCase();
								} 
								param.setValue(upperStr);
							} else {
								param.setValue(param.getValue());
							}
						}
					}
					if(param.getLikeType() == Param.GREATE_EQUAL || param.getLikeType() == Param.GREATE_THAN || param.getLikeType() == Param.LESS_EQUAL || param.getLikeType() == Param.LESS_THAN) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						}					

					}
					
					if(param.getLikeType() != Param.MULTI_LIKE) {
						list.add(param.getValue());
					}
					if(null != param.getContainLower() && param.getContainLower()) {
						String prefix = param.getName().substring(0, param.getName().lastIndexOf("."));
						String columnName = param.getName().substring(param.getName().lastIndexOf(".") + 1);
						if(null != param.getModelInfo() && param.getModelInfo().length > 0) {
							String entityInfo = (param.getModelInfo())[0];
							String serviceInfo = (param.getModelInfo())[1];
							String layRecColumnName = null;
							if(param.getModelInfo().length > 2) {
								layRecColumnName = (param.getModelInfo())[2];
							}
							ServiceReference ref = bundleContext.getServiceReference(serviceInfo);
							List<String> layRecs = null;
							if(null != ref) {
								IModelTreeLayRecService layRecService = (IModelTreeLayRecService) bundleContext.getService(ref);
								layRecs = layRecService.getContainLower(entityInfo, Inflector.getInstance().columnToField(columnName), exp, param.getValue(), false);
							}
							if(null != layRecs && !layRecs.isEmpty()) {
								String layRecCond = "";
								for (String layRec : layRecs) {
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " = ?";
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " like ?";
									list.add(layRec);
									list.add(layRec + "-%");
								}
								s.append(layRecCond);
							}
							s.append(" ) ");
						}
					}
				}
					if (advQuery != null && advQuery.length() > 0) {
						s.append(" AND ").append(advQuery);
						if (advValues != null) {
							list.addAll(advValues);
						}
					}
					if (fastQuery != null && fastQuery.length() > 0) {
						s.append(" AND ").append(fastQuery);
						if (fastValues != null) {
							list.addAll(fastValues);
						}
					}
					if (extraQuery != null && extraQuery.length() > 0) {
						s.append(" AND ").append(extraQuery);
						if (extraQueryValues != null) {
							list.addAll(extraQueryValues);
						}
					}
					if(customerCondition !=null && customerCondition.length()>0){
						s.append(" AND ").append(customerCondition);
						if(customerValues!=null && customerValues.size()>0){
							list.addAll(customerValues);
						}
					}
					if(customerSql != null && customerSql.length()>0){
						s.append(" AND ").append(customerSql);
						if(customerSqlValues!=null && customerSqlValues.size()>0){
							list.addAll(customerSqlValues);
						}
					}
					if(classifySql != null && classifySql.length() > 0){
						s.append(" AND (").append(classifySql).append(")");
						if(classifySqlValues != null && classifySqlValues.size() > 0){
							list.addAll(classifySqlValues);
						}
					}
					
					if(type == Sql.TYPE_LIST_REFERENCE){
						if(null != crossCompanyFlag && !crossCompanyFlag && !getCurrentCompanyId().equals(1L)){
							s.append(" AND \"usedRecord\".CID in (1,").append(getCurrentCompanyId()+")");
						}
					}
					
	//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
	//					if(type == Sql.TYPE_LIST_PENDING) {
	//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_QUERY){
	//						s.append(" AND \"usedRecord\".CID = ").append(getCurrentCompanyId());
	//					} else if(type == Sql.TYPE_LIST_REFERENCE){
	//						if(null != crossCompanyFlag && !crossCompanyFlag){
	//							s.append(" AND \"usedRecord\".CID = ").append(getCurrentCompanyId());
	//						}
	//					}
	//				}
					s.append(" ) ");
			}
			// ////PowerCondition

			//组合自定义条件
			String customCondition=getCustomCondition(page, viewCode, type, processKey, params,list);
			if (customCondition!=null&&customCondition.trim().length() > 0) {
				if (hasWhere){
					s.append(" AND ");
				}else{
					s.append(" WHERE (");
					hasWhere = true;
				}
					
				s.append(customCondition);
			}
			s.append(") ");
			
			if (hasWhere){
				s.append(" AND ");
			}else{
				s.append(" WHERE ");
				hasWhere = true;
			}
			s.append(" ( \"usedRecord\".MEETING IN ( SELECT ID FROM X6BASIC_MEETING_ROOMS \"meetingRoom\" ");
			//一个实体只有一个权限操作
			String powerCode = viewCode + "_self";
			View view = viewServiceFoundation.getView(viewCode);
			ExtraView extraView = null;
			boolean isTreeView=false;
			boolean needPermission = true;
			if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
				if(view.getShowType().equals(ShowType.PART)){
					//取布局视图
					View layoutView = viewServiceFoundation.getView(permissionCode);
					if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
						needPermission = false;
					}
					if(null == layoutView) {
						layoutView = getLayoutView(permissionCode);
						if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
							needPermission = false;
						}	
					}
				} else {
					if(null != view && !view.getIsPermission()){//未启用权限
						needPermission = false;
					}
				}
			}
			if(needPermission){
				if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
					if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
						powerCode = "X6Basic_1.0_meetingroom" + "_" + view.getPermissionCode();
					}
				}else if(null != dgCode && !"".equals(dgCode)){
					DataGrid dataGrid = viewServiceFoundation.getDataGrid(dgCode);
					if(null != dataGrid.getDataGridType() && dataGrid.getDataGridType() == 1 && null != dataGrid.getIsPermission() && dataGrid.getIsPermission()){
						powerCode = dataGrid.getTargetModel().getCode() + "_" + dataGrid.getPermissionCode();
					}
				}
				String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
				List<Object> powerCodeList =  usedRecordDao.createNativeQuery(powerCodeSql, powerCode).list();
				if(powerCodeList.size() > 0) {
					powerCode = powerCodeList.get(0).toString();
				} else {
					String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
					List<Object> checkList =  usedRecordDao.createNativeQuery(powerOperateSql, "X6Basic_1.0_meetingroom").list();
					if(checkList.size()>0){
						powerCode = checkList.get(0).toString();
					}
				}
					String	pc = "";
					pc = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"meetingRoom\"","X6Basic_1.0_meetingroom","",false);
				if (pc.trim().length() > 0) {
					s.append(" WHERE (");
					s.append(pc);
					if(queryCond.length() > 0){
						s.append(queryCond);
					}
					s.append(")");
				} else if(queryCond.toString().trim().length() > 0){
					if(")".equals(queryCond.toString().trim())){
						s.append(queryCond);
					}else{
						s.append(" WHERE (");
						s.append(queryCond);
						s.append(")");
					}
				}
			}	
			s.append(" )");
			s.append(")");
			
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			// 开始处理排序，避免在统计时带入排序条件
			StringBuilder orderPart = new StringBuilder();
			orderPart.append(" ORDER BY ");
			String colOrderByStr = null;
			if (null != dgCode && !"".equals(dgCode)) {
				colOrderByStr = sqlService.getDGSqlQuery(dgCode,Sql.TYPE_USED_ORDERBY);
			} else {
				colOrderByStr = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_ORDERBY);
			}
			if(null != colOrderByStr && colOrderByStr.length() > 0) {
				if(sortOrderByStr.toString().length() > 0) {
					String[] colOrderByArr = colOrderByStr.substring(1).split(",");
					String[] sortOrderByArr = sortOrderByStr.toString().split(" ");
					Boolean flag = false;
					for(String colOrderBy : colOrderByArr) {
						if(colOrderBy.indexOf(sortOrderByArr[0] + " ") > -1) {
							colOrderByStr = colOrderByStr.replace(colOrderBy, sortOrderByStr.toString());
							flag = true;
							break;
						}
					}
					if(!flag) {
						orderPart.append(sortOrderByStr).append(",");
					} 
					orderPart.append(colOrderByStr.substring(1)).append(",");
				} else {
					orderPart.append(colOrderByStr.substring(1)).append(",");
				}
			} else {
				if(sortOrderByStr.toString().length() > 0) {
					orderPart.append(sortOrderByStr.toString()).append(",");
				} 
			}
			if(type == Sql.TYPE_LIST_PENDING) {
				orderPart.append(" \"p\".ID DESC");
			} else {
				if(isTreeView) {
					orderPart.append(" \"usedRecord\".LAY_REC ASC, \"usedRecord\".SORT ASC");
				} else {
					orderPart.append(" \"usedRecord\".ID DESC");
				}
			}
			Object[] arr = list.toArray();
			totalSql.append(s);
			String realSql = totalSql.toString() + orderPart.toString();
			Map<String, String> maps = new HashMap<String, String>();
			countSql += " ( " + totalSql.toString() + " ) T";
			// 突破ORACLE 30个字符限制
			if(DbUtils.getDbName().equals("oracle")){
			realSql = matchSql(pattern, realSql, "T", maps, 2, 4);
			countSql = replaceSql(pattern, countSql, maps, 4, 2);
			realSql = matchSql(p, realSql, "E", null, 4, 6);
			countSql = matchSql(p, countSql, "E", null, 4, 6);
			//组织总条数，合计SQL
			countSql = replaceSql(countPattern, countSql, maps, 4, 2);
			if(isTreeView) {
				page.setPaging(false);
			}
			}
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) usedRecordDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    SQLQuery query=usedRecordDao.createNativeQuery(countSql, arr);
			    if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>)query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			    if (null != resultCountList && !resultCountList.isEmpty()) {
					Map<String, Object> resultCounts = resultCountList.get(0);
					for (Map.Entry<String, Object> entry : resultCounts.entrySet()) {
						String key = entry.getKey();
						if(maps.containsKey(key)) {
							key = (String) maps.get(key);
						}
						if (key.equalsIgnoreCase("count")) {
							count = ((Number) (null == entry.getValue() ? 0 : entry.getValue())).longValue();
						} else {
							resultTotals.put(key, BigDecimal.valueOf(((Number) (null == entry.getValue() ? 0 : entry.getValue())).doubleValue()));
						}
					}
			    }
			    if(!page.isExportFlag() && !page.isPaging() && count > page.getMaxPageSize()) {
			    	throw new BAPException(BAPException.Code.RESULT_COUNT_EXCEED_MAX_PAGE_SIZE);
			    }
			    page.setTotalCount(count);
			    page.setResultTotals(resultTotals);
			}
			if(!noQueryFlag)  {
				SQLQuery query = usedRecordDao.createNativeQuery(realSql, arr);
				if(customerSqlListMap!=null&&!customerSqlListMap.isEmpty()){
					for(String key:customerSqlListMap.keySet()){
						query.setParameterList(key, (Object[])customerSqlListMap.get(key));
					}
				}
				List<UsedRecord> result = new ArrayList<UsedRecord>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(UsedRecord.class,usedRecordDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(UsedRecord.class,usedRecordDao,maps));
				}
				modelServiceFoundation.initCacheData();
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (UsedRecord usedRecord : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(usedRecord.getId(), "X6Basic_meetingroom_usedRecord");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(usedRecord.getId(), "X6Basic_meetingroom_usedRecord");
							if(null != documents && !documents.isEmpty()) {
								usedRecord.setDocument(documents.get(0));
								usedRecord.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (UsedRecord usedRecord : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, dgCode, result); // 获取配置的关联模型字段的结果集
				}
			}
		}
	}
	
	
	private View getLayoutView(String permissionCode) {
		if(null!=permissionCode&&permissionCode.indexOf("X6Basic_1.0_meetingroom")!=-1) {
				String personalCode=permissionCode.substring(permissionCode.indexOf("X6Basic_1.0_meetingroom")+"X6Basic_1.0_meetingroom".length()+1);
				if(null!=personalCode&&personalCode.trim().length()>0)  {
						return viewServiceFoundation.getViewWithPermissionCode("X6Basic_1.0_meetingroom",personalCode);
				}
		}
		return null;
	}
	
	private void getConfigAssoPropsResult(String viewCode, List<UsedRecord> result) {
		getConfigAssoPropsResult(viewCode, null, result);
	}
	
	private void getConfigAssoPropsResult(String viewCode,String dataGridCode, List<UsedRecord> result) {
		View view = null;
		DataGrid dataGrid = null;
		List<Field> fields = null;
		Model origModel = null;
		if (null != dataGridCode && !"".equals(dataGridCode)) {
			dataGrid = viewServiceFoundation.getDataGrid(dataGridCode);
			fields = viewServiceFoundation.getFields(dataGrid);
			origModel = dataGrid.getTargetModel();
		} else {
			view = viewServiceFoundation.getView(viewCode);
			fields = viewServiceFoundation.getFields(view);
			origModel = view.getAssModel();
		}
		String origId = modelServiceFoundation.getPropertyColumnName(origModel, "id", false);

		List<Long> ids = new ArrayList<Long>();
		Map<Long, UsedRecord> rsMap = new HashMap<Long, UsedRecord>();
		for (UsedRecord usedRecord : result) {
			ids.add(usedRecord.getId());
			rsMap.put(usedRecord.getId(), usedRecord);
		}
		for (Field f : fields) {
			if (f.getRegionType() == RegionType.LISTPT && (f.getCode().startsWith(viewCode + "_LISTPT_ASSO_") || f.getCode().startsWith(dataGridCode + "_LISTPT_ASSO_"))) { // 关联模型字段
				Map<String, Object> map = (Map<String, Object>) SerializeUitls.deserialize(f.getConfig());
				Map<String, Object> fieldMap = (Map<String, Object>) map.get("field");
				if (fieldMap.get("assoFlag") != null && "true".equalsIgnoreCase(fieldMap.get("assoFlag").toString())) {
					String assoConfig = (String) fieldMap.get("assoConfig");
					Map<String, Object> configMap = (Map<String, Object>) SerializeUitls.deserialize(assoConfig);
					if (configMap != null && configMap.size() > 0) {
						String sepBegin1 = configMap.get("separatorBeginLevel1") == null ? "" : configMap.get("separatorBeginLevel1").toString();
						String sepEnd1 = configMap.get("separatorEndLevel1") == null ? "" : configMap.get("separatorEndLevel1").toString();
						String sepBegin2 = configMap.get("separatorBeginLevel2") == null ? "" : configMap.get("separatorBeginLevel2").toString();
						String sepEnd2 = configMap.get("separatorEndLevel2") == null ? "" : configMap.get("separatorEndLevel2").toString();

						List<Map<String, Object>> configList = (List<Map<String, Object>>) configMap.get("config");
						Map<String, Object> cfg1 = configList.get(0);
						String propertyCode1 = (String) cfg1.get("propertyCode");
						String[] propArr1 = propertyCode1.split("\\|\\|");
						Property ftProp1 = modelServiceFoundation.getProperty(propArr1[0]);
						Property prop1 = findAssoProperty(ftProp1.getModel().getCode(), origModel.getCode());
						String id1 = modelServiceFoundation.getPropertyColumnName(prop1.getModel(), "id", false);

						Property prop2 = null;
						String id2 = null;
						for (Map<String, Object> cfgMap : configList) {
							String level = String.valueOf(cfgMap.get("level"));
							if ("2".equals(level)) {
								String propertyCode2 = (String) cfgMap.get("propertyCode");
								String[] propArr2 = propertyCode2.split("\\|\\|");
								Property ftProp2 = modelServiceFoundation.getProperty(propArr2[0]);
								prop2 = findAssoProperty(ftProp2.getModel().getCode(), prop1.getModel().getCode());
								id2 = modelServiceFoundation.getPropertyColumnName(prop2.getModel(), "id", false);
								break;
							}
						}
						List<List<Map<String, Object>>> list1 = new ArrayList<List<Map<String, Object>>>();
						List<List<Map<String, Object>>> list2 = new ArrayList<List<Map<String, Object>>>();
						String lastSep2Level1 = "", lastSep2Level2 = "";
						for (int index = 0; index < configList.size(); index++) {
							Map<String, Object> cfg = configList.get(index);
							String level = String.valueOf(cfg.get("level"));
							String sep1 = cfg.get("separator1") == null ? "" : cfg.get("separator1").toString();
							String sep2 = cfg.get("separator2") == null ? "" : cfg.get("separator2").toString();
							String method = cfg.get("method") == null ? "" : cfg.get("method").toString().toUpperCase();
							String propertyCode = (String) cfg.get("propertyCode");
							String propertyType = String.valueOf(cfg.get("propertyType"));
							StringBuilder fromSql = new StringBuilder(" from ");
							StringBuilder whereSql = new StringBuilder(" where ");
							if ("1".equals(level)) {
								lastSep2Level1 = sep2;
								fromSql.append(prop1.getModel().getTableName());
								whereSql.append(prop1.getModel().getTableName()).append(".").append("VALID = 1");
							} else {
								lastSep2Level2 = sep2;
								fromSql.append(prop2.getModel().getTableName());
								whereSql.append(prop2.getModel().getTableName()).append(".").append("VALID = 1");
							}
							String[] propArr = propertyCode.split("\\|\\|");
							for (int i = 0; i < propArr.length - 1; i++) {
								Property tmpProp = modelServiceFoundation.getProperty(propArr[i]);
								Model tmpModel = tmpProp.getModel();
								Property tmpAssoProp = tmpProp.getAssociatedProperty();
								Model tmpAssoModel = tmpAssoProp.getModel();
								fromSql.append(" left join ").append(tmpAssoModel.getTableName());
								fromSql.append(" on ").append(tmpModel.getTableName()).append(".").append(tmpProp.getColumnName()).append(" = ")
										.append(tmpAssoModel.getTableName()).append(".").append(tmpAssoProp.getColumnName());
								whereSql.append(" and ").append(tmpAssoModel.getTableName()).append(".").append("VALID = 1").append(" ");
							}

							String selectSql = "select " + origModel.getTableName() + "." + origId + " AS OID";
							Property laProp = modelServiceFoundation.getProperty(propArr[propArr.length - 1]);
							if (!"".equals(method)) {
								if ("2".equals(level)) {
									selectSql += "," + prop1.getModel().getTableName() + "." + id1 + " AS ID1";
								}
								if ("COUNT".equalsIgnoreCase(method)) {
									Property laPkProperty = null;
									for (Property p : laProp.getModel().getProperties()) {
										if (p.getIsPk() != null && p.getIsPk()) {
											laPkProperty = p;
											break;
										}
									}
									selectSql += ", " + method + " (" + laProp.getModel().getTableName() + "." + laPkProperty.getColumnName() + ") AS VAL";
								} else {
									selectSql += ", " + method + " (" + laProp.getModel().getTableName() + "." + laProp.getColumnName() + ") AS VAL";
								}
							} else {
								selectSql += ", " + prop1.getModel().getTableName() + "." + id1 + " AS ID1";
								if ("2".equals(level)) {
									selectSql += ", " + prop2.getModel().getTableName() + "." + id2 + " AS ID2";
								}
								selectSql += ", " + laProp.getModel().getTableName() + "." + laProp.getColumnName() + " AS VAL";
								if("SYSTEMCODE".equals(propertyType)){
									selectSql += ", BASE_SYSTEMCODE.VALUE AS REALVAL";
								}
							}

							if ("2".equals(level)) {
								fromSql.append(" left join ").append(prop1.getModel().getTableName()).append(" on ").append(prop2.getModel().getTableName())
										.append(".").append(prop2.getColumnName()).append(" = ").append(prop1.getModel().getTableName()).append(".")
										.append(prop2.getAssociatedProperty().getColumnName());
								whereSql.append(" and ").append(prop1.getModel().getTableName()).append(".").append("VALID = 1");
							}
							fromSql.append(" left join ").append(origModel.getTableName()).append(" on ").append(prop1.getModel().getTableName()).append(".")
									.append(prop1.getColumnName()).append(" = ").append(origModel.getTableName()).append(".")
									.append(prop1.getAssociatedProperty().getColumnName());
							if("SYSTEMCODE".equals(propertyType)){
								fromSql.append(",BASE_SYSTEMCODE");
							}
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append("VALID = 1");
							whereSql.append(" and ").append(origModel.getTableName()).append(".").append(origId).append(" in (:ids)");
							if("SYSTEMCODE".equals(propertyType)){
								whereSql.append(" and ").append(laProp.getModel().getTableName() + "." + laProp.getColumnName()).append("= BASE_SYSTEMCODE.ID");
							}
							String orderSql = " order by ";
							if (!"".equals(method)) {
								whereSql.append(" group by ").append(origModel.getTableName() + "." + origId);
								if ("2".equals(level)) {
									whereSql.append(", ").append(prop1.getModel().getTableName() + "." + id1);
								} 
								orderSql += "2".equals(level) ? "ID1 ASC" : "OID ASC";
							} else {
								orderSql += "2".equals(level) ? "ID2 ASC" : "ID1 ASC";
							}
							String sql = selectSql + fromSql.toString() + whereSql.toString() + orderSql;

							List<Map<String, Object>> rs = new ArrayList<Map<String, Object>>();
							final int PERTIME = 999;
							int count = (ids.size() / PERTIME) + (ids.size() % PERTIME == 0 ? 0 : 1);
							for (int i = 0; i < count; i++) {
								rs.addAll(usedRecordDao.createNativeQuery(sql)
										.setParameterList("ids", ids.subList(PERTIME * i, PERTIME * i + (i < count - 1 ? PERTIME : (ids.size() % PERTIME))))
										.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list());
							}
							if (rs.size() > 0) {
								if("SYSTEMCODE".equals(propertyType)){
									for (Map<String, Object> m : rs) {
										String REALVAL = m.get("REALVAL") == null ? "" : String.valueOf(m.get("REALVAL"));
										m.put("VAL", sep1 + InternationalResource.get(REALVAL, getCurrentLanguage()) + sep2);
									}
								}else{
									for (Map<String, Object> m : rs) {
										if(null != m.get("VAL") && !"".equals(String.valueOf(m.get("VAL")))){
											String val = String.valueOf(m.get("VAL"));
											m.put("VAL", sep1 + val + sep2);
										}else{
											m.put("VAL", "");
										}										
									}
								}
								if ("1".equals(level)) {
									list1.add(rs);
								} else if ("2".equals(level)) {
									list2.add(rs);
								}
							}
						}
						List<Map<String, Object>> fList1 = concatListValue(list1);
						List<Map<String, Object>> fList2 = concatListValue(list2);
						if (fList2 != null) {
							for (Map<String, Object> tmpMap1 : fList1) {
								long tmpId1 = ((Number) tmpMap1.get("ID1")).longValue();
								StringBuilder val2 = new StringBuilder();
								val2.append(sepBegin2);
								for (Map<String, Object> tmpMap2 : fList2) {
									long tmpID2 = ((Number) tmpMap2.get("ID1")).longValue();
									if (tmpId1 == tmpID2) {
										val2.append((String) tmpMap2.get("VAL"));
									}
								}
								String val = val2.toString();
								if (!val.equals(sepBegin2)) {
									val = val.substring(0, val.length() - lastSep2Level2.length());
								}
								val += sepEnd2;
								tmpMap1.put("VAL", tmpMap1.get("VAL") + val);
							}
						}
						if (fList1 != null) {
							for (Long tabId : rsMap.keySet()) {
								StringBuilder val1 = new StringBuilder(sepBegin1);
								for (Map<String, Object> tmpMap1 : fList1) {
									long tmpTabId = ((Number) tmpMap1.get("OID")).longValue();
									if (tmpTabId == tabId) {
										val1.append((String) tmpMap1.get("VAL"));
									}
								}
								if (!val1.toString().equals(sepBegin1)) {
									String val = val1.toString();
									if (fList2 == null || fList2.size() < 1){
										val = val.substring(0, val.length() - lastSep2Level1.length());
									}
									val += sepEnd1;
									rsMap.get(tabId).setAttrObject(f.getCode().replace(".", "_"), val);
								}
							}
						}
					}
				}
			}
		}
	}

	private List<Map<String, Object>> concatListValue(List<List<Map<String, Object>>> list) {
		if (list.size() == 0) {
			return null;
		}
		List<Map<String, Object>> fList = list.get(0);
		for (int i = 1; i < list.size(); i++) {
			List<Map<String, Object>> tmpList = list.get(i);
			for (int j = 0; j < tmpList.size(); j++) {
				String tmpVal = (String) tmpList.get(j).get("VAL");
				Map<String, Object> map = fList.get(j);
				String val = (String) map.get("VAL");
				map.put("VAL", val + tmpVal);
			}
		}
		return fList;
	}

	private Property findAssoProperty(String origModelCode, String assoModelCode) {
		String hql = "from Property p where p.valid = true and p.model.code = ? and p.associatedProperty.model.code = ? and (p.associatedType = ? or p.associatedType = ?)";
		List<Property> list = usedRecordDao.findByHql(hql, new Object[] {origModelCode, assoModelCode, Property.ONE_TO_ONE, Property.MANY_TO_ONE});
		return list.get(0);
	}
	

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public void findDataGridPage(DataGrid dg,final Class dgClass,Page dgPage,final Object orgObj,String condition, List<Object> params){
		Map confMap=dg.getConfigMap();
		Map layoutMap = (Map) confMap.get("layout");
		Map propertyMap = (Map) layoutMap.get("listProperty");
		if(dg.getDataGridType() ==0 && Boolean.TRUE.equals(propertyMap.get("isTreeView"))){
			String conditionSql = (null != condition && condition.trim().length() > 0) ? " and " + condition : "";
			List<Object> list = new ArrayList<Object>();
			list.add(orgObj);
			if(condition != null && condition.trim().length() > 0 && params != null && params.size() > 0){
				list.addAll(params);
			} 
			//String key=dg.getTargetModel().getModelName()+fLTU(dg.getName())+((com.supcon.orchid.orm.entities.AbstractEcFullEntity)orgObj).getId();
			String orgObjId = "";
			try {
				Method method = orgObj.getClass().getMethod("getId");
				orgObjId = String.valueOf((Long) method.invoke(orgObj));
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e1) {
				log.error(e1.getMessage(), e1);
			}
			String key=dg.getTargetModel().getModelName()+fLTU(dg.getName())+orgObjId;
			String orgPropertyName=dg.getOrgProperty().getName();
			String targetModelName=fLTL(dg.getTargetModel().getModelName());
			List treeList = new ArrayList();
			Object[] daoparams=new Object[]{dgClass,key,orgPropertyName,targetModelName,conditionSql,list,new boolean[]{false}};
			try {
				Class thisclass=this.getClass();
				java.lang.reflect.Field daoField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Dao");	
				java.lang.reflect.Field serviceField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");	
				Class serviceType=serviceField.getType();
				Class daoType=daoField.getType();
				Object tree=daoType.getMethod("buildTree",Class.class,String.class,String.class,String.class,String.class,List.class,boolean[].class).invoke(daoField.get(this),daoparams);
				Tree.treeToList((com.supcon.orchid.tree.TreeNode)tree, treeList, false);
				treeList=(List)serviceType.getMethod("findByTreeDataGrid"+dg.getOrgProperty().getAssociatedProperty().getModel().getModelName(),new Class[]{Page.class}).invoke(serviceField.get(this),new Object[]{treeList});
			} catch (Exception e) {
				e.printStackTrace();
			}
			dgPage.setResult(treeList);
		}else{
			DetachedCriteria criteria = DetachedCriteria.forClass(dgClass);
			if(null != orgObj){
				criteria.add(Restrictions.eq(dg.getOrgProperty().getName(), orgObj));
			}
			criteria.add(Restrictions.eq("valid", true));
			criteria.addOrder(Order.asc("sort"));
			if(!"".equals(condition) && condition.trim().length() > 0) {
				criteria.add(Restrictions.sqlRestriction(condition.replace("\""+fLTL(dg.getTargetModel().getModelName())+"\".", "{alias}."), params.toArray(), com.supcon.orchid.jdbc.DbUtils.getHibernateTypeByJavaType(params)));
			}
			try {
				Class thisclass=this.getClass();
				java.lang.reflect.Field daoField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Dao");	
				Class daoType=daoField.getType();
				daoType.getMethod("findByPage",new Class[]{Page.class,DetachedCriteria.class}).invoke(daoField.get(this),new Object[]{dgPage,criteria});
				java.lang.reflect.Field serviceField=thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");	
				Class serviceType=serviceField.getType();
				serviceType.getMethod("findByNormalDataGrid"+dg.getOrgProperty().getAssociatedProperty().getModel().getModelName(),new Class[]{Page.class}).invoke(serviceField.get(this),new Object[]{dgPage});
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	public String fLTL(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToLower(str);
	}
	
	public String fLTU(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToUpper(str);
	}
	
	
	public List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross, List<Param> params){
		return mneCodeSearch(viewCode, showNumber, cross, params,null,null,null,null);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Object[]> mneCodeSearch( String viewCode,  int showNumber, boolean cross, List<Param> params,String refViewCode,String currentViewCode,String sqlType,String realPermissionCode){
		List<Object[]> resultList = null;
		List<Object> totalValues = new ArrayList<Object>();
		String customerSql = null;
		List<Object> customerSqlValues = null;
		String customerCondition = null;
		List<Object> customerValues = null;
		Object mneValues = null;
		Object notinValue = null;
		for(Param p : params){
			
			if("customerSql".equals(p.getName())){
				customerSql = (String) p.getValue();
				continue;
			}
			
			if("customerSqlValues".equals(p.getName())){
				customerSqlValues = (List<Object>) p.getValue();
				continue;
			}
			
			if("customerCondition".equals(p.getName())){
				customerCondition = (String) p.getValue();
				continue;
			}

			if("customerValues".equals(p.getName())){
				customerValues = (List<Object>) p.getValue();
				continue;
			}
			
			
			if("mneValues".equals(p.getName())){
				mneValues =  (Object) p.getValue();
				continue;
			}
			
			if("notinValue".equals(p.getName())){
				notinValue =  (Object) p.getValue();
				continue;
			}
		}
		
		String sql = sqlService.getSqlQuery(viewCode, Sql.TYPE_USED_MNECODE);
		if (null != sql && sql.length() > 0) {
			StringBuilder mnecodeSql = new StringBuilder();
			mnecodeSql.append(sql);
			//助记码权限,一个实体只有一个权限操作
			String  powerSql="";
			Boolean searchRefView=false;
			Boolean innerJoinAppendFlag = false;
			String  permissionCode = viewCode;
			if(realPermissionCode!=null&&!realPermissionCode.isEmpty())  {
				permissionCode = realPermissionCode;
			}
			StringBuilder sb=new StringBuilder();
			if(refViewCode!=null&&!refViewCode.equals(""))  {
				View refView=viewServiceFoundation.getView(refViewCode);
				//判断是否有参照视图,没有则抛出异常
				if(null==refView)  {
					throw new BAPException(BAPException.Code.REFERVIEW_NOT_FOUND,refViewCode);
				}	
				//未启用权限,使用主列表视图的权限
				String powerCode = permissionCode + "_self";
				boolean needPermission = true;
				if(refView.getType() == ViewType.REFERENCE || refView.getType() == ViewType.REFTREE){
					if(refView.getShowType().equals(ShowType.PART)){
						//取布局视图
						View layoutView = viewServiceFoundation.getView(permissionCode);
						if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
							needPermission = false;
						}
						if(null == layoutView) {
							layoutView = getLayoutView(permissionCode);
							if(null != layoutView && !layoutView.getIsPermission()){//未启用权限
								needPermission = false;
							}	
						}
					} else {
						if(null != refView && !refView.getIsPermission()){//未启用权限
							needPermission = false;
						}
					}
				}
				if(needPermission)  {
					if(null == refView ){
						powerCode = permissionCode;
					}else if(refView.getShowType().equals(ShowType.PART))  {
						View layoutView = viewServiceFoundation.getView(permissionCode);
						if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
							powerCode = permissionCode;
						}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
							powerCode = "X6Basic_1.0_meetingroom_UsedRecord" + "_" + layoutView.getPermissionCode();
							searchRefView=true;
						}
						if(null == layoutView)  {
							layoutView = getLayoutView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "X6Basic_1.0_meetingroom_UsedRecord" + "_" + layoutView.getPermissionCode();
							}
						}
					} else if(refView.getIsPermission() && refView.getPermissionCode().trim().length() > 0){
						powerCode ="X6Basic_1.0_meetingroom_UsedRecord" + "_" + refView.getPermissionCode();
						searchRefView=true;
					}
					String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
					List<Object> powerCodeList =  usedRecordDao.createNativeQuery(powerCodeSql, powerCode).list();
					if(powerCodeList.size() > 0) {
						powerCode = powerCodeList.get(0).toString();
					} else {
						String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
						List<Object> checkList =  usedRecordDao.createNativeQuery(powerOperateSql, "X6Basic_1.0_meetingroom").list();
						if(checkList.size()>0){
							powerCode = checkList.get(0).toString();
						}
					}
						powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"usedRecord\"","X6Basic_1.0_meetingroom","","X6BASIC_USED_RECORDS",false);
					//if(!searchRefView&&refView.getAssModel().getEntity().getWorkflowEnabled())  {
						//查询主列表视图的权限(表单类型)
						//	sb.append(" INNER JOIN WF_PENDING \"p\" ON \"p\".TABLE_INFO_ID=\"usedRecord\".TABLE_INFO_ID ");
						//	sb.append(" WHERE  \"usedRecord\".STATUS <> 0  ");
					//}
					//powerSql = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"usedRecord\"","X6Basic_1.0_meetingroom","","X6BASIC_USED_RECORDS",false);
					if(sb.length()>0) {
						sb.append(" AND ");
					}
					sb.append(powerSql);
				}
			}else {
				//如果未关联参照视图则使用当前列表的查询权限
				if(currentViewCode!=null&&currentViewCode.trim().length()>0)  {
					boolean needPermission=true;
					View view=viewServiceFoundation.getView(currentViewCode);
					String powerCode = permissionCode + "_self";
					if(view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE){
						searchRefView=true;
						if(view.getShowType().equals(ShowType.PART)){
							View layoutView = viewServiceFoundation.getView(permissionCode);
							if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
								powerCode = permissionCode;
								needPermission=false;
							}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
								powerCode = "X6Basic_1.0_meetingroom_UsedRecord" + "_" + layoutView.getPermissionCode();
							}
							if(null == layoutView)  {
								layoutView = getLayoutView(permissionCode);
								if(null == layoutView  || !(layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0)){
									powerCode = permissionCode;
								}else if((layoutView.getIsPermission() && layoutView.getPermissionCode().trim().length() > 0))  {
									powerCode = "X6Basic_1.0_meetingroom_UsedRecord" + "_" + layoutView.getPermissionCode();
									needPermission=true;
								}
							}
						}else  {
							if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
								powerCode = "X6Basic_1.0_meetingroom_UsedRecord" + "_" + view.getPermissionCode();
							}else {
								needPermission=false;
							}
						}
					}
					if(needPermission)  {
						String powerCodeSql = "select m.code as code from base_MenuOperate m where m.code = ? and m.valid = 1";
						List<Object> powerCodeList =  usedRecordDao.createNativeQuery(powerCodeSql, powerCode).list();
						if(powerCodeList.size() > 0) {
							powerCode = powerCodeList.get(0).toString();
						} else {
							String powerOperateSql = "select m.code as code from base_MenuOperate m where m.entity_Code=? and m.valid=1 and Power_Flag=1";
							List<Object> checkList =  usedRecordDao.createNativeQuery(powerOperateSql, "X6Basic_1.0_meetingroom").list();
							if(checkList.size()>0){
								powerCode = checkList.get(0).toString();
							}
						}	
							powerSql  = dataPermissionService.getBaseModelPowerCondition(this.creatorService.getStaffFromSession().getUser(), powerCode, "\"usedRecord\"","X6Basic_1.0_meetingroom","","X6BASIC_USED_RECORDS",false);
						if(sb.length()>0) {
							sb.append(" AND ");
						}
						sb.append(powerSql);
					}
				}
				
			}
		
			
			
			if(!innerJoinAppendFlag)  {
				if(!sb.toString().trim().startsWith("WHERE"))  {
					mnecodeSql.append(" WHERE ");
				}
			}
			if(sb != null && sb.length() > 0 && !sb.toString().trim().endsWith(" AND")) {
				sb.append(" AND ");
			}
			mnecodeSql.append(sb);
			
			mnecodeSql.append("  (\"").append("usedRecord.mc\"").append(".MNE_CODE) like (?) escape '&' AND \"usedRecord\".VALID = 1");
			totalValues.add(mneValues);
			
			if(customerSql != null && customerSql.length() > 0){
				mnecodeSql.append(" AND (").append(customerSql).append(")");
				if(customerSqlValues!=null&&customerSqlValues.size()>0){
					totalValues.addAll(customerSqlValues);
				}
			}
			
			if(customerCondition != null && customerCondition.length() > 0){
				mnecodeSql.append(" AND (").append(customerCondition).append(")");
				if(customerValues!=null&&customerValues.size()>0){
					totalValues.addAll(customerValues);
				}
			}
			
			if(!cross){
				if(isSingleMode){
					mnecodeSql.append(" AND \"usedRecord\".CID = ?");
					totalValues.add(getCurrentCompanyId());
				}else{
					//当前公司不是集团情况下查询集团和本公司数据
					if(!getCurrentCompanyId().equals(1L)){
						mnecodeSql.append(" AND (\"usedRecord\".CID = 1 OR \"usedRecord\".CID = ?)");
						totalValues.add(getCurrentCompanyId());
					}
				}
			}
			
			//组合自定义条件
			String customCondition=getCustomMneCondition(viewCode,  showNumber, cross,  params, refViewCode, currentViewCode, sqlType, realPermissionCode);
			if (customCondition!=null&&customCondition.trim().length() > 0) {
				
				if(customCondition != null && customCondition.length() > 0 && !customCondition.toString().trim().startsWith("AND") ) {
					mnecodeSql.append(" AND ");
				}
				mnecodeSql.append(customCondition);
			}
			
			if(notinValue != null){
				mnecodeSql.append(" and (\"").append("usedRecord.mc\"").append(".USED_RECORD) not in ("+notinValue+")");
			}
			
			SQLQuery query = usedRecordDao.createNativeQuery(mnecodeSql.toString(), totalValues.toArray(new Object[]{}));
			resultList = query.setMaxResults(showNumber).list();
		}
		
		return resultList;
		
	}

	@Override
	public void destroy() throws Exception {
		beforeServiceDestroy();
		sqlService = null;
		eventService = null;
		scriptService = null;
		documentService = null;
		messageCenterDao = null;
		messageCenterService = null;
		baseUnitDao = null;
		baseUnitService = null;
		unitGroupsDao = null;
		unitGroupsService = null;
		timeRegionDao = null;
		timeRegionService = null;
		timeRegionParDao = null;
		timeRegionParService = null;
		meetingRoomDao = null;
		meetingRoomService = null;
		usedRecordDao = null;
		syncLogDao = null;
		syncLogService = null;
		productManageDao = null;
		productManageService = null;
		planDailyDao = null;
		planDailyService = null;
		rangePlanDao = null;
		rangePlanService = null;
		rangePlanPartDao = null;
		rangePlanPartService = null;
		accountPeriodDao = null;
		accountPeriodService = null;
		accountPeriodPartDao = null;
		accountPeriodPartService = null;
		syncConfigsDao = null;
		syncConfigsService = null;
		mailServerDao = null;
		mailServerService = null;
		spellRuleDao = null;
		spellRuleService = null;
		spellRulePartDao = null;
		spellRulePartService = null;
		documentClassesDao = null;
		documentClassesService = null;
		signatureDao = null;
		signatureService = null;
		signetSettingDao = null;
		signetSettingService = null;
		attMachineDao = null;
		attMachineService = null;
		abookDao = null;
		abookService = null;
		teamInfoDao = null;
		teamInfoService = null;
	
		dataPermissionService = null;
		counterManager = null;
		conditionService = null;
		viewServiceFoundation = null;
		creatorService = null;
		bundleContext = null;
		synchronizeInfoService = null;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.beforeInitBean();
		this.counter = this.counterManager.addCounter("meetingroom", "X6Basic_1.0_meetingroom", "meetingroom_{1,date,yyyyMMdd}_{0,number,000}", CounterType.Daily);
		String formatStr = "";
		this.afterInitBean();
	}
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String getWorkFlowInfo(String menuCode) {
		String sql="select d.PROCESS_KEY PROCESSKEY from WF_DEPLOYMENT d,BASE_MENUINFO m where d.MENU_INFO_ID=m.id and d.valid=1 and m.code=? group by d.PROCESS_KEY";
		SQLQuery query=usedRecordDao.createNativeQuery(sql, menuCode);
		List<String> list=query.list();
		String keys="";
		for(String key:list){
			keys+=","+key;
		}
		if(!"".equals(keys)){
			keys=keys.substring(1);
		}
		
		return keys;
	}
	// ================ 生成多选控件数据保存方法 start====================
	// ================ 生成多选控件数据保存方法 end ====================

	protected String getEntityCode(){return UsedRecord.ENTITY_CODE;}
	protected String getModuleCode(){return UsedRecord.MODULE_CODE;}
	protected String getModelCode(){return UsedRecord.MODEL_CODE;}
	
	
	/**
	 * 检查模型字段的唯一性约束
	 * @param usedRecord 模型实例
	 */
	public void checkUniqueConstraint(UsedRecord usedRecord){
	}
	
	
	@Override
	public List<UsedRecord> getUsedRecords(String sql, List<Object> params) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			return usedRecordDao.findByHql("from " + UsedRecord.JPA_NAME + " " + ((sql==null || sql.isEmpty()) ? "" : "where " + sql)) ;
		}
		return usedRecordDao.findByCriteria(detachedCriteria);
	}
	
	
	
	@Override
	public List<UsedRecord> findUsedRecordsBySql(String sql, List<Object> params){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
		if(params!=null && params.size()>0){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
			
		}else{
			detachedCriteria.add(Restrictions.sqlRestriction(sql));
		}
		
		return usedRecordDao.findByCriteria(detachedCriteria);
	}
	@Override
	public List<UsedRecord> findUsedRecordsByHql(String hql, Object... objects){
		
		return   usedRecordDao.findByHql(hql, objects);
	}
	
	@Override
	public UsedRecord loadUsedRecordByBussinessKey(UsedRecord usedRecord){
		return loadUsedRecordByBussinessKey(usedRecord.getId());
	}
	
	@Override
	public Page<UsedRecord> getUsedRecords(Page<UsedRecord> page, String sql, List<Object> params, String sort) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
		if(sort!=null && sort.length()>0){
			String[] sorts = sort.split("\\|");
			if(sorts!=null && sorts.length>0){
				for(String condition : sorts){
					if(condition!=null && condition.length()>0 && condition.contains(",")){
						String[] conditions = condition.split(",");
						if("asc".equals(conditions[1])){
							detachedCriteria.addOrder(Order.asc(conditions[0]));
						}else if("desc".equals(conditions[1])){
							detachedCriteria.addOrder(Order.desc(conditions[0]));
						}
					}
				}
			}
		}
		if(params!=null){
			List<Type> types = new ArrayList<Type>();
			for(Object obj : params){
				types.add(TypeFactory.basic(obj.getClass().getName()));
			}
			detachedCriteria.add(Restrictions.sqlRestriction(sql, params.toArray(new Object[]{}),types.toArray(new Type[]{})));
		}else{
			if(sql!=null){
				page = usedRecordDao.findByPage(page, sql);
			}else{
				page = usedRecordDao.findAllByPage(page);
			}
			return page;
		}
		page = usedRecordDao.findByPage(page, detachedCriteria);
		return page;
	}
	//==============DataGrid多选控件使用 start================
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public UsedRecord loadUsedRecordByBussinessKey(Serializable bussinessKey){
		return usedRecordDao.findEntityByCriteria(Restrictions.eq("id", Long.valueOf(bussinessKey.toString())),Restrictions.eq("valid", true));
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<UsedRecord> findByProperty(String propertyName, Object object){
		return usedRecordDao.findByProperty(propertyName, object);
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public UsedRecord findEntityByProperty(String propertyName, Object object){
		return usedRecordDao.findEntityByProperty(propertyName, object);
	}
	
	
	
	@Override
	@Transactional
	public void deleteByBussinessKeys(String bussinessKeys){
		if(null != bussinessKeys && bussinessKeys.trim().length() > 0){
			List<Long> bussinessKeyList = new ArrayList<Long>();
			for(String key : bussinessKeys.split(",")){
				bussinessKeyList.add(Long.valueOf(key));
			}
			String sql = "update " + UsedRecord.JPA_NAME + " set valid=0 where id in (:businessKeys)";
			Query query = usedRecordDao.createQuery(sql);
			query.setParameterList("businessKeys", bussinessKeyList);
			query.executeUpdate();
		}
	}
	
	@Override
	public String findValidateDatagrids(Map<String,Class> dgClassMap){
		String bap_validate_datagrids="";
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("X6Basic_1.0_meetingroom_UsedRecord","runtime");
		try {
			for(View dgv:dgviews){
				if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
					List<DataGrid> ldg=viewServiceFoundation.getDataGrids(dgv.getCode());
					for(DataGrid dg:ldg){
						bap_validate_datagrids+=dg.getName()+",";
						dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.X6Basic.entities."+dg.getTargetModel().getJpaName()));
					}
				}
			}
		} catch (ClassNotFoundException e) {
			log.error(e.getMessage(),e);
		}
		return bap_validate_datagrids;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String findValidateDatagrids(Map<String,Class> dgClassMap,String viewCode){
		String bap_validate_datagrids="";
		List<DataGrid> dgs = viewServiceFoundation.getDataGrids(viewCode, "runtime");
		try {
			for(DataGrid dg:dgs){
				bap_validate_datagrids+=dg.getName()+",";
				dgClassMap.put(dg.getName(),Class.forName("com.supcon.orchid.X6Basic.entities."+dg.getTargetModel().getJpaName()));
			}
		} catch (ClassNotFoundException e) {
			log.error(e.getMessage(),e);
		}
		return bap_validate_datagrids;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String findMainViewPath(){
		String mainViewPath="";
		List<View> views = viewServiceFoundation.findViewsByEntityCode("X6Basic_1.0_meetingroom", ViewType.VIEW);
		for(View v:views){
			if(v.getMainView()){
				mainViewPath=v.getUrl();
			}
		}
		return mainViewPath;
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<DataGrid> findDatagrids(){
		List<DataGrid> ldg=new ArrayList<DataGrid>();
		List<View> dgviews = viewServiceFoundation.findViewsByAssModelCode("X6Basic_1.0_meetingroom_UsedRecord","runtime");
		for(View dgv:dgviews){
			if (null == dgv.getIsShadow() || !dgv.getIsShadow()) {
				ldg.addAll(dgv.getDataGrids());
			}
		}
		return ldg;
	}
	
	public void dealDatagridsSave(UsedRecord usedRecord,String viewCode,Map<String,String> dgLists,Map<String,String> dgDeleteIDs,Map<String,Object> assFileUploads){
		if(dgLists==null&&dgDeleteIDs==null){
			return;
		}
		List<DataGrid> dgs=viewServiceFoundation.getDataGrids(viewCode, "runtime");
		if(dgs!=null&&dgs.size()>0){
			usedRecordDao.flush();
			Class _reflect_thisclass=this.getClass();
			try {
				for(DataGrid dg:dgs){
					if(null != dg.getDataGridType() && dg.getDataGridType() == 1){
						continue;
					}
					Class _reflect_dgclass=Class.forName("com.supcon.orchid.X6Basic.entities."+dg.getTargetModel().getJpaName());
					java.lang.reflect.Field _reflect_serviceField = _reflect_thisclass.getDeclaredField(fLTL(dg.getTargetModel().getModelName())+"Service");
					Class _reflect_serviceType=_reflect_serviceField.getType();
					Object _reflect_serviceObj=_reflect_serviceField.get(this);
					Model _targetModel=dg.getTargetModel();
					List<Long> _needDealIds = new ArrayList<>();
					Map<String, Long> _dgCodeMap = new HashMap<String, Long>();
					boolean isTree=(_targetModel.getDataType()==2);
					List<String> _attachKey =new ArrayList<String>();
					Map _confMap=dg.getConfigMap();
					Map _layoutMap = (Map) _confMap.get("layout");
					List<Map> ls = (List<Map>) _layoutMap.get("sections");
					for(Map lm:ls){
						if(lm.get("regionType").equals("DATAGRID")){
							List<Map> lc = (List<Map>) lm.get("cells");
							for(Map lk:lc){
								if("PROPERTYATTACHMENT".equals(lk.get("columnType"))&&lk.get("key")!=null){
									_attachKey.add(lk.get("key").toString());
								}
							}
						}
					}
					boolean hasAttach=(_attachKey.size()>0);
					if(null == assFileUploads){
						assFileUploads = new HashMap<String,Object>();
					}
					if(hasAttach&&assFileUploads.get("staffId")==null){	
						assFileUploads.put("staffId", ((OrchidAuthenticationToken)SecurityContextHolder.getContext().getAuthentication()).getStaff().getId());
					}
					Map<String,Object> dgAttachMap = (Map<String, Object>) assFileUploads.get(dg.getName());
					if(hasAttach){
						if(null == dgAttachMap){
							dgAttachMap = new HashMap<String,Object>();
						}
						for(String key:_attachKey){
							dgAttachMap.put(key+"_propertyCode",_reflect_dgclass.getDeclaredField(key.toUpperCase()+"_PROPERTY_CODE").get(null));
						}
						dgAttachMap.put("type", _reflect_dgclass.getDeclaredField("DOC_TYPE").get(null));
					}
					if(dgDeleteIDs!=null&&dgDeleteIDs.get(dg.getName())!=null){
						ArrayList<Long> param=new ArrayList<Long>();
						String[] arrs=dgDeleteIDs.get(dg.getName()).split(",");
						for(int i=0;i<arrs.length;i++){
							param.add(Long.valueOf(arrs[i]));
						}
						if(hasAttach){
							dgAttachMap.put("deleteIds",param);
						}
						_reflect_serviceType.getDeclaredMethod("delete"+_targetModel.getModelName(),List.class,String.class).invoke(_reflect_serviceObj,param,"noEvent");
					}
					if(dgLists!=null&&dgLists.get(dg.getName())!=null){
						if(isTree){
							_needDealIds.clear();
							_dgCodeMap.clear();
						}
						List dglist=(List)com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(dgLists.get(dg.getName()).replaceAll("\r\n", "\\\\r\\\\n"), _reflect_dgclass,usedRecordDao.getSessionFactory());
						java.lang.reflect.Method _reflect_setMethod=_reflect_dgclass.getMethod("set"+fLTU(dg.getOrgProperty().getName()), UsedRecord.class);
						java.lang.reflect.Method _reflect_saveMethod=_reflect_serviceType.getMethod("save"+_targetModel.getModelName(),_reflect_dgclass,Map.class,Map.class,Map.class,String.class,String.class,boolean[].class);
						for(Object odg:dglist){
							_reflect_setMethod.invoke(odg, usedRecord);
							Map<String,Object> paramMap = new HashMap<String,Object>();
							if(hasAttach){
								for(String key:_attachKey){
									String fileAddPath=(String)_reflect_dgclass.getDeclaredMethod("get"+fLTU(key)+"FileAddPaths", null).invoke(odg, null);
									if(fileAddPath!=null&&fileAddPath.length()>0){
										paramMap.put(key+"_fileAddPaths",fileAddPath);
									}
									String fileDeleteIds=(String)_reflect_dgclass.getDeclaredMethod("get"+fLTU(key)+"FileDeleteIds", null).invoke(odg, null);
									if(fileDeleteIds!=null&&fileDeleteIds.length()>0){
										paramMap.put(key+"_fileDeleteIds",fileDeleteIds);
									}
								}
							}
							if(isTree){
								String ppCode = ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getVirtualParentCode();
								if(null != ppCode && ppCode.indexOf("x") > -1) {
									if(_dgCodeMap.containsKey(ppCode)) {
										((com.supcon.orchid.tree.AbstractCidTreeNode)odg).setParentId(_dgCodeMap.get(ppCode));
									}
								} else if(null != ppCode && !ppCode.isEmpty()) {
									((com.supcon.orchid.tree.AbstractCidTreeNode)odg).setParentId(Long.parseLong(ppCode));
								}
							}
							_reflect_saveMethod.invoke(_reflect_serviceObj, odg,null,null,null,viewCode,"noEvent",new boolean[]{});
							if(isTree){
								_needDealIds.add(((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getId());
								String pCode = ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getVirtualCode();
								if(!_dgCodeMap.containsKey(pCode)) {
									_dgCodeMap.put(pCode, ((com.supcon.orchid.tree.AbstractCidTreeNode)odg).getId());
								}
							}
							if(!paramMap.isEmpty()){
								paramMap.put("linkId",((com.supcon.orchid.orm.entities.IdEntity)odg).getId());
								paramMap.put("mainModelId",usedRecord.getId());	
								dgAttachMap.put(((com.supcon.orchid.orm.entities.IdEntity)odg).getId().toString(), paramMap);
							}
						}
						if(isTree){
							_reflect_serviceType.getMethod("deal"+_targetModel.getModelName()+"Leaf",List.class).invoke(_reflect_serviceObj, _needDealIds);
						}
					}
					if(hasAttach){
						if(null != dgAttachMap && !dgAttachMap.isEmpty()){
							assFileUploads.put(dg.getName(),dgAttachMap);
						}
					}
				}
			}catch (Exception e) {
				log.error(e.getMessage(),e);
				if(e instanceof InvocationTargetException){
					InvocationTargetException iteException=(InvocationTargetException)e;
					if(iteException.getTargetException()!=null){
						Throwable throwable=iteException.getTargetException();
						if(throwable instanceof BAPException){
					     	 throw (BAPException)throwable;
					    }else{
							throw new BAPException(throwable.getMessage()!=null?throwable.getMessage():InternationalResource.get("foundation.error.message", getCurrentLanguage()));
						}
					}
				}
				throw new BAPException(InternationalResource.get("foundation.error.message", getCurrentLanguage()));
			}
		}
	} 

	
		@Override
	@Transactional
	public List<Object> getBusinessKeyData(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ UsedRecord.TABLE_NAME +" where valid = 1";
			list = usedRecordDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public List<Object> getBusinessKeyDataByBusinessKeyName(String businessKeyName){
		List<Object> list = new ArrayList<Object>();
		if(null != businessKeyName){
			String sql = "select " + businessKeyName +" from "+ UsedRecord.TABLE_NAME;
			list = usedRecordDao.createNativeQuery(sql).list();
		}
		return list;
	}
	
	@Override
	@Transactional
	public Map<Object, Object> getReplaceProperty(String propertyName,String businessKey){
		List<Object[]> list = new ArrayList<Object[]>();
		Map<Object, Object> m = new HashMap<Object, Object>();
		if(null != propertyName && null != businessKey){
			String sql = "select " + businessKey + "," + propertyName +" from "+ UsedRecord.TABLE_NAME +" group by " + propertyName + "," + businessKey;
			list = usedRecordDao.createNativeQuery(sql).list();
		}
		if (list != null && !list.isEmpty()) {
			for (Object[] obj : list) {
				if(null != obj[1]){
					m.put(obj[0], obj[1]);
				}
			}
		}
		return m;
	}
	
	@Autowired
	private UsedRecordDaoImpl usedRecordDaoImpl;
	
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchUsedRecord(final List<UsedRecord> insertObjs, final List<UsedRecord> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){
		return this.importBatchUsedRecord(insertObjs, updateObjs, columnInfo, importNodeInfo, importPropInfo,null);		
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.import.bussiness.info",operType="5")
	public Map<Object, Long> importBatchUsedRecord(final List<UsedRecord> insertObjs, final List<UsedRecord> updateObjs, 
				List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo,SignatureLog signatureLog){
				
		int importCount = 0;
		if (null != insertObjs) {
			importCount += insertObjs.size();
		}
		if (null != updateObjs) {
			importCount += updateObjs.size();
		}
		AuditUtil.setAuditDes(InternationalResource.get("foundation.import.bussiness.info.args",null,InternationalResource.get("X6Basic.modelname.radion1367134288546"),importCount));
		if(null != signatureLog && null == signatureLog.getOperateLogUuid()){
			if (null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()) {
				signatureLog.setOperateLogUuid((null == AuditUtil.getCurrentAudit().getOperationAudit().get_parentCode() || "-1".equals( AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode())) ? AuditUtil.getCurrentAudit().getOperationAudit().getUuid() : AuditUtil
						.getCurrentAudit().getOperationAudit().get_parentCode());
			}
		}
		Map<Long, UsedRecord> oldUpdateObjsMap = new HashMap<Long, UsedRecord>(); 
		List<Long> updateObjIdsList = new ArrayList<Long>();
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {
			UsedRecord bizObj = updateObjs.get(updateIndex);
			updateObjIdsList.add(bizObj.getId());
		}
		if (updateObjIdsList.size() > 0) {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(UsedRecord.class);
			if(updateObjIdsList.size()>1000){
				List<Long> updateObjIdsListBefore = updateObjIdsList.subList(0, 999);
				List<Long> updateObjIdsListAfter = updateObjIdsList.subList(999, updateObjIdsList.size());		
				detachedCriteria.add(Restrictions.or(Restrictions.in("id", updateObjIdsListBefore),Restrictions.in("id", updateObjIdsListAfter)));
			}else{
				detachedCriteria.add(Restrictions.in("id", updateObjIdsList));
			}
			List<UsedRecord> bizObjList = usedRecordDao.findByCriteria(detachedCriteria);
			if (null != bizObjList) {
				for (int mIndex = 0; mIndex < bizObjList.size(); mIndex++) {
					UsedRecord bizObj = bizObjList.get(mIndex);
					if (null != bizObj && null != bizObj.getId()) {
						oldUpdateObjsMap.put(bizObj.getId(), bizObj);
					}
				}
			}
		}		
				
		final List<Map<String,String>> columnMaps = new ArrayList<Map<String,String>>();
		List<String> columnName = new ArrayList<String>();
		final List<String> associatedModelNames = new ArrayList<String>();
		final List<String> associatedModelTypes = new ArrayList<String>();
		for(int i = 0 ; i<columnInfo.size(); i++){//封装excel中列名对应的模型中的字段，数据库中的字段，字段类型
			if(!columnName.contains(columnInfo.get(i).get("name")) && !columnInfo.get(i).get("name").equals("id")){
				Map<String,String> columnMap = new HashMap<String, String>();
				columnMap.put("name", columnInfo.get(i).get("name"));
				String name = columnInfo.get(i).get("name");
				if(name.equals("deleteStaff") || name.equals("createStaff") || name.equals("modifyStaff") || name.equals("effectStaff") || name.equals("ownerDepartment") || 
						name.equals("ownerPosition") || name.equals("createPosition") || name.equals("createDepartment") || name.equals("ownerStaff")){
					name = name + "Id";
				}
				columnMap.put("dbname", columnInfo.get(i).get("dbname"));
				columnMap.put("type", columnInfo.get(i).get("type"));
				columnMap.put("isCustom", columnInfo.get(i).get("isCustom"));
				columnMap.put("multable", columnInfo.get(i).get("multable"));
				columnMaps.add(columnMap);
				columnName.add(columnInfo.get(i).get("name"));
				associatedModelNames.add(columnInfo.get(i).get("associatedModelName"));
				associatedModelTypes.add(columnInfo.get(i).get("associatedModelType"));
			}
		}
		
		final List<UsedRecord> nmeObjs = new ArrayList<UsedRecord>();
		
		Map<Object, Long> m = new HashMap<Object, Long>();
		
		final String dbId = getDbIdName();
		final List<Long> insertIds = new ArrayList<Long>();
		int expLength=insertObjs.size();
		long id=autoGeneratorID.getNextId(UsedRecord.TABLE_NAME,expLength,dbId);//id表只操作一次，实际id通过++来增长
		for(UsedRecord usedRecord:insertObjs)  {
			//id = autoGeneratorID.getNextId(UsedRecord.TABLE_NAME,1,dbId);
			if(usedRecord.getId() != null ){
				m.put(usedRecord.getId(), id);
			}else{
				m.put(id, id);
			}
			insertIds.add(id);
			usedRecord.setId(id);
			id++;
		}
		
		
		for(Map<String,String> map : columnMaps){
			if(map.get("type").equals("SYSTEMCODE")){
				String sql = "select senior_system_code,multable from runtime_property where code = ?";
				Object[] result = (Object[]) usedRecordDao.createNativeQuery(sql, "X6Basic_1.0_meetingroom_UsedRecord"+"_"+map.get("name")).uniqueResult();
				map.put("isSenior", result[0].toString());
				//map.put("multable", result[1].toString());
			}
		}
		
		usedRecordDaoImpl.getSession().doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				PreparedStatement updateps = null;
				PreparedStatement insertps = null;
				User currentUser=(User)getCurrentUser();
				Staff currentStaff=currentUser.getStaff();
				
				if(updateObjs != null && updateObjs.size()>0){
					List<String> updateMethods = new ArrayList<String>();
					String updateSql = "UPDATE " + UsedRecord.TABLE_NAME + " SET ";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						updateMethods.add(methodName);
						updateSql += columnMaps.get(i).get("dbname")+"=?,";
					}
					updateSql = updateSql.substring(0,updateSql.length()-1);
					updateSql += " where " + dbId + " =?";
					
					updateps = conn.prepareStatement(updateSql);
					for(int updateIndex =0;updateIndex<updateObjs.size();updateIndex++){
						UsedRecord usedRecord = updateObjs.get(updateIndex);
						Long id = usedRecord.getId();
						if(null != id){
							updateps.setLong(columnMaps.size()+1,id);
							for(int i=0;i<columnMaps.size();i++){
								Method method = null;
								try {
									method = usedRecord.getClass().getMethod(updateMethods.get(i));
								} catch (NoSuchMethodException | SecurityException e) {
									log.error(e.getMessage(),e);
								}
								Object obj = null;
								if(null != method){
									try {
										obj = method.invoke(usedRecord);
									} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
										log.error(e.getMessage(),e);
									}
								}
								if(null != obj){
									String type = columnMaps.get(i).get("type");
									if (type.equals("TEXT") || type.equals("PASSWORD") || type.equals("LONGTEXT") || type.equals("BAPCODE") || type.equals("SUMMARY")) {
										updateps.setString(i+1, obj.toString());
									} else if(type.equals("SYSTEMCODE")){
										if( null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true") ){
											updateps.setString(i+1, obj.toString());
										}else if( null != columnMaps.get(i).get("multable") && columnMaps.get(i).get("multable").equals("true") ){
											updateps.setString(i+1, obj.toString());
										}else if(null != columnMaps.get(i).get("isSenior") && columnMaps.get(i).get("isSenior").equals("0")){
											SystemCode sc = (SystemCode) obj;
											updateps.setString(i+1, sc.getId());
										}else{
											if(obj.toString().contains("SystemCode")){
												SystemCode sc = (SystemCode) obj;
												updateps.setString(i+1, sc.getId());
											}else{
												updateps.setString(i+1, obj.toString());
											}
										}
									} else if ("DATE".equals(type)) {
										java.sql.Date sqlDate=new java.sql.Date(((Date) obj).getTime());
										updateps.setDate(i+1, sqlDate);
									} else if ("DATETIME".equals(type)) {
										java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(((Date) obj).getTime());
										updateps.setTimestamp(i+1, sqlTimestamp);
									} else if ("INTEGER".equals(type)) {
										updateps.setInt(i+1, (Integer) obj);
									} else if ("LONG".equals(type)) {
										updateps.setLong(i+1, (Long) obj);
									} else if ("DECIMAL".equals(type) || "MONEY".equals(type)) {
										updateps.setBigDecimal(i+1, (BigDecimal) obj);
									} else if ("BOOLEAN".equals(type)) {
										updateps.setBoolean(i+1 , (Boolean) obj);
									} else if ("OBJECT".equals(type)) {
										if(null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true")){
											updateps.setLong(i+1, (Long) obj);
										}else{
											Method objmethod = null;
											try {
												String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length());
												objmethod = obj.getClass().getMethod(methodName);
												if(associatedModelTypes.get(i).equals("LONG")){
													Long objId = null;
													objId = (Long) objmethod.invoke(obj);
													updateps.setObject(i+1, objId);
												}else if(associatedModelTypes.get(i).equals("TEXT")){
													String objCode = null;
													objCode = (String) objmethod.invoke(obj);
													updateps.setObject(i+1, objCode);
												}
											} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
												log.error(e.getMessage(),e);
											}	
											
										}							}
								}else{
									updateps.setString(i+1, null);
								}
							}
							nmeObjs.add(usedRecord);
							updateps.addBatch();
						}
					}	
				}
				
				if(insertObjs != null && insertObjs.size()>0){//新增
					List<String> insertMethods = new ArrayList<String>();
					String insertSql = "INSERT INTO " + UsedRecord.TABLE_NAME + " (";
					for(int i = 0;i<columnMaps.size();i++){
						String mName = columnMaps.get(i).get("name");
						String methodName = "get"+ mName.replaceFirst(mName.substring(0, 1), mName.substring(0, 1).toUpperCase());
						insertMethods.add(methodName);
						insertSql += columnMaps.get(i).get("dbname")+",";
					}
					insertSql += dbId + ",CID,CREATE_STAFF_ID,CREATE_TIME) VALUES (";
					for(int i = 0;i<columnMaps.size();i++){
						insertSql += "?,";
					}
					insertSql += "?,?,?,?)";
					
//					String idSql = "select id from " + UsedRecord.TABLE_NAME + " order by id desc";
//					Query query = usedRecordDao.createNativeQuery(idSql).setMaxResults(1);
//					Long id = new Long(1000);
//					if(null != query.uniqueResult()){
//						id = Long.valueOf(query.uniqueResult().toString());
//					}
					insertps = conn.prepareStatement(insertSql);
					for(int insertIndex = 0; insertIndex<insertObjs.size(); insertIndex++)  {
						UsedRecord usedRecord = insertObjs.get(insertIndex);
						insertps.setLong(columnMaps.size() + 1, insertIds.get(insertIndex));
						insertps.setLong(columnMaps.size() + 2,getCurrentCompanyId());
						insertps.setLong(columnMaps.size() + 3,currentStaff.getId());
						java.util.Date date=new java.util.Date();
						insertps.setTimestamp(columnMaps.size() + 4,new java.sql.Timestamp(date.getTime()));
						for (int i = 0; i < columnMaps.size(); i++) {
							Method method = null;
							try {
								method = usedRecord.getClass().getMethod(
										insertMethods.get(i));
							} catch (NoSuchMethodException | SecurityException e) {
								log.error(e.getMessage(),e);
							}
							Object obj = null;
							if (null != method) {
								try {
									obj = method.invoke(usedRecord);
								} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
									log.error(e.getMessage(),e);
								}
							}
							if (null != obj) {
								String type = columnMaps.get(i).get("type");
								if (type.equals("TEXT") || type.equals("PASSWORD") || type.equals("LONGTEXT") || type.equals("BAPCODE") || type.equals("SUMMARY")) {
									insertps.setString(i+1, obj.toString());
								} else if(type.equals("SYSTEMCODE")){
									if( null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true") ){
										insertps.setString(i+1, obj.toString());
									}else if( null != columnMaps.get(i).get("multable") && columnMaps.get(i).get("multable").equals("true") ){
										insertps.setString(i+1, obj.toString());
									}else if(null != columnMaps.get(i).get("isSenior") && columnMaps.get(i).get("isSenior").equals("0")){
										SystemCode sc = (SystemCode) obj;
										insertps.setString(i+1, sc.getId());
									}else{
										if(obj.toString().contains("SystemCode")){
											SystemCode sc = (SystemCode) obj;
											insertps.setString(i+1, sc.getId());
										}else{
											insertps.setString(i+1, obj.toString());
										}
									}
								} else if ("DATE".equals(type)) {
									java.sql.Date sqlDate=new java.sql.Date(((Date) obj).getTime());
									insertps.setDate(i+1, sqlDate);
								} else if ("DATETIME".equals(type)) {
									java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(((Date) obj).getTime());
									insertps.setTimestamp(i+1, sqlTimestamp);
								} else if ("INTEGER".equals(type)) {
									insertps.setInt(i+1, (Integer) obj);
								} else if ("LONG".equals(type)) {
									insertps.setLong(i+1, (Long) obj);
								} else if ("DECIMAL".equals(type) || "MONEY".equals(type)) {
									insertps.setBigDecimal(i+1, (BigDecimal) obj);
								} else if ("BOOLEAN".equals(type)) {
									insertps.setBoolean(i+1 , (Boolean) obj);
								} else if ("OBJECT".equals(type)) {
									if(null != columnMaps.get(i).get("isCustom") && columnMaps.get(i).get("isCustom").equals("true")){
										insertps.setLong(i+1, (Long) obj);
									}else{
										Method objmethod = null;
										try {
											String methodName = "get" + associatedModelNames.get(i).substring(0, 1).toUpperCase() +  associatedModelNames.get(i).substring(1, associatedModelNames.get(i).length());
											objmethod = obj.getClass().getMethod(methodName);
											if(associatedModelTypes.get(i).equals("LONG")){
												Long objId = null;
												objId = (Long) objmethod.invoke(obj);
												insertps.setObject(i+1, objId);
											}else if(associatedModelTypes.get(i).equals("TEXT")){
												String objCode = null;
												objCode = (String) objmethod.invoke(obj);
												insertps.setObject(i+1, objCode);
											}
										} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
											log.error(e.getMessage(),e);
										}	
										
									}
								}
							} else {
								insertps.setString(i + 1, null);
							}
						}
						//usedRecord.setId(id);
						nmeObjs.add(usedRecord);
						insertps.addBatch();
					}		
				}
				
				
				if(null != insertps){
					insertps.executeBatch();
					insertps.close();
				}
				if(null != updateps){
					updateps.executeBatch();
					updateps.close();
				}
				
			}
		});	
		
		usedRecordDaoImpl.getSession().flush();
		usedRecordDaoImpl.getSession().clear();
		
		
		//记录导入数据日志（区分新增和修改）
		
		for(int insertIndex = 0; insertIndex < insertObjs.size(); insertIndex++)  {//新增
			UsedRecord bizObj = insertObjs.get(insertIndex);
			usedRecordImportService.saveImportDataLog(bizObj, null, "id", "id");
		}
		for(int updateIndex = 0; updateIndex < updateObjs.size(); updateIndex++)  {//修改
			UsedRecord bizObj = updateObjs.get(updateIndex);
			UsedRecord oldBizObj = oldUpdateObjsMap.get(bizObj.getId());
			usedRecordImportService.saveImportDataLog(bizObj, oldBizObj, "id", "id");
		}
		
		return m;
	}
	
	
	
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	//excel辅模型查询
	public void excelAuxModelQuery(Page<UsedRecord> page,  String viewCode, int type, String processKey,
		Boolean flowBulkFlag, Boolean hasAttachment, List<Param> params, String permissionCode, Boolean noQueryFlag,String exportSql,List paramMain, Map assosiatedKey, Model model, Map excelParamsMap) {
		this.excelModelMappings = excelParamsMap.get("excelModelMappings") != null?(Map<String, Object>) excelParamsMap.get("excelModelMappings"):new HashMap<String, Object>();
		this.excelModels = excelParamsMap.get("excelModels") != null?(Map<String, Object>) excelParamsMap.get("excelModels"):new HashMap<String, Object>();
		this.excelProperties = excelParamsMap.get("excelProperties") != null?(Map<String, Object>) excelParamsMap.get("excelProperties"):new HashMap<String, Object>();
		this.excelProperty = excelParamsMap.get("excelProperty") != null?(Map<String, Object>) excelParamsMap.get("excelProperty"):new HashMap<String, Object>();
		this.excelRunningCustomPropertyCode= excelParamsMap.get("excelRunningCustomPropertyCode") != null?(Map<String, Object>) excelParamsMap.get("excelRunningCustomPropertyCode"):new HashMap<String, Object>();
		
		auxModelQuery(page, viewCode, type, processKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, paramMain, assosiatedKey, model, excelParamsMap);
	}
	
	Map<String, Object> excelModelMappings;//modelCode,CustomPropertyModelMapping
	Map<String, Object> excelModels;//modelCode,Model
	Map<String, Object> excelProperties;//modelCode,List<Property>
	Map<String, Object> excelProperty;//propertyCode,Property
	Map<String, Object> excelRunningCustomPropertyCode;//modelCode,RunningCustomPropertyCode
	
	@SuppressWarnings("unchecked")
	private void auxModelQuery(Page<UsedRecord> page, String viewCode, int type, String processKey, Boolean flowBulkFlag,
			Boolean hasAttachment, List<Param> params, String permissionCode,Boolean noQueryFlag,String exportSql, List paramMain, Map assosiatedKey, Model realModel, Map excelParamsMap, Object... objects) {
		int queryType = 0;
		if(objects.length > 0) {
			queryType = (int) objects[0];
		}
		String sql = sqlService.getSqlQuery(viewCode, type);
		//如果存在导出下配置的sql则进行替换
		if(!exportSql.trim().isEmpty())  {
				sql=exportSql;	
		}
		// 自定义字段sql拼接
		//sql = generateCustomPropertySql(viewCode, sql);
		String countSql = "";
		//if(viewCode !=null && viewCode.endsWith("_")){
			countSql = "SELECT COUNT(*) count FROM ";
		//}else{
		//	countSql = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TOTALS); 感觉没必要
		//}
		User currentUser=(User)getCurrentUser();
		if(sql == null){
			sql = "";
		}
		StringBuilder totalSql = new StringBuilder(sql);
		Boolean crossCompanyFlag = null;
		if (null != sql && sql.length() > 0) {
			StringBuilder s = new StringBuilder();
			List<Object> list = new ArrayList<Object>();
			boolean hasWhere = false;
			String referenceCondition = "";
			String customerSql = "";
			String customerCondition = "";
			String classifySql = "";
			if (null != params && !params.isEmpty()) {
				Param param = params.get(0);
				if("crossCompanyFlag".equals(param.getName())){
					crossCompanyFlag = Boolean.parseBoolean(param.getValue().toString());
					params.remove(0);
				}
			}
			StringBuilder sortOrderByStr = new StringBuilder("");
			if (null != params && !params.isEmpty()) {
				s.append(" WHERE ((");
				hasWhere = true;
				String advQuery = "";
				String classifyCodes = "";
				List<Object> advValues = null;
				String extraQuery = "";
				List<Object> customerValues = null;
				List<Object> extraQueryValues = null;
				List<Object> customerSqlValues = null;
				List<Object> classifySqlValues = null;
				//组合where条件
				for (int i = 0; i < params.size(); i++) {
					Param param = params.get(i);
					
					if("classifySql".equals(param.getName())){
						classifySql = (String) param.getValue();
						continue;
					}
					
					if("classifySqlValues".equals(param.getName())){
						classifySqlValues = (List<Object>) param.getValue();
						continue;
					}
					
					if(type == Sql.TYPE_LIST_REFERENCE && "referenceCondition".equals(param.getName())) {
						referenceCondition = (String) param.getValue();
						continue;
					}
					
					if("customerValues".equals(param.getName())){
						customerValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerSqlValues".equals(param.getName())){
						customerSqlValues = (List<Object>) param.getValue();
						continue;
					}
					if("customerCondition".equals(param.getName())){
						customerCondition = (String) param.getValue();
						continue;
					}
					if("customerSql".equals(param.getName())){
						customerSql = (String)param.getValue();
						continue;
					}
					
					if ("advQueryCond".equals(param.getName())) {
						AdvQueryCondition cond = conditionService.toSql((String) param.getValue());
						if (cond != null) {
							advValues = cond.getValues();
							advQuery = cond.getSql();
						}
						continue;
					}
					//数据分类内的高级查询
					if ("classifyCodes".equals(param.getName())) {
						classifyCodes = (String)param.getValue();
						continue;
					}
					if ("extraQueryCond".equals(param.getName())) {
						Map<String,String> oneToManyParams = new HashMap<String,String>();
						oneToManyParams = (Map<String, String>) param.getValue();
						String json = sqlService.getExtraQueryJson(viewCode);
						Pattern oneToManyPattern = Pattern.compile("(\"value\":\")(\\$\\$.*?\\$\\$)(\")");
						Matcher matcher = oneToManyPattern.matcher(json);
						while (matcher.find()) {
							String tag = (matcher.group(2));
							String subTag = tag.substring(2, tag.length()-2);
							if(null != oneToManyParams.get(subTag) && ((String)(oneToManyParams.get(subTag))).length() > 0) {
								json = json.replace(tag, oneToManyParams.get(subTag).replace("\"", "SYMBOL_DOUBLE_QUOTE"));
							} else {
								json = json.replace(tag, "");
							}
						}
						if(null != json && json.length() > 0) {
							AdvQueryCondition cond = conditionService.toSql(json);
							if (cond != null) {
								extraQueryValues = cond.getValues();
								extraQuery = cond.getSql();
							}
						}
						continue;
					}
					if ("dataTable-sortColKey".equals(param.getName())) {
						String sortValue = (String) param.getValue();
						String key = null, columnName = null,customKey = null;
						if(sortValue.indexOf("::") > 0) {
							key = sortValue.split("::")[0];
							columnName = sortValue.split("::")[1];
						}else if(sortValue.indexOf(".") > 0){
							customKey = sortValue.split("\\.")[0];
							if(customKey.contains("attrMap")){
								key =customKey;
								columnName = sortValue.split("\\.")[1];
							}else{
								key = sortValue;
							}
						} else {
							key = sortValue;
						}
						int lastDotPos = key.lastIndexOf('.');
						if(null == columnName) {
							columnName = Inflector.getInstance().columnize(key.substring(lastDotPos + 1));
						}
						String tableAlias = lastDotPos < 0 ? "\"usedRecord\"" : "\"" + key.substring(0, lastDotPos) + "\"";
						if("\"pending\"".equals(tableAlias)) {
							tableAlias = "\"p\"";
						}
						sortOrderByStr.append(tableAlias).append(".").append(columnName);
						continue;
					}
					if ("dataTable-sortColOrder".equals(param.getName())) {
						sortOrderByStr.append(" ").append((String) param.getValue());
						continue;
					}
					if(param.getName().startsWith("\"tree-")){
						if(param.getName().startsWith("\"tree-layRec-")){
							String treeCondition = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_TREE);
							if (treeCondition!=null && treeCondition.trim().length() > 0) {
								if (hasWhere)
									s.append(" AND ");
								else
									s.append(" WHERE (");
									
								s.append(treeCondition);
								if(param.getLikeType() == Param.EQUAL_LIKELEFT) {
									list.add(param.getValue());
									list.add((String) param.getValue()+"-%");
								} 
								if(param.getLikeType() == Param.LIKE_UNSUPPORT) { 
									list.add(param.getValue());
								}
							}
						}
						continue;
					}
					if(!param.getName().startsWith("\"tree-") && param.getLikeType() == Param.EQUAL_LIKELEFT){
						s.append(" AND ( ").append(param.getName()).append("= ? ").append(" OR ")
							.append(param.getName()).append(" like ? )");
						list.add(param.getValue());
						list.add(param.getValue()+"-%");
						continue;
					}
					if (i > 0){
						s.append(" AND ");
					}
					if((null != param.getContainLower() && param.getContainLower())) {
						s.append(" ( ");
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(" UPPER (");
							}
						}
					}
					if(param.getLikeType() != Param.MULTI_LIKE) {
						s.append(param.getName());
					}
					if(!param.getCaseSensitive()) {
						if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
							if(!"DATE".equals(param.getColumnType()) && !"DATETIME".equals(param.getColumnType()) && !"LONG".equals(param.getColumnType()) && !"INTEGER".equals(param.getColumnType()) && !"DECIMAL".equals(param.getColumnType()) && !"BOOLEAN".equals(param.getColumnType())) {
								s.append(") ");
							}
						}
					}
					String exp = " = ?";
					if (param.getLikeType() == Param.LIKE_UNSUPPORT) {
						s.append(" = ?");
					} else if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_RIGHT || param.getLikeType() == Param.LIKE_LEFT) {
						s.append(" LIKE ?");
						exp = " LIKE ?";
					} else if(param.getLikeType() == Param.GREATE_EQUAL) {
						s.append(" >= ?");
						exp = " >= ?";
					}else if(param.getLikeType() == Param.LESS_EQUAL) {
						s.append(" <= ?");
						exp = " <= ?";
					}else if (param.getLikeType() == Param.GREATE_THAN) {
						s.append(" > ?");
						exp = " > ?";
					}else if (param.getLikeType() == Param.LESS_THAN) {
						s.append(" < ?");
						exp = " < ?";
					}else if (param.getLikeType() == Param.NONE_EQUAL) {
						s.append(" <> ?");
						exp = " <> ?";
					}else if (param.getLikeType() == Param.MULTI_LIKE) {
						exp = " LIKE ?";
						String multiValue = param.getValue().toString();
						String[] values = multiValue.split(",");
						StringBuilder multiSb = new StringBuilder();
						for(int m = 0; m < values.length; m++) {
							if(null != values[m] && values[m].length() > 0) {
								multiSb.append(" OR ");
								multiSb.append(param.getName()).append(" LIKE ? ");
								list.add("%," + values[m] + ",%");
							}
						}
						if(multiSb.length() > 0) {
							s.append(" ( ");
							s.append(multiSb.toString().substring(4));
							s.append(" ) ");
						}
					}else {}
					if(param.getLikeType() == Param.LIKE_ALL || param.getLikeType() == Param.LIKE_LEFT || param.getLikeType() == Param.LIKE_RIGHT) {
						String upperStr = (String) param.getValue();
						if(!param.getCaseSensitive()) {
							upperStr = upperStr.toUpperCase();
						}
						if(param.getLikeType() == Param.LIKE_ALL) {
							param.setValue('%' + upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_LEFT) {
							param.setValue(upperStr + '%');
						}
						if(param.getLikeType() == Param.LIKE_RIGHT) {
							param.setValue('%' + upperStr);
						}	
					}
					if(param.getLikeType() == Param.LIKE_UNSUPPORT  || param.getLikeType() == Param.NONE_EQUAL) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						} else {
							if(param.getValue() instanceof String){
								String upperStr = (String) param.getValue();
								if(!param.getCaseSensitive()) {
									upperStr = upperStr.toUpperCase();
								} 
								param.setValue(upperStr);
							} else {
								param.setValue(param.getValue());
							}
						}
					}
					if(param.getLikeType() == Param.GREATE_EQUAL || param.getLikeType() == Param.GREATE_THAN || param.getLikeType() == Param.LESS_EQUAL || param.getLikeType() == Param.LESS_THAN) {
						if ("DATETIME".equals(param.getColumnType()) || "DATE".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(DateUtils.ecDateFormat((String) param.getValue()));
							}
						} else if ("LONG".equals(param.getColumnType())){
							if(param.getValue() instanceof String){
								param.setValue(Long.parseLong((String) param.getValue()));
							}
						} else if ("INTEGER".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(Integer.parseInt((String) param.getValue()));
							}
						} else if ("DECIMAL".equals(param.getColumnType())) {
							if(param.getValue() instanceof String){
								param.setValue(new BigDecimal((String) param.getValue()));
							}
						}					

					}
					
					if(param.getLikeType() != Param.MULTI_LIKE) {
						list.add(param.getValue());
					}
					if(null != param.getContainLower() && param.getContainLower()) {
						String prefix = param.getName().substring(0, param.getName().lastIndexOf("."));
						String columnName = param.getName().substring(param.getName().lastIndexOf(".") + 1);
						if(null != param.getModelInfo() && param.getModelInfo().length > 0) {
							String entityInfo = (param.getModelInfo())[0];
							String serviceInfo = (param.getModelInfo())[1];
							String layRecColumnName = null;
							if(param.getModelInfo().length > 2) {
								layRecColumnName = (param.getModelInfo())[2];
							}
							ServiceReference ref = bundleContext.getServiceReference(serviceInfo);
							List<String> layRecs = null;
							if(null != ref) {
								IModelTreeLayRecService layRecService = (IModelTreeLayRecService) bundleContext.getService(ref);
								layRecs = layRecService.getContainLower(entityInfo, Inflector.getInstance().columnToField(columnName), exp, param.getValue(), false);
							}
							if(null != layRecs && !layRecs.isEmpty()) {
								String layRecCond = "";
								for (String layRec : layRecs) {
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " = ?";
									layRecCond += " OR " + prefix + "." + (layRecColumnName == null ? "LAY_REC" : layRecColumnName) +  " like ?";
									list.add(layRec);
									list.add(layRec + "-%");
								}
								s.append(layRecCond);
							}
							s.append(" ) ");
						}
					}
				}
				if (advQuery != null && advQuery.length() > 0) {
					s.append(" AND ").append(advQuery);
					if (advValues != null) {
						list.addAll(advValues);
					}
				}
				if (extraQuery != null && extraQuery.length() > 0) {
					s.append(" AND ").append(extraQuery);
					if (extraQueryValues != null) {
						list.addAll(extraQueryValues);
					}
				}
				if(customerCondition !=null && customerCondition.length()>0){
					s.append(" AND ").append(customerCondition);
					if(customerValues!=null && customerValues.size()>0){
						list.addAll(customerValues);
					}
				}
				if(customerSql != null && customerSql.length()>0){
					s.append(" AND ").append(customerSql);
					if(customerSqlValues!=null && customerSqlValues.size()>0){
						list.addAll(customerSqlValues);
					}
				}
				if(classifySql != null && classifySql.length() > 0){
					s.append(" AND (").append(classifySql).append(")");
					if(classifySqlValues != null && classifySqlValues.size() > 0){
						list.addAll(classifySqlValues);
					}
				}
				
				if(type == Sql.TYPE_LIST_REFERENCE){
					if(null != crossCompanyFlag && !crossCompanyFlag&& !getCurrentCompanyId().equals(1L)){
						s.append(" AND \"usedRecord\".CID in (1,").append(getCurrentCompanyId()+")");
					}
				}
				
//				if(type == Sql.TYPE_LIST_QUERY || type == Sql.TYPE_LIST_PENDING || type == Sql.TYPE_LIST_REFERENCE) {
//					if(type == Sql.TYPE_LIST_PENDING) {
//						s.append(" AND \"p\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_QUERY){
//						s.append(" AND \"usedRecord\".CID = ").append(getCurrentCompanyId());
//					} else if(type == Sql.TYPE_LIST_REFERENCE){
//						if(null != crossCompanyFlag && !crossCompanyFlag){
//							s.append(" AND \"usedRecord\".CID = ").append(getCurrentCompanyId());
//						}
//					}
//				}
				s.append(" ) ");
			}
			// ////PowerCondition

			s.append(") ");
			
			if (hasWhere)
				s.append(" AND ");
			else
				s.append(" WHERE ");
			s.append(" ( \"usedRecord\".MEETING IN ( SELECT ID FROM X6BASIC_MEETING_ROOMS \"meetingRoom\" ");
			
			//辅模型,一个实体只有一个权限操作
			String powerCode = viewCode + "_self";
			if(permissionCode == null || permissionCode.length() == 0) {
				powerCode = permissionCode + "_self";
			}
			View view = viewServiceFoundation.getView(viewCode);
			if(view!=null && (view.getType() == ViewType.REFERENCE || view.getType() == ViewType.REFTREE)){
				if(view.getIsPermission() && view.getPermissionCode().trim().length() > 0){
					powerCode = "X6Basic_1.0_meetingroom" + "_" + view.getPermissionCode();
				}
			}
			String	pc = "";
			if(assosiatedKey != null && assosiatedKey.size()>0){
				if (pc.trim().length() > 0) {
					s.append(" AND (");
				} else {
					s.append(" WHERE (");
				}
				String queryParam = (String) assosiatedKey.get("keyName");
				List<Long> ids = (List<Long>) assosiatedKey.get("keyValue");
				int count = 0;
				String queryValue = "";
				if(ids != null && ids.size() > 999){
					count = ids.size() / 999;
				}
				if(ids.size() > 999){
					if(count == 1){
						s.append(queryParam);
						s.append(" in (");
						for(int j = 0; j < 999; j++){//in语句999条
							Long id = ids.get(j);
							queryValue += id.toString() + ",";
						}
						s.append(queryValue.subSequence(0, queryValue.length() - 1));
						s.append(") or ");
						s.append(queryParam);
						s.append(" in (");
						queryValue = "";
						for(int j = 999; j < ids.size(); j++){//in语句999条
							Long id = ids.get(j);
							queryValue += id.toString() + ",";
						}
						s.append(queryValue.subSequence(0, queryValue.length() - 1));
						s.append(")");
					}else{
						for(int i = 1; i <= count + 1; i++ ){
							if(i==count + 1){
								s.append(queryParam);
								s.append(" in (");
								queryValue = "";
								for(int j = (i-1)*1000; j < ids.size(); j++){//in语句999条
									Long id = ids.get(j);
									queryValue += id.toString() + ",";
								}
								s.append(queryValue.subSequence(0, queryValue.length() - 1));
								s.append(")");
							}else{
								s.append(queryParam);
								s.append(" in (");
								queryValue = "";
								for(int j = (0+(i-1)*1000); j < (i*1000); j++){//in语句999条
									Long id = ids.get(j);
									queryValue += id.toString() + ",";
								}
								s.append(queryValue.subSequence(0, queryValue.length() - 1));
								s.append(") or ");
							}
						}
					}
				}else{
					for(Long id: ids){
						queryValue += id.toString() + ",";
					}
					s.append(queryParam);
					s.append(" in (");
					s.append(queryValue.subSequence(0, queryValue.length() - 1));
					s.append(")");
				}	
			}
			s.append(")");
			
			s.append(" )");
			s.append(")");
			
			
			if (referenceCondition != null && referenceCondition.length() > 0) {
				s.append(" AND (").append(referenceCondition).append(")");
			}
			// 开始处理排序，避免在统计时带入排序条件
			StringBuilder orderPart = new StringBuilder();
			orderPart.append(" ORDER BY ");
			String colOrderByStr = sqlService.getSqlQuery(viewCode,Sql.TYPE_USED_ORDERBY);
			if(null != colOrderByStr && colOrderByStr.length() > 0) {
				if(sortOrderByStr.toString().length() > 0) {
					String[] colOrderByArr = colOrderByStr.substring(1).split(",");
					String[] sortOrderByArr = sortOrderByStr.toString().split(" ");
					Boolean flag = false;
					for(String colOrderBy : colOrderByArr) {
						if(colOrderBy.indexOf(sortOrderByArr[0] + " ") > -1) {
							colOrderByStr = colOrderByStr.replace(colOrderBy, sortOrderByStr.toString());
							flag = true;
							break;
						}
					}
					if(!flag) {
						orderPart.append(sortOrderByStr).append(",");
					} 
					orderPart.append(colOrderByStr.substring(1)).append(",");
				} else {
					orderPart.append(colOrderByStr.substring(1)).append(",");
				}
			} else {
				if(sortOrderByStr.toString().length() > 0) {
					orderPart.append(sortOrderByStr).append(",");
				} 
			}
			if(type == Sql.TYPE_LIST_PENDING) {
				orderPart.append(" \"p\".ID DESC");
			} else {
				orderPart.append(" \"usedRecord\".ID DESC");
			}
			Object[] arr = list.toArray();
			totalSql.append(s);
			String realSql = totalSql.toString() + orderPart.toString();
			// 突破ORACLE 30个字符限制
			Map<String, String> maps = new HashMap<String, String>();
			realSql = matchSql(pattern, realSql, "T", maps, 2, 4);
			countSql += " ( " + totalSql.toString() + " ) T";
			countSql = replaceSql(pattern, countSql, maps, 4, 2);
			realSql = matchSql(p, realSql, "E", null, 4, 6);
			countSql = matchSql(p, countSql, "E", null, 4, 6);
			//组织总条数，合计SQL
			countSql = replaceSql(countPattern, countSql, maps, 4, 2);
			
			//计算条数
			if (page.needCount()) {
				//String countSql = "SELECT COUNT(*) FROM (" + realSql + ")";
				//Long count = ((Number) usedRecordDao.createNativeQuery(countSql, arr).uniqueResult()).longValue();
				Long count = 0l;
			    Map<String, BigDecimal> resultTotals = new HashMap<String, BigDecimal>();
			    List<Map<String, Object>> resultCountList = (List<Map<String, Object>>) usedRecordDao.createNativeQuery(countSql, arr)
					.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
			    if (null != resultCountList && !resultCountList.isEmpty()) {
					Map<String, Object> resultCounts = resultCountList.get(0);
					for (Map.Entry<String, Object> entry : resultCounts.entrySet()) {
						String key = entry.getKey();
						if(maps.containsKey(key)) {
							key = (String) maps.get(key);
						}
						if (key.equalsIgnoreCase("count")) {
							count = ((Number) (null == entry.getValue() ? 0 : entry.getValue())).longValue();
						} else {
							resultTotals.put(key, BigDecimal.valueOf(((Number) (null == entry.getValue() ? 0 : entry.getValue())).doubleValue()));
						}
					}
			    }
			    if(!page.isExportFlag() && !page.isPaging() && count > page.getMaxPageSize()) {
			    	throw new BAPException(BAPException.Code.RESULT_COUNT_EXCEED_MAX_PAGE_SIZE);
			    }
			    page.setTotalCount(count);
			    page.setResultTotals(resultTotals);
			}
			if(!noQueryFlag)  {
				SQLQuery query = usedRecordDao.createNativeQuery(realSql, arr);
				/*List<UsedRecord> result = new ArrayList<UsedRecord>();
				if(page.isExportFlag()) {  
					result = getResult(page, query, new PendingResultTransformer(UsedRecord.class,usedRecordDao,maps,true));
				}else {
					result = getResult(page, query, new PendingResultTransformer(UsedRecord.class,usedRecordDao,maps));
				}
				modelServiceFoundation.initCacheData();*/
				List<UsedRecord> result = getResult(page, query, new PendingResultTransformer(UsedRecord.class,usedRecordDao,maps));
				
				List<Map> propList = page.getProperties();
				for(Map m : propList){
					if(m.get("isCustom") != null && m.get("isCustom").equals("true") && m.get("columntype").equals("SYSTEMCODE") ){
						for(UsedRecord model : result){
							Map<String, Object> map1 = model.getAttrMap();
							if(map1!=null && map1.size()>0){
								for(Map.Entry<String, Object> entry : map1.entrySet()) {
									if(entry.getKey().equals(m.get("name")) && entry.getValue() != null && !entry.getValue().equals("")) {
										String[] strs = new String[2];
										strs[0] = entry.getValue().toString();
										strs[1] = entry.getValue().toString();
										map1.put(entry.getKey(), strs);
									}
								}
							}
						}
					}else if(m.get("isCustom") != null && m.get("isCustom").equals("true") && m.get("columntype").equals("OBJECT") ){
						for(UsedRecord model : result){
							Map<String, Object> map1 = model.getAttrMap();
							if(map1!=null && map1.size()>0){
								for(Map.Entry<String, Object> entry : map1.entrySet()) {
									if(entry.getKey().equals(m.get("name")) && entry.getValue() != null && !entry.getValue().equals("")) {
										String[] strs = new String[2];
										strs[0] = entry.getValue().toString();
										String methodName = "get" + entry.getKey().toString().substring(0, 1).toUpperCase() + entry.getKey().toString().substring(1);
										String businessKeyValue = "";
										Long idValue = null;
										
										try {
											Property prop = modelServiceFoundation.findPropertyByCode(m.get("propertyCode").toString(), null);
											String methodName2 = "get" + prop.getName().substring(0, 1).toUpperCase() + prop.getName().substring(1);
											Method idMethod = model.getClass().getMethod(methodName2);
											idValue = (Long) idMethod.invoke(model);
											List<CustomPropertyModelMapping> modelMappings = viewServiceFoundation.findCustomPropertyForAsso(prop.getModel().getCode(), prop.getCode());
											String serviceStr = "";
											if(modelMappings != null && modelMappings.size()>0){
												String moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode();
												if(modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_") != -1){
													moduleName = modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().substring(0,modelMappings.get(0).getAssociatedProperty().getModel().getModuleCode().indexOf("_"));
												}
												if(moduleName.equals("sysbase")){
													serviceStr = "com.supcon.orchid.foundation.services." + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
												}else{
													if(modelMappings.get(0).getAssociatedProperty().getModel().getEcVersion().equals("1.0")){
														serviceStr = "com.supcon.orchid."+ moduleName + ".services." + modelMappings.get(0).getAssociatedProperty().getModel().getModelName() + "Service";
													}else{
														serviceStr = "com.supcon.orchid."+ moduleName + ".services." + modelMappings.get(0).getAssociatedProperty().getModel().getJpaName() + "Service";
													}	
												}
												BundleContext bundleContext = FrameworkUtil.getBundle(getClass()).getBundleContext();
												ServiceReference ref = bundleContext.getServiceReference(serviceStr);
												Object realService = bundleContext.getService(ref);
												
												List<Property> props = modelServiceFoundation.findProperties(modelMappings.get(0).getAssociatedProperty().getModel(), null);
												Property bussinessKeyProp = null;
												for(Property p : props){
													if(p.getIsBussinessKey()){
														bussinessKeyProp = p;
														break;
													}
												}
												String getBussinessKeyMethodName = "get" + bussinessKeyProp.getName().substring(0, 1).toUpperCase() + bussinessKeyProp.getName().substring(1);
												
												if(moduleName.equals("sysbase")){
													Method loadMethod = realService.getClass().getMethod("load", new Class[] { Long.class });
													Object obj = loadMethod.invoke(realService, idValue);
													Method getBusKeyValueMethod = obj.getClass().getMethod(getBussinessKeyMethodName);
													businessKeyValue = (String) getBusKeyValueMethod.invoke(obj);
												}else{
													String methodName3 = "get" + modelMappings.get(0).getAssociatedProperty().getModel().getModelName();
													Method loadMethod = realService.getClass().getMethod(methodName3, new Class[] { long.class });
													Object obj = loadMethod.invoke(realService, idValue);
													Method getBusKeyValueMethod = obj.getClass().getMethod(getBussinessKeyMethodName);
													businessKeyValue = (String) getBusKeyValueMethod.invoke(obj);
												}	
											}	
										} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
											log.error(e.getMessage(), e);
										}
										strs[1] = businessKeyValue;
										map1.put(entry.getKey(), strs);
									}
								}
							}
						}
					}
				}
				
				page.setResult(result);
				if(null != hasAttachment && hasAttachment) {
					for (UsedRecord usedRecord : result) {
						long count = 0l;
						count = documentService.getCountByLinkIdAndType(usedRecord.getId(), "X6Basic_meetingroom_usedRecord");
						if(count > 0) {
							List<Document> documents = documentService.getByLinkIdAndType(usedRecord.getId(), "X6Basic_meetingroom_usedRecord");
							if(null != documents && !documents.isEmpty()) {
								usedRecord.setDocument(documents.get(0));
								usedRecord.setBapAttachmentInfo(documents.get(0).getName() + "@_@BAP@_@更多(" + count + ")");
							}
						}
					}
				}
				
				
				for (UsedRecord usedRecord : result) {
				}	
				if(exportSql.trim().isEmpty()){
					getConfigAssoPropsResult(viewCode, "", result); // 获取配置的关联模型字段的结果集
				}
			}
		}
	}
	
	private Map<String, Object> linkMainMap(String modelCode, String entityCode){
		Model mainModel = null;
		if(excelModels!=null && excelModels.get("mainModel")!=null ){
			mainModel = (Model) excelModels.get("mainModel");
		}else{
			mainModel = modelServiceFoundation.getMainModel(entityCode);
		}
		Model model = null;
		if(excelModels!=null && excelModels.get(modelCode)!=null ){
			model = (Model) excelModels.get(modelCode);
		}else{
			model = modelServiceFoundation.getModel(modelCode);
		}
		List<Property> props = null;
		if(excelProperties != null && excelProperties.get(model.getCode())!=null ){
			props = (List<Property>) excelProperties.get(model.getCode());
		}else{
			props = modelServiceFoundation.findProperties(model);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("needChange", "no!!");
		for(Property p : props){
			if(!p.getIsCustom() && p.getType().toString().equals("OBJECT") && p.getAssociatedProperty() != null){
				if(p.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
					return map;
				}else{
					//List<Property> props2 = modelServiceFoundation.findProperties(p.getAssociatedProperty().getModel());
					List<Property> props2 = null;
					if(excelProperties != null && excelProperties.get(p.getAssociatedProperty().getModel().getCode())!=null ){
						props2 = (List<Property>) excelProperties.get(p.getAssociatedProperty().getModel().getCode());
					}else{
						props2 = modelServiceFoundation.findProperties(p.getAssociatedProperty().getModel());
					}
					for(Property p2 : props2){
						if(!p2.getIsCustom() && p2.getType().toString().equals("OBJECT") && p2.getAssociatedProperty() != null
								&& p2.getAssociatedProperty().getModel().getCode().equals(mainModel.getCode())){
							map.put("needChange", "yep");
							map.put("origin", p);
							map.put("target", p2);
							return map;
						}
					}	
				}
			}
		}
		return map;
	}
	
	
	
	private String getDbIdName(){
		String sql = "select column_name from runtime_property where model_code = ? and name = 'id'";
		String dbIDName = usedRecordDao.createNativeQuery(sql, "X6Basic_1.0_meetingroom_UsedRecord").uniqueResult().toString();
		return dbIDName;
	}
	
	@Override
	public List<String> getSystemCodeFullPathNameByEntityCode(String entityCode) {
		String sql = "select value from base_systemcode where entity_code = ?";
		List<String> strs = usedRecordDao.createNativeQuery(sql, entityCode).list();
		return strs;
	}
	
	@Override
	public List<String> getRunningCustomProperties(String entityCode){
		List<String> list = null;
		String sql = "select property_code from BASE_CP_MODEL_MAPPING where model_code = ? and enable_custom = 1";
		list = usedRecordDao.createNativeQuery(sql, entityCode).list();
		return list;
	}
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getAssProperty(String propertyCode){
		String assProperty = null;
		String sql = "select associated_property_code from runtime_property where code = ?";
		assProperty = usedRecordDao.createNativeQuery(sql,propertyCode).uniqueResult()!=null?usedRecordDao.createNativeQuery(sql,propertyCode).uniqueResult().toString():"";
		return assProperty;
	}		
	
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public String getPropertyModelCode(String propertyCode){
		String sql = "select model_code from runtime_property where code = ?";
		String modelCode =  usedRecordDao.createNativeQuery(sql,propertyCode).uniqueResult().toString();
		return modelCode;
	}
	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public  Object generateObjectFromJson(String jsonStr, Class clazz){
		return com.supcon.orchid.ec.utils.JSONUtil.generateObjectFromJson(jsonStr,clazz,usedRecordDao.getSessionFactory());
	}
	
	/**
	 * 以下为兼容视图热部署之前代码的方法
	 */
	
	
	 
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.flow.save")
	public void saveUsedRecord(UsedRecord usedRecord, DataGridService dataGridService){
		saveUsedRecord(usedRecord, dataGridService, null);
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.flow.save")
	public void saveUsedRecord(UsedRecord usedRecord, DataGridService dataGridService, String viewCode){
		saveUsedRecord(usedRecord, dataGridService, viewCode, null);
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void saveUsedRecord(UsedRecord usedRecord, DataGridService dataGridService, String viewCode, String eventTopic, boolean... isImport){
		this.saveUsedRecord(usedRecord, dataGridService, viewCode, eventTopic,null,isImport);
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void saveUsedRecord(UsedRecord usedRecord, DataGridService dataGridService, String viewCode, String eventTopic,SignatureLog signatureLog, boolean... isImport){
		boolean isNew = false;
		String entityCode = "X6Basic_1.0_meetingroom";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		String url = null;
		if(null != usedRecord.getId() && usedRecord.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/add";
		}
		List<Event> events = null;
		Boolean viewIsView = false;
		if(viewCode != null && !viewCode.trim().isEmpty()){
			View view = viewServiceFoundation.getView(viewCode);
			if(null != view) {
				viewIsView = (view.getType() == ViewType.VIEW);
			}
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, usedRecord);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord, viewIsView);

		if (viewIsView) {
			usedRecordDao.saveWithRevertVersion(usedRecord);
		} else {
			if(isNew)
					usedRecordDao.save(usedRecord);
				else
					usedRecordDao.merge(usedRecord);
		}
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		if (dataGridService != null) {
			usedRecordDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateUsedRecordCodes(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateUsedRecordSummarys(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveUsedRecord(usedRecord, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, usedRecord);
			}
		}
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		usedRecordDao.flush();
		usedRecordDao.clear();
		usedRecord = usedRecordDao.load(usedRecord.getId());
		
		
		params.add(usedRecord);
		if(signatureLog != null) {
			Object businessKey=null;
			businessKey=usedRecord.getId();
			if(businessKey != null) {
				signatureLog.setBusinessKey(businessKey.toString());
			}
			if(null != AuditUtil.getCurrentAudit() && null != AuditUtil.getCurrentAudit().getOperationAudit()){
				signatureLog.setOperateLogUuid(AuditUtil.getCurrentAudit().getOperationAudit().getUuid());
			}
			signatureLog.setTableId(usedRecord.getId());
			String msgId="moduleCode:X6Basic_1.0#entityCode:X6Basic_1.0_meetingroom#modelCode:X6Basic_1.0_meetingroom_UsedRecord#timeStamp:"+String.valueOf(new Date().getTime());
			reliableMessageSenderService.sendQueue(msgId,signatureLog);
		}
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public Map<Object, Object> usedRecordDataGridImport(UsedRecord usedRecord, DataGridService dataGridService, String viewCode, String eventTopic,Property businessKey, boolean isImport){
		Map<Object, Object> map = new HashMap<Object, Object>();
		boolean isNew = false;
		String entityCode = "X6Basic_1.0_meetingroom";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		String url = null;
		if(usedRecord.getId() != null && usedRecord.getId() > 0){
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.pending.edit");
				AuditUtil.setAuditOperationType("2");
			}
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/modify";
		}else{
			isNew = true;
			if(StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD())){
				AuditUtil.setAuditDes("ec.print.template.add");
				AuditUtil.setAuditOperationType("1");
			}
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/add";
		}
		List<Event> events = null;
		Boolean viewIsView = false;
		if(viewCode != null && !viewCode.trim().isEmpty()){
			View view = viewServiceFoundation.getView(viewCode);
			if(null != view) {
				viewIsView = (view.getType() == ViewType.VIEW);
			}
			events = viewServiceFoundation.getEventsByView(view);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, usedRecord);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord, viewIsView);

		if (viewIsView) {
			usedRecordDao.saveWithRevertVersion(usedRecord);
		} else {
			if(isNew)
					usedRecordDao.save(usedRecord);
				else
					usedRecordDao.merge(usedRecord);
		}

		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		
		if (dataGridService != null) {
			usedRecordDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateUsedRecordCodes(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateUsedRecordSummarys(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveUsedRecord(usedRecord, viewIsView);


		if(viewCode != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, usedRecord);
			}
		}
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		usedRecordDao.flush();
		usedRecordDao.clear();
		
		String virturalId = usedRecord.getVirtualId();
		
		usedRecord = usedRecordDao.load(usedRecord.getId());
		
		if(virturalId != null && virturalId.length() > 0){
			map.put(virturalId, usedRecord.getId());
		}else{
			String methodName = "get" + businessKey.getName().substring(0, 1).toUpperCase() + businessKey.getName().substring(1);
			Object bkValue = null;
			try {
				Method getBkValue = usedRecord.getClass().getMethod(methodName);
				bkValue = getBkValue.invoke(usedRecord);
			} catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				log.error(e.getMessage(), e);
			}
			map.put(bkValue, usedRecord.getId());
		}
		
		
		params.add(usedRecord);
		return map;
	}
	
	 
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord")
	public void mergeUsedRecord(UsedRecord usedRecord, DataGridService dataGridService){
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord);
		usedRecordDao.merge(usedRecord);
		
		if(null != usedRecord && (StringUtils.isEmpty(AuditUtil.getColumnStringD()) || UsedRecord.MODEL_CODE.equals(AuditUtil.getColumnStringD()))){
			AuditUtil.setColumnStringB(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringA(null == usedRecord.getId() ? "" : usedRecord.getId().toString());
			AuditUtil.setColumnStringC(usedRecord.getId().toString());
		}
		
		if (dataGridService != null) {
			dataGridService.execute();
		}

		afterSaveUsedRecord(usedRecord);
	}
	
	/**
	 * Excel导出 
	 */
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.common.exportExcel",operType="11")
	public void excelExport(){}
	
	/**
	 * 页面打印 
	 */
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="ec.print.page.print",operType="4")
	public void print(int printType){
		if(printType == 0){
			AuditUtil.setAuditDes(InternationalResource.get("ec.print.page.print"));
		}else if(printType == 1){
			AuditUtil.setAuditDes(InternationalResource.get("ec.view.controlPrint"));
		}
	}
	
	@Override
	@AuditLog(entity="X6Basic_1.0_meetingroom",model="X6Basic_1.0_meetingroom_UsedRecord",desc="foundation.batch.save",operType="4")
	public void batchSaveUsedRecord(UsedRecord usedRecord, DataGridService dataGridService,View view,List<Event>  events, String eventTopic, boolean... isImport){
		String entityCode = "X6Basic_1.0_meetingroom";
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("callType", "service");
		props.put("entityCode", "X6Basic_1.0_meetingroom");
		String url = null;
		if(usedRecord.getId()!=null && usedRecord.getId()>0){
			props.put("eventType", "modify");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/modify";
		}else{
			props.put("eventType", "add");
			url = "com/supcon/orchid/entities/sync/x6Basic_10_meetingroom/add";
		}
		Boolean viewIsView = false;
		if(view != null ){
			viewIsView = (view.getType() == ViewType.VIEW);
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "beforeSave", events, usedRecord);
			}
		}
		ReflectUtils.filterObjectIdIsNVL(usedRecord);
		beforeSaveUsedRecord(usedRecord, viewIsView);

		if (viewIsView) {
			usedRecordDao.saveWithRevertVersion(usedRecord);
		} else {
			usedRecordDao.save(usedRecord);
		}

		if (dataGridService != null) {
			usedRecordDao.flush();
			dataGridService.execute();
		}
		
		// 一对多情况处理
		
		// 根据配置规则生成编码
		try {
			generateUsedRecordCodes(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		// 根据配置规则生成摘要
		try {
			generateUsedRecordSummarys(usedRecord, viewIsView);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new BAPException(e.getMessage(), e);
		}
		
		afterSaveUsedRecord(usedRecord, viewIsView);


		if(view != null){
			if(events!=null && events.size()>0){
				executeGScript(entityCode, "afterSave", events, usedRecord);
			}
		}
		List<UsedRecord> params = new ArrayList<UsedRecord>();
		usedRecordDao.flush();
		usedRecordDao.clear();
		usedRecord = usedRecordDao.load(usedRecord.getId());
		
		
		params.add(usedRecord);
	}
	
	@Override
	public Page<UsedRecord> getByPage(Page<UsedRecord> page,DetachedCriteria detachedCriteria){
		return usedRecordDao.findByPage(page, detachedCriteria);
	}
	
	
	
	public String generateTableNo(){
		this.counter.setPattern(modelServiceFoundation.getEntity("X6Basic_1.0_meetingroom").getPrefix()+"_{1,date,yyyyMMdd}_{0,number,000}");
		return this.counter.incrementAndGetString(new Date(),new Date());
	}
	private void beforeSaveUsedRecord(UsedRecord usedRecord, Object... objects){
		checkUniqueConstraint(usedRecord);
	/* CUSTOM CODE START(serviceimpl,beforeSave,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterSaveUsedRecord(UsedRecord usedRecord, Object... objects){
	/* CUSTOM CODE START(serviceimpl,afterSave,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelImportUsedRecord(List<UsedRecord> usedRecords, Map<String, Map<Integer, Map<Integer, String>>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelImport,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void afterExcelImportUsedRecord(List<UsedRecord> usedRecords){
	/* CUSTOM CODE START(serviceimpl,afterExcelImport,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	@Override
	public void beforeExcelBatchImportUsedRecord(List<UsedRecord> usedRecords, Map<Integer, Map<Integer, String>> errors){
	/* CUSTOM CODE START(serviceimpl,beforeExcelBatchImport,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	@Override
	public void afterExcelBatchImportUsedRecord(List<UsedRecord> usedRecords){
	/* CUSTOM CODE START(serviceimpl,afterExcelBatchImport,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */	
	}
	
	private void beforeDeleteUsedRecord(UsedRecord usedRecord){
	/* CUSTOM CODE START(serviceimpl,beforeDelete,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterDeleteUsedRecord(UsedRecord usedRecord){
	/* CUSTOM CODE START(serviceimpl,afterDelete,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void beforeRestoreUsedRecord(UsedRecord usedRecord){
	/* CUSTOM CODE START(serviceimpl,beforeRestore,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void afterRestoreUsedRecord(UsedRecord usedRecord){
	/* CUSTOM CODE START(serviceimpl,afterRestore,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	
	private void customGenerateCodes(UsedRecord usedRecord, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void customGenerateSummarys(UsedRecord usedRecord, Object... objects) {
		/* CUSTOM CODE START(serviceimpl,customGenerateCodes,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeServiceDestroy() {
	/* CUSTOM CODE START(serviceimpl,beforeServiceDestroy,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}

	private void beforeInitBean(){
		/* CUSTOM CODE START(serviceimpl,beforeInitBean,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	private void afterInitBean(){
		/* CUSTOM CODE START(serviceimpl,afterInitBean,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void beforeImportUsedRecord(List<UsedRecord> insertObjs, List<UsedRecord> updateObjs, 
			List<Map<String,String>> columnInfo,List<Map<String, Map<Integer, Map<Integer, String>>>> errMsgSheet, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入before方法
		/* CUSTOM CODE START(serviceimpl,beforeImportUsedRecord,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	@Override
	public void afterImportUsedRecord(List<UsedRecord> insertObjs, List<UsedRecord> updateObjs, 
			List<Map<String,String>> columnInfo, Map<String ,List<Map<String, Object>>> importNodeInfo, Map<String, Property> importPropInfo){//主辅模型导入after方法
		/* CUSTOM CODE START(serviceimpl,afterImportUsedRecord,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	}
	/* CUSTOM CODE START(serviceimpl,functions,X6Basic_1.0_meetingroom_UsedRecord,X6Basic_1.0) */
// 自定义代码
	@Override
	public List<UsedRecord> getUsedRecordList(Date startTime,
			Date endTime, MeetingRoom meetingRoom) {
		String hql=" from UsedRecord ur" +
				" where ((ur.startTime>? and ur.startTime<?) or (ur.endTime>? and ur.endTime<?) or (ur.startTime<? and ur.endTime>?))" +
				" and ur.valid=true and ur.meeting = ? order by ur.startTime ASC";
		return meetingRoomDao.findByHql(hql, startTime,endTime,startTime,endTime,startTime,endTime,meetingRoom);
	}
	@Override
	public List<UsedRecord> getUsedRecordByTypeId(MeetingRoom meetingRoom,String typeID,String useType){
		List<UsedRecord> ur= usedRecordDao.findByCriteria(Restrictions.eq("meeting", meetingRoom),Restrictions.eq("typeId", typeID),Restrictions.eq("useType", useType),Restrictions.eq("valid", true));
		return ur;
	}
/* CUSTOM CODE END */
}
