/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.services.impl;

import java.io.InputStream;
import java.lang.ref.SoftReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import javax.annotation.Resource;

import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.MESBasic.daos.MESBasicEquipmentDao;
import com.supcon.orchid.MESBasic.daos.MESBasicFactoryModelDao;
import com.supcon.orchid.MESBasic.daos.MESBasicNodeTypeDao;
import com.supcon.orchid.MESBasic.daos.MESBasicObjEquipmentDao;
import com.supcon.orchid.MESBasic.daos.MESBasicObjPostionDao;
import com.supcon.orchid.MESBasic.daos.MESBasicObjProductDao;
import com.supcon.orchid.MESBasic.daos.MESBasicPositionDealDao;
import com.supcon.orchid.MESBasic.daos.MESBasicProductDao;
import com.supcon.orchid.MESBasic.entities.MESBasicEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicNodeType;
import com.supcon.orchid.MESBasic.entities.MESBasicObjEquipment;
import com.supcon.orchid.MESBasic.entities.MESBasicObjPostion;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicPositionDeal;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.ApiService;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.cacheadmin.CacheAdmin;
import com.supcon.orchid.foundation.entities.InfoSetColumn;
import com.supcon.orchid.foundation.entities.Position;
import com.supcon.orchid.foundation.entities.PositionWork;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.services.DepartmentService;
import com.supcon.orchid.foundation.services.InfoSetManager;
import com.supcon.orchid.foundation.services.PositionService;
import com.supcon.orchid.foundation.services.PositionWorkService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.services.ActiveMQSyncService;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.services.Page;
import com.supcon.orchid.utils.EhcacheConcurrentUtils;

/**
 * 
 * 
 * @author zhuyuyin
 * @version 1.0.0
 */
@SuppressWarnings("rawtypes")
@Service("apiService")
@Transactional
public class ApiServiceImpl extends BaseServiceImpl implements ApiService, InitializingBean, DisposableBean, ApplicationContextAware {
	private static final Logger logger = LoggerFactory.getLogger(ApiServiceImpl.class);
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	private static final String GET_STRUCTURE_ROOT = "pims.factory.getstructureroot";// 获取组织架构根节点
	private static final String GET_STRUCTURE = "pims.factory.getstructure";// 获取组织架构树
	private static final String GET_EMPLOYEES = "pims.factory.getemployees";// 获取指定节点下的人员信息
	private static final String GET_DEVICES = "pims.factory.getdevices";// 获取指定节点下的设备信息
	private static final String GET_MATERIEL = "pims.factory.getmateriel";// 获取指定节点下的物料信息
	private static final String GET_STATION = "pims.factory.getstation";// 获取岗位信息
	private static final String GET_ALL_EMPLOYEES = "pims.factory.getallemployees";// 获取所有人员信息
	private static final String ADD_EMPLOYEE = "pims.factory.addemployee";// 添加人员
	private static final String MODIFY_EMPLOYEE = "pims.factory.modifyemployee";// 修改人员
	private static final String REMOVE_EMPLOYEE = "pims.factory.removeemployees";// 删除人员
	private static final String GET_NODE_TYPES = "pims.factory.getnodetypes";// 获取节点类型
	private static final String GET_STRUCTURE_BY_NODE_TYPE = "pims.factory.getstructurebynodetype";// 获取指定节点类型的工厂模型
	private static final String GET_BASE_ALLEMPLOYEES = "pims.base.getallemployees";// 获取所有人员信息
	private static final String GET_BASE_EMPLOYEE_BY_ID = "pims.base.getemployee";// 获取指定人员信息
	private static final String SYNC_EMPLOYEES = "pims.factory.syncemployees";// 同步人员
	private static final String XML_HEAD = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	private static final String NODE_HEAD = "xmlns:xsd=\"http://www.w3org/2001/XML_Schema\" xmlns:xsi=\"http://www.w3.org/2001/XML_Schema-instance\"";
	private static String STRUCTURE_ROOT_NAME = "All";
	private static final String REGEDIT_TOPIC = "com/supcon/orchid/entities/factory/regedit";
	private static final String STRUCTURE_ROOT_KEY = "MESBasic.treeRootName.radion1420598208976";
	
	
	private Ehcache workStateCache = null;
	private ReentrantReadWriteLock workStateCacheLock = new ReentrantReadWriteLock();
	private static final String PIMS_WORK_STATE_CACHE = "pimsWorkStateCache";
	@Autowired
	private CacheAdmin cacheAdmin;
	
	
	private ApplicationContext applicationContext;
	@Resource
	private MESBasicFactoryModelService factoryModelService;
	@Resource
	private MESBasicFactoryModelDao factoryModelDao;

	@Resource
	private StaffService staffService;
	
	@Resource
	private PositionService positionService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private MESBasicObjPostionDao objPosDao;
	@Resource
	private MESBasicEquipmentDao equDao;
	@Resource
	private MESBasicProductDao productDao;
	@Resource
	private MESBasicNodeTypeDao nodeTypeDao;
	@Autowired
	private MESBasicObjEquipmentDao objEquipmentDao;
	@Autowired
	private MESBasicObjProductDao objProductDao;
	@Autowired
	private MESBasicPositionDealDao positionDealDao;
	private SimpleDateFormat dateFormat;
	@Autowired
	private ActiveMQSyncService activeMQSyncService;
	@Autowired
	private InfoSetManager infoSetManager;
	
	
	private String getCacheBuilder(String key){
		String str="";
		Element elem = EhcacheConcurrentUtils.get(workStateCache, key);
		
		if(elem!=null){
			str=elem.getObjectValue().toString();
			
		}
		return str;
	}
	
	private void getCacheBuilder(String key,String value){
		EhcacheConcurrentUtils.put(workStateCache, new Element(key, value));
	}
	@Override
	public void clearCache(){
		workStateCache.removeAll();
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.supcon.orchid.MESBasic.services.ApiService#api(java.lang.String, java.lang.Long)
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public String api(String method, Long id, Long start_parent_id, String node_type_ids, Long tree_show) {
		if (null != method && method.trim().length() > 0) {
			dateFormat = new SimpleDateFormat(DATE_FORMAT);
			StringBuilder builder = new StringBuilder();
			//builder.append("<").append(method).append(" ").append(NODE_HEAD).append(">");
			STRUCTURE_ROOT_NAME = InternationalResource.get(STRUCTURE_ROOT_KEY);
			try {
				if (method.toLowerCase().equals(GET_STRUCTURE_ROOT)) {
					builder.append("<root>");
					builder.append("<name>").append(STRUCTURE_ROOT_NAME).append("</name>");
					builder.append("<desc></desc>");
					builder.append("</root>");
				} else if (method.toLowerCase().equals(GET_STRUCTURE)) {
					//先判断下是否有缓存
					String str=getCacheBuilder(GET_STRUCTURE);
					
					if(str.length() > 0){
						builder.append(str);
					}else{
						List<MESBasicFactoryModel> factoryModels = factoryModelDao.findByHql("from MESBasicFactoryModel where valid=? order by sort asc", true);
						//List<MESBasicFactoryModel> factoryModels = factoryModelDao.findByProperty("valid", true);
						builder.append("<node>");
						builder.append("<id>-1</id>");
						builder.append("<name>").append(STRUCTURE_ROOT_NAME).append("</name>");
						builder.append("<desc></desc>");
						builder.append("<parent_id>-1</parent_id>");
						builder.append("<parent_name></parent_name>");
						builder.append("<node_type_id>-1</node_type_id>");
						if (null != factoryModels && !factoryModels.isEmpty()) {
							builder.append("<children>");
							List<MESBasicFactoryModel> trees = factoryModelService.convertTree(factoryModels);
							for (MESBasicFactoryModel factoryModel : trees) {
								generateXmlRecursive(factoryModel, builder);
							}
							builder.append("</children>");
						}
						builder.append("</node>");
						//放到缓存中
						getCacheBuilder(GET_STRUCTURE,builder.toString());
					}
				
					
					
				} else if (method.toLowerCase().equals(GET_EMPLOYEES)) {
					
					if (null != id) {
						//先判断下是否有缓存
						String str=getCacheBuilder(GET_EMPLOYEES+id);
						if(str.length() > 0){
							builder.append(str);
						}else{
							MESBasicFactoryModel factoryModel = factoryModelDao.get(id);
							if (null != factoryModel) {
								List<MESBasicObjPostion> objPosition = objPosDao.findByProperty("objFactory", factoryModel);
								if (null != objPosition && !objPosition.isEmpty()) {
									Map<Long, Position> positionMap = new HashMap<Long, Position>();
									for (MESBasicObjPostion objPos : objPosition) {
										Position postion = objPos.getObjPos();
										if (null != postion) {
											positionMap.put(postion.getId(), postion);
										}
									}
									List<Long> existStaffIds = new ArrayList<Long>();
									for (MESBasicObjPostion objPos : objPosition) {
										Position postion = objPos.getObjPos();
										if (null != postion) {
											List<Staff> employees = staffService.getStaff(postion, true);
											if (null != employees && !employees.isEmpty()) {
												for (Staff employee : employees) {
													if (existStaffIds.contains(employee.getId())) {
														continue;
													}
													Long mainPositionId = employee.getMainPositionId();
													
													// 工厂模型下的岗位如不包含人员的主岗，则人员信息不返回
													if (null == positionMap.get(mainPositionId)) {
														continue;
													}
													String gender = (null == employee.getSex()) ? "" : InternationalResource.get(employee.getSex().getValue(),
															getCurrentLanguage());
													String mobile = (null == employee.getMobile()) ? "" : employee.getMobile();
													String email = (null == employee.getEmail()) ? "" : employee.getEmail();
													String comment = (null == employee.getMemo()) ? "" : employee.getMemo();
													String ext = "";
													builder.append("<employee>");
													builder.append("<id>").append(employee.getId()).append("</id>");
													builder.append("<code>").append(escapeXmlCharacter(employee.getCode())).append("</code>");
													builder.append("<name>").append(escapeXmlCharacter(employee.getName())).append("</name>");
													builder.append("<gender>").append(gender).append("</gender>");
													builder.append("<mobile>").append(mobile).append("</mobile>");
													// 分机号需要信息集的支持
													builder.append("<ext>").append(ext).append("</ext>");
													builder.append("<mail>").append(email).append("</mail>");
													builder.append("<station>");
													List<PositionWork> works = employee.getPositionWorks();
													if (null != works && !works.isEmpty()) {
														String workInfo = "";
														for (PositionWork work : works) {
															Position position = work.getPosition();
															List<MESBasicObjPostion> objPositions = objPosDao.findByProperty("objPos", position);
															if (null != objPositions && !objPositions.isEmpty()) {
																for (MESBasicObjPostion objPostion : objPositions) {
																	MESBasicFactoryModel model = objPostion.getObjFactory();
																	if (model.isValid()) {
																		workInfo += ";" + STRUCTURE_ROOT_NAME + "-" + model.getFullPathName() + "."
																				+ position.getName();
																	}
																}
															}
														}
														if (workInfo.length() > 0) {
															workInfo = workInfo.substring(1);
															workInfo = workInfo.replaceAll("/", "-");
															builder.append(workInfo);
														}
													}
	
													
													builder.append("</station>");
													builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
													builder.append("<parent_id>").append(factoryModel.getId().toString()).append("</parent_id>");
													builder.append("<parent_name>").append(STRUCTURE_ROOT_NAME +"-"+ escapeXmlCharacter(factoryModel.getFullPathName()).replaceAll("/", "-").toString()).append("</parent_name>");
													builder.append("</employee>");
													existStaffIds.add(employee.getId());
												}
											}
										}
									}
									//放到缓存中
									getCacheBuilder(GET_EMPLOYEES+id,builder.toString());
								}
							} else {
								builder.append("<error>").append("can not find the node(id=" + id + ")").append("</error>");
							}
							
						}
						
					} else {
						builder.append("<error>").append("id is Empty!").append("</error>");
					}
				} else if (method.toLowerCase().equals(GET_DEVICES)) {
						if (null != id) {
							//先判断下是否有缓存
							String str=getCacheBuilder(GET_DEVICES+id);
							if(str.length() > 0){
								builder.append(str);
							}else{
								MESBasicFactoryModel factoryModel = factoryModelDao.get(id);
								if (null != factoryModel) {
									List<MESBasicObjEquipment> objEquipments = objEquipmentDao.findByProperty("objFactory", factoryModel);
									List<MESBasicEquipment> equiment = new ArrayList<MESBasicEquipment>();
									for (MESBasicObjEquipment objEquipment : objEquipments) {
										equiment.add(objEquipment.getObjEqu());
									}
									if (null != equiment && !equiment.isEmpty()) {
										for (MESBasicEquipment equs : equiment) {
											String manufacturer = (null == equs.getEamVendorName()) ? "" : equs.getEamVendorName();
											String purchase_date = (null == equs.getEamBuyTime()) ? "" : dateFormat.format(equs.getEamBuyTime());
											String comment = (null == equs.getDemo()) ? "" : equs.getDemo();
											builder.append("<device>");
											builder.append("<id>").append(equs.getId()).append("</id>");
											builder.append("<code>").append(escapeXmlCharacter(equs.getCode())).append("</code>");
											builder.append("<name>").append(escapeXmlCharacter(equs.getName())).append("</name>");
											builder.append("<manufacturer>").append(escapeXmlCharacter(manufacturer)).append("</manufacturer>");
											builder.append("<purchase_date>").append(purchase_date).append("</purchase_date>");
											builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
											builder.append("<parent_id>").append(factoryModel.getId()).append("</parent_id>");
											builder.append("<parent_name>").append(escapeXmlCharacter(factoryModel.getName())).append("</parent_name>");
											builder.append("</device>");
										}
									}
									//放到缓存中
									getCacheBuilder(GET_DEVICES+id,builder.toString());
								}
							}
					}
				} else if (method.toLowerCase().equals(GET_MATERIEL)) {
					if (null != id) {
						String str=getCacheBuilder(GET_MATERIEL+id);
						if(str.length() > 0){
							builder.append(str);
						}else{
							MESBasicFactoryModel factoryModel = factoryModelDao.get(id);
							if (null != factoryModel) {
								//先判断下是否有缓存
								List<MESBasicObjProduct> objProducts = objProductDao.findByProperty("objFactory", factoryModel);
								List<MESBasicProduct> product = new ArrayList<MESBasicProduct>();
								for (MESBasicObjProduct objProduct : objProducts) {
									product.add(objProduct.getObjProduct());
								}
								if (null != product && !product.isEmpty()) {
									for (MESBasicProduct products : product) {
										String spec = (null == products.getProductSpecif()) ? "" : products.getProductSpecif();
										String comment = (null == products.getProductComment()) ? "" : products.getProductComment();
										builder.append("<materiel>");
										builder.append("<id>").append(products.getId()).append("</id>");
										builder.append("<code>").append(escapeXmlCharacter(products.getProductCode())).append("</code>");
										builder.append("<name>").append(escapeXmlCharacter(products.getProductName())).append("</name>");
										builder.append("<spec>").append(escapeXmlCharacter(spec)).append("</spec>");
										builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
										builder.append("<parent_id>").append(factoryModel.getId()).append("</parent_id>");
										builder.append("<parent_name>").append(escapeXmlCharacter(factoryModel.getName())).append("</parent_name>");
										builder.append("</materiel>");
									}
									getCacheBuilder(GET_MATERIEL+id,builder.toString());
								}
							}
						}
					}
				} else if (method.toLowerCase().equals(GET_STATION)) {
					
					String str=getCacheBuilder(GET_STATION);
					if(str.length() > 0){
						builder.append(str);
					}else{
					
					
					//	List<MESBasicObjPostion> objPosition = objPosDao.findByProperty("valid", true);
						//List<MESBasicFactoryModel> factoryModels = factoryModelDao.findByCriteria(Restrictions.eq("valid", true));
						List<MESBasicObjPostion> objPositions = new ArrayList<MESBasicObjPostion>();
						//if(null != factoryModels && !factoryModels.isEmpty()){
							//for (MESBasicFactoryModel basicFactoryModel : factoryModels){
						List<MESBasicObjPostion> ObjPositionLists = objPosDao.findByHql(" from MESBasicObjPostion where valid=? and objFactory.valid=?",true,true);
						if(null != ObjPositionLists && !ObjPositionLists.isEmpty()){
							objPositions.addAll(ObjPositionLists);
						}
							//}
						//}
						if(!objPositions.isEmpty()){
							Map<Long, Position> objPositionMap = new LinkedHashMap<Long, Position>();
							for (MESBasicObjPostion objPos : objPositions) {
								if (null != objPos.getObjPos()) {
									objPositionMap.put(objPos.getObjPos().getId(), objPos.getObjPos());
								}
							}
							
							List<MESBasicPositionDeal> positionDealList = positionDealDao.findByProperty("valid", true);
							Map<Long, Long> idMap = new HashMap<Long, Long>();
							if (null != positionDealList && !positionDealList.isEmpty()) {
								for (MESBasicPositionDeal positionDeal : positionDealList) {
									idMap.put(positionDeal.getPimsPostion(), positionDeal.getBapPosition());
								}
							}
							List<Position> positions = new LinkedList<Position>();
							if (!idMap.isEmpty()) {
								for (Map.Entry<Long, Long> entry : idMap.entrySet()) {
									Position position = objPositionMap.get(entry.getValue());
									if (null != position) {
										positions.add(position);
									}
								}
							} else {
								positions.addAll(objPositionMap.values());
							}
							Map<Long,Object[]> pimsPositionMap = new HashMap<Long,Object[]>();
							if(null != positions && !positions.isEmpty()){
								try {
									String sql = "select ID,Code,Name,Comment from factory_tbstation";
									SQLQuery sqlQuery = objPosDao.createNativeQuery(sql);
									List<Object[]> list = sqlQuery.list();
									if(null != list && !list.isEmpty()){
										for(Object[] objs : list){
											if(null != objs[0]){
												Long pId = ((Number) objs[0]).longValue();
												pimsPositionMap.put(pId, objs);
											}
										}
									}
								} catch (Exception e) {
									logger.error(e.getMessage(),e);
								}
							}
							for (Position position : positions) {
								Long positionId = position.getId();
								if (!idMap.isEmpty()) {
									for (Map.Entry<Long, Long> entry : idMap.entrySet()) {
										if (entry.getValue().equals(positionId)) {
											positionId = entry.getKey();
											break;
										}
									}
								}
								String code = position.getCode();
								String name = position.getName();
								String comment = (null == position.getDescription()) ? "" : position.getDescription();
								if(null != pimsPositionMap && !pimsPositionMap.isEmpty() && null != pimsPositionMap.get(positionId)){
									Object[] objs = pimsPositionMap.get(positionId);
									code = (null == objs[1]) ? "" : objs[1].toString();
									name = (null == objs[2]) ? "" : objs[2].toString();
									comment = (null == objs[3]) ? "" : objs[3].toString();
								}
								builder.append("<station>");
								builder.append("<id>").append(positionId).append("</id>");
								builder.append("<code>").append(escapeXmlCharacter(code)).append("</code>");
								builder.append("<name>").append(escapeXmlCharacter(name)).append("</name>");
								builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
								builder.append("</station>");
							}
							getCacheBuilder(GET_STATION,builder.toString());
						}
					}
				} else if (method.toLowerCase().equals(GET_ALL_EMPLOYEES)) {
					// 查询所有工厂模型
					String str=getCacheBuilder(GET_ALL_EMPLOYEES);
					if(str.length() > 0){
						builder.append(str);
					}else{
					
						Map<Long, List<MESBasicFactoryModel>> positionFactoryMap = new HashMap<Long, List<MESBasicFactoryModel>>();
						Map<Long, Position> positionMap = new HashMap<Long, Position>();
						List<Long> positionParam = new ArrayList<Long>();
						Map<Long, MESBasicFactoryModel> factoryModelMap = new HashMap<Long, MESBasicFactoryModel>();
							List<MESBasicObjPostion> objPositions = objPosDao.findByHql(" from MESBasicObjPostion where valid=? and objFactory.valid=?",true,true);
							if (null != objPositions && !objPositions.isEmpty()) {
								for (MESBasicObjPostion objPostion : objPositions) {
									Position position = objPostion.getObjPos();
									MESBasicFactoryModel objFactory=objPostion.getObjFactory();
									if (null != position) {
										List<MESBasicFactoryModel> list = positionFactoryMap.get(position.getId());
										if (null == list) {
											list = new ArrayList<MESBasicFactoryModel>();
										}
										list.add(objFactory);
										positionFactoryMap.put(position.getId(), list);
										positionMap.put(position.getId(), position);
										positionParam.add(position.getId());
									}
									factoryModelMap.put(objFactory.getId(), objFactory);
								}
						}
						if (!positionFactoryMap.isEmpty()) {
							
							List<Staff> allemployees = staffService.findByCriteria(Restrictions.eq("valid", true),Restrictions.in("mainPositionId", positionParam.toArray()));
							
							if (null != allemployees && !allemployees.isEmpty()) {
								for (Staff employee : allemployees) {
									if (employee.getCode().equals("admin")) {
										continue;
									}
									Long mainPositionId = employee.getMainPositionId();
									List<MESBasicFactoryModel> models = positionFactoryMap.get(mainPositionId);
									if (null != mainPositionId && null != models) {// 工厂模型关联了主岗
										List<PositionWork> works=staffService.getPositionWorks("from PositionWork where staff=? and valid=1", employee);
										String workInfo = "";
										String parentId = "";
										String parentName = "";
										for (PositionWork work : works) {
											if(null != work){
												Position pos = work.getPosition();
												if(null == pos){
													continue;
												}
												List<MESBasicFactoryModel> modelList = positionFactoryMap.get(pos.getId());
												if (null != modelList && !modelList.isEmpty()) {
													for (MESBasicFactoryModel factoryModel : modelList) {
														workInfo += ";" + STRUCTURE_ROOT_NAME + "-" + factoryModel.getFullPathName() + "." + pos.getName();
														if (pos.getId().equals(mainPositionId)) {
															parentId = factoryModel.getId().toString();
//															String fullPathName = factoryModel.getFullPathName();
//															int index = fullPathName.lastIndexOf("/");
//															if(index > 0){
//																fullPathName = fullPathName.substring(0, index);
//															} else {
//																fullPathName = "";
//															}
															parentName = STRUCTURE_ROOT_NAME +"-"+ factoryModel.getFullPathName().replaceAll("/", "-");
														}
													}
												}
											}
										}
										if (workInfo.length() > 0) {
											workInfo = workInfo.substring(1);
											workInfo = workInfo.replaceAll("/", "-");
										}
									
										String gender = (null == employee.getSex()) ? "" : InternationalResource.get(employee.getSex().getValue(),
												getCurrentLanguage());
										String mobile = (null == employee.getMobile()) ? "" : employee.getMobile();
										String email = (null == employee.getEmail()) ? "" : employee.getEmail();
										String comment = (null == employee.getMemo()) ? "" : employee.getMemo();
										String ext = "";
										builder.append("<employee>");
										builder.append("<id>").append(employee.getId()).append("</id>");
										builder.append("<code>").append(escapeXmlCharacter(employee.getCode())).append("</code>");
										builder.append("<name>").append(escapeXmlCharacter(employee.getName())).append("</name>");
										builder.append("<gender>").append(gender).append("</gender>");
										builder.append("<mobile>").append(mobile).append("</mobile>");
										// 分机号需要信息集的支持
										builder.append("<ext>").append(ext).append("</ext>");
										builder.append("<mail>").append(email).append("</mail>");
										builder.append("<station>");
										builder.append(escapeXmlCharacter(workInfo));
										builder.append("</station>");
										builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
										builder.append("<parent_id>").append(parentId).append("</parent_id>");
										builder.append("<parent_name>").append(escapeXmlCharacter(parentName)).append("</parent_name>");
                                      
                                      	//处理信息集
										if(employee!=null){
											List<InfoSetColumn> infoSetColumnList= infoSetManager.getCustomInfoSetColList("LinkInfo");
											if(infoSetColumnList!=null&&infoSetColumnList.size()>0){
												StringBuilder sqlString=new StringBuilder();
												StringBuilder fieldString=new StringBuilder();
												sqlString.append("select ");
												for(InfoSetColumn isc:infoSetColumnList){
													if(isc.getDBFlag() == 1){
														fieldString.append(isc.getCode()).append(",");											
													}										
												}
												if(fieldString.toString().endsWith(",")){
													sqlString.append(fieldString.subSequence(0, fieldString.length()-1)).append(" from base_linkinfo where base_staff_id=?");
													SQLQuery sqlQuery = objPosDao.createNativeQuery(sqlString.toString(),employee.getId());
													sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
													Map<String,Object> result = (Map<String,Object>)sqlQuery.uniqueResult();
													if(result.size()>0){ 
														for(Map.Entry<String, Object> e:result.entrySet()){
															builder.append("<").append(e.getKey().toLowerCase()).append(">")
															.append(e.getValue()==null?"":e.getValue().toString())
															.append("</").append(e.getKey().toLowerCase()).append(">");
														}
													}
												}
											}
										}
										builder.append("</employee>");
									}
								}
								getCacheBuilder(GET_ALL_EMPLOYEES,builder.toString());
							}
						}
					}
				} else if (method.toLowerCase().equals(GET_NODE_TYPES)) {
					// 查询所有工厂模型
					String str=getCacheBuilder(GET_NODE_TYPES);
					if(str.length() > 0){
						builder.append(str);
					}else{
						List<MESBasicNodeType> nodeType = nodeTypeDao.findByProperty("valid", true);
						if (null != nodeType && !nodeType.isEmpty()) {
							for (MESBasicNodeType nodeTypes : nodeType) {
								String desc = (null == nodeTypes.getNodeComment()) ? "" : nodeTypes.getNodeComment();
								builder.append("<nodetype>");
								builder.append("<id>").append(nodeTypes.getId()).append("</id>");
								builder.append("<code>").append(escapeXmlCharacter(nodeTypes.getCode())).append("</code>");
								builder.append("<name>").append(escapeXmlCharacter(nodeTypes.getName())).append("</name>");
								builder.append("<desc>").append(escapeXmlCharacter(desc)).append("</desc>");
								builder.append("</nodetype>");
							}
							getCacheBuilder(GET_NODE_TYPES,builder.toString());
						}
						
					}
					
				} else if (method.toLowerCase().equals(ADD_EMPLOYEE)) {
					// TODO
				} else if (method.toLowerCase().equals(MODIFY_EMPLOYEE)) {
					// TODO
				} else if (method.toLowerCase().equals(GET_STRUCTURE_BY_NODE_TYPE)) {
					if (null != start_parent_id && null != node_type_ids) {
						// 查询所有工厂模型
						String str=getCacheBuilder(GET_STRUCTURE_BY_NODE_TYPE+start_parent_id);
						if(str.length() > 0){
							builder.append(str);
						}else{
						
							MESBasicFactoryModel factoryModel = factoryModelDao.get(start_parent_id);
							if (null != factoryModel || start_parent_id.longValue() == -1) {
								String layrecPerfix = null;
								if (null != factoryModel) {
									layrecPerfix = factoryModel.getLayRec() + "-%";
								}
								String[] ids = node_type_ids.split(",");
								Long[] nodeTypeIds = new Long[ids.length];
								for (int i = 0; i < nodeTypeIds.length; i++) {
									nodeTypeIds[i] = Long.parseLong(ids[i]);
								}
								if (null == tree_show) {
									tree_show = 1L;
								}
								int nodeLevel = 0;
								if (null != factoryModel && null != factoryModel.getLayRec()) {
									nodeLevel = factoryModel.getLayRec().split("-").length;
								}
								List<MESBasicFactoryModel> factoryModels = null;
								if (null != factoryModel) {
									factoryModels = factoryModelDao.findByCriteria(Restrictions.eq("valid", true),
											Restrictions.or(Restrictions.like("layRec", layrecPerfix), Restrictions.eq("id", factoryModel.getId())),
											Restrictions.in("nodeType.id", nodeTypeIds));
								} else {
									factoryModels = factoryModelDao.findByCriteria(Restrictions.eq("valid", true), Restrictions.in("nodeType.id", nodeTypeIds));
								}
								if (null != factoryModels && !factoryModels.isEmpty()) {
									if (1 == tree_show.longValue()) {// 树形
										Map<Long, MESBasicFactoryModel> factoryModelMap = new LinkedHashMap<Long, MESBasicFactoryModel>();
										for (MESBasicFactoryModel factorynode : factoryModels) {
											factoryModelMap.put(factorynode.getId(), factorynode);
										}
										Set<Long> allIds = new LinkedHashSet<Long>();
										for (MESBasicFactoryModel factorynode : factoryModels) {
											String pids = null;
											if (start_parent_id == -1) {// 从根节点搜索
												pids = factorynode.getLayRec();
											} else if (nodeLevel == 1) {// 一级子节点搜索
												String[] fIds = factorynode.getLayRec().split(start_parent_id + "-");
												if (fIds.length > 1) {
													pids = fIds[1];
												}
											} else {
												String[] fIds = factorynode.getLayRec().split("-" + start_parent_id + "-");
												if (fIds.length > 1) {
													pids = fIds[1];
												}
											}
											if (null != pids && pids.trim().length() > 0) {
												for (String pid : pids.split("-")) {
													allIds.add(Long.parseLong(pid));
												}
											}
										}
										List<MESBasicFactoryModel> basicFactoryModels = new LinkedList<MESBasicFactoryModel>();
										if (null != allIds && !allIds.isEmpty()) {
											for (Long pid : allIds) {
												MESBasicFactoryModel model = factoryModelMap.get(pid);
												if (null == model) {
													model = factoryModelDao.get(pid);
												}
												factoryModelMap.put(model.getId(), model);
												if (null == factoryModel || !factoryModel.getId().equals(model.getId())) {
													basicFactoryModels.add(model);
												}
											}
										}
										Long parentId = null;
										if (null != factoryModel) {
											parentId = factoryModel.getParentId();
											factoryModel.setParentId(null);
											factoryModelMap.put(factoryModel.getId(), factoryModel);
											basicFactoryModels.add(factoryModel);
										}
										List<MESBasicFactoryModel> trees = factoryModelService.convertTree(basicFactoryModels);
										if (null != factoryModel && parentId != -1) {
											factoryModel = trees.get(0);
											MESBasicFactoryModel parentNode = factoryModelDao.findEntityByProperty("id", parentId);
											factoryModel.setParent(parentNode);
											factoryModel.setParentId(parentId);
										}
										if (null == factoryModel) {
											builder.append("<node>");
											builder.append("<id>-1</id>");
											builder.append("<name>").append(STRUCTURE_ROOT_NAME).append("</name>");
											builder.append("<desc></desc>");
											builder.append("<parent_id>-1</parent_id>");
											builder.append("<parent_name></parent_name>");
											builder.append("<node_type_id>-1</node_type_id>");
										}
										if (null != trees && !trees.isEmpty()) {
											if (null == factoryModel) {
												builder.append("<children>");
											}
											for (MESBasicFactoryModel fm : trees) {
												generateXmlRecursive(fm, builder);
											}
											if (null == factoryModel) {
												builder.append("</children>");
											}
										}
										if (null == factoryModel) {
											builder.append("</node>");
										}
									} else if (0 == tree_show.longValue()) {
										for (MESBasicFactoryModel factorynode : factoryModels) {
											String desc = (null == factorynode.getDescription()) ? "" : factorynode.getDescription();
											builder.append("<node>");
											builder.append("<id>").append(factorynode.getId()).append("</id>");
											builder.append("<name>").append(escapeXmlCharacter(factorynode.getName())).append("</name>");
											builder.append("<desc>").append(escapeXmlCharacter(desc)).append("</desc>");
											builder.append("</node>");
										}
									}
									getCacheBuilder(GET_STRUCTURE_BY_NODE_TYPE+start_parent_id,builder.toString());
								}
							}
						}
					}
				} else if (method.toLowerCase().equals(REMOVE_EMPLOYEE)) {
					// TODO
				} else if (method.toLowerCase().equals(SYNC_EMPLOYEES)) {
					// TODO
				} else if (method.toLowerCase().equals(GET_BASE_ALLEMPLOYEES)) {
					
					// 查询所有工厂模型
					String str=getCacheBuilder(GET_BASE_ALLEMPLOYEES);
					if(str.length() > 0){
						builder.append(str);
					}else{
					
						List <Staff> baseallemployees=staffService.findAllStaff();
						if (null !=baseallemployees && !baseallemployees.isEmpty()){
							for (Staff baseallemployee :baseallemployees){
								if (!baseallemployee.getCode().equals("admin") && baseallemployee.isValid()) {
									String gender = (null == baseallemployee.getSex()) ? "" : InternationalResource.get(baseallemployee.getSex().getValue(),
											getCurrentLanguage());
									String mobile = (null == baseallemployee.getMobile()) ? "" : baseallemployee.getMobile();
									String email = (null == baseallemployee.getEmail()) ? "" : baseallemployee.getEmail();
									String comment = (null == baseallemployee.getMemo()) ? "" : baseallemployee.getMemo();
									String ext = "";
									builder.append("<employee>");
									builder.append("<id>").append(baseallemployee.getId()).append("</id>");
									builder.append("<code>").append(escapeXmlCharacter(baseallemployee.getCode())).append("</code>");
									builder.append("<name>").append(escapeXmlCharacter(baseallemployee.getName())).append("</name>");
									builder.append("<gender>").append(gender).append("</gender>");
									builder.append("<mobile>").append(mobile).append("</mobile>");
									builder.append("<ext>").append(ext).append("</ext>");
									builder.append("<mail>").append(email).append("</mail>");
									builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
									builder.append("</employee>");
								}
							
								
							}
							getCacheBuilder(GET_BASE_ALLEMPLOYEES,builder.toString());
						}
					}

				} else if (method.toLowerCase().equals(GET_BASE_EMPLOYEE_BY_ID)) {
					if (null !=id){
						// 查询所有工厂模型
						String str=getCacheBuilder(GET_BASE_EMPLOYEE_BY_ID+id);
						if(str.length() > 0){
							builder.append(str);
						}else{
							Staff employee=staffService.get(id);
							if (!employee.getCode().equals("admin")&& employee.isValid()) {
								String gender = (null == employee.getSex()) ? "" : InternationalResource.get(employee.getSex().getValue(),
										getCurrentLanguage());
								String mobile = (null == employee.getMobile()) ? "" : employee.getMobile();
								String email = (null == employee.getEmail()) ? "" : employee.getEmail();
								String comment = (null == employee.getMemo()) ? "" : employee.getMemo();
								String ext = "";
								builder.append("<employee>");
								builder.append("<id>").append(employee.getId()).append("</id>");
								builder.append("<code>").append(escapeXmlCharacter(employee.getCode())).append("</code>");
								builder.append("<name>").append(escapeXmlCharacter(employee.getName())).append("</name>");
								builder.append("<gender>").append(gender).append("</gender>");
								builder.append("<mobile>").append(mobile).append("</mobile>");
								builder.append("<ext>").append(ext).append("</ext>");
								builder.append("<mail>").append(email).append("</mail>");
								builder.append("<comment>").append(escapeXmlCharacter(comment)).append("</comment>");
								builder.append("</employee>");	
								getCacheBuilder(GET_BASE_EMPLOYEE_BY_ID+id,builder.toString());
							}
						}
					}

				} else {
					builder.append("<error>").append("there is not find the method named (" + method + ")").append("</error>");
				}
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				builder.append("<error>").append(e.getMessage()).append("</error>");
			}
			builder.append("</").append(method).append(">");
			StringBuilder tagSb=new StringBuilder();
			tagSb.append("<").append(method).append(" ").append(NODE_HEAD).append(">");
			builder.insert(0, tagSb);
			builder.insert(0, XML_HEAD);
			return builder.toString();
		}
		return null;
	}

	/**
	 * 递归组织工厂模型xml
	 * 
	 * @param factoryModel
	 * @param builder
	 */
	private static void generateXmlRecursive(MESBasicFactoryModel factoryModel, StringBuilder builder) {
		if (null != factoryModel) {
			long parantId = (null == factoryModel.getParentId()) ? -1 : factoryModel.getParentId();
			String parantName = STRUCTURE_ROOT_NAME;
			parantName += ((null == factoryModel.getParent()) ? "" : ("-" + factoryModel.getParent().getFullPathName().replace("/", "-")));
			long nodeTypeId = (null == factoryModel.getNodeType()) ? -1 : factoryModel.getNodeType().getId();
			builder.append("<node>");
			builder.append("<id>").append(factoryModel.getId()).append("</id>");
			builder.append("<name>").append(escapeXmlCharacter(factoryModel.getName())).append("</name>");
			builder.append("<desc>").append(escapeXmlCharacter(factoryModel.getDescription())).append("</desc>");
			builder.append("<parent_id>").append(parantId).append("</parent_id>");
			builder.append("<parent_name>").append(escapeXmlCharacter(parantName)).append("</parent_name>");
			builder.append("<node_type_id>").append(nodeTypeId).append("</node_type_id>");
			List<MESBasicFactoryModel> children = factoryModel.getChildren();
			if (null != children && !children.isEmpty()) {
				builder.append("<children>");
				for (MESBasicFactoryModel child : children) {
					generateXmlRecursive(child, builder);
				}
				builder.append("</children>");
			}
			builder.append("</node>");
		}
	}

	@Override
	public String getRegisterXml() {
		StringBuilder builder = new StringBuilder();
		String filePath = "/META-INF/api/register.xml";
		InputStream stream = getClass().getResourceAsStream(filePath);
		SAXReader reader = new SAXReader();
		try {
			Document document = reader.read(stream);
			builder.append(document.asXML());
		} catch (DocumentException e) {
			logger.error(e.getMessage(), e);
		}
		return builder.toString();
	}

	@Override
	public void destroy() throws Exception {

	}

	@Override
	public void afterPropertiesSet() throws Exception {
		/*if (null != applicationContext) {
          	logger.info("[ActiveMQ] send register xml");
			String message = this.getRegisterXml();
			MESApplicationEvent event = new MESApplicationEvent(message, REGEDIT_TOPIC);
			applicationContext.publishEvent(event);
          	logger.info("[ActiveMQ] send register xml success");
		}*/
		
		workStateCache=cacheAdmin.getCache(PIMS_WORK_STATE_CACHE);
		
      	logger.info("[ActiveMQ] send register xml");
		String message = this.getRegisterXml();
		logger.info("[ActiveMQ] register xml message content:{0}",message);
		if (null != message && message.trim().length() > 0) {
			try {
				logger.info("[ActiveMQ] start send message to ActiveMQ");
				activeMQSyncService.sendMessage(REGEDIT_TOPIC, message);
				logger.info("[ActiveMQ] send message to ActiveMQ Success");
			} catch (Exception e) {
				logger.info("[ActiveMQ] send message to ActiveMQ Failed");
				logger.error(e.getMessage(), e);
			}
		}
		
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
  
  	private static String escapeXmlCharacter(String str){
		if(null != str && !str.isEmpty()){
			if(str.indexOf("&") != -1){
				str = str.replace("&", "&amp;");
			}
			if(str.indexOf("<") != -1){
				str = str.replace("<", "&lt;");
			}
			return str;
		}
		return "";
	}

}
