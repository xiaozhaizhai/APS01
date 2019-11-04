package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.ws.BindingProvider;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sun.msv.reader.trex.ZeroOrMoreState;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicObjProduct;
import com.supcon.orchid.MESBasic.entities.MESBasicObjWareStore;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.MESBasicObjWareStoreService;
import com.supcon.orchid.WOM.daos.WOMBatchingMaterialPartDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialPartDao;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterial;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialNeed;
import com.supcon.orchid.WOM.entities.WOMBatchingMaterialPart;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialNeedService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialPartService;
import com.supcon.orchid.WOM.services.WOMBatchingMaterialService;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WsSyncWOMMaterAllotService;
import com.supcon.orchid.WOM.webservise.wsSyncMaterAllotRecouse.ZMES007;
import com.supcon.orchid.WOM.webservise.wsSyncMaterAllotRecouse.Zmes007Stru;
import com.supcon.orchid.id.IdGenerator;
import com.supcon.orchid.publicSet.services.WOMInterfaceService;

@Service("wsSyncWOMMaterAllotService")
@Transactional
public class WsSyncWOMMaterAllotServiceImpl implements WsSyncWOMMaterAllotService{
	//******第七本  库存调拨*****
private static final Logger logger = LoggerFactory.getLogger(WsSyncWOMMaterAllotServiceImpl.class);
	

	@Autowired
	private IdGenerator autoGeneratorID;	
	@Autowired
	private WOMBatchingMaterialNeedService batchingMaterialNeedService;
	@Autowired
	private WOMBatchingMaterialPartService batchingMaterialPartService;
	@Autowired
	private MESBasicObjWareStoreService mESBasicObjWareStoreService;
	@Autowired
	private WOMBatchingMaterialPartDao batchingMaterialPartDao;
	@Autowired
	private  WOMInterfaceSelfService  wOMInterfaceSelfService;
	
	//实际中需要调用方法
	@Override
	public void sendMaterAllot(Long id) {
		// TODO Auto-generated method stub
		//根据id查询该指令单的生产报工主表
		WOMBatchingMaterialNeed need=batchingMaterialNeedService.getBatchingMaterialNeed(id);
	 //	List<WOMPutInMaterial>  wOMTaskReportingList=wOMPutInMaterialService.getPutInMaterials("TASKID = '"+ id +"' and "+"valid= true", null);
		
	 //	WOMPutInMaterial womPutInMaterial=wOMTaskReportingList.get(0); 		
		List<WOMBatchingMaterialPart>  wOMBatchingMaterialPartList=batchingMaterialPartService.getBatchingMaterialParts("HEAD_ID = '"+ id +"' and "+"valid= true", null);
		
		for (int i = 0; i < wOMBatchingMaterialPartList.size(); i++) {
			
			WOMBatchingMaterialPart  wOMBatchingMaterialPart=wOMBatchingMaterialPartList.get(i);
			sendSAP(wOMBatchingMaterialPart.getId());
			
		}
	
	}
     //传递表体
	@Override
	public void sendSAP(Long id) {
		// TODO Auto-generated method stub
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setServiceClass(ZMES007.class);	
		factory.setAddress("http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes007/800/zmes007/zmes007");
		
		ZMES007 zmes007 = (ZMES007) factory.create();
		BindingProvider bp007=(BindingProvider)zmes007;
		
		bp007.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
		bp007.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");
		String sql = "insert into INTERFACE_SYNC_LOG(ID,LOGID, LOG_BILL_NO, LOG_DATE, LOG_OPERATE, LOG_STAFF, LOG_SYN_FLAG, LOG_FAULT,LOG_TYPE, LOG_IS_IGNORE, LOG_TYPE_DES,CID,LOG_TASK_NO,LOG_BATCH_NUM,LOG_SAP_NO)values(? ,? ,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String loginfor="";
		String logString="";   //日志信息
		long INTERFACE_SYNC_LOG_ID=autoGeneratorID.getNextId("INTERFACE_SYNC_LOG");
		

			WOMBatchingMaterialPart	wOMBatchingMaterialPart=batchingMaterialPartService.getBatchingMaterialPart(id);
			if(wOMBatchingMaterialPart!=null){
			    String logTaskNo=null;//指令单号
			    String logBatchNum=null; //批次号   
			    String logSapNp=null;// SAP单号
			try {
				  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		            String calDate = formatter.format(new Date());   //过账日期
		            String productCode=null;//物品编码
		            String productUnit=null;//单位
		            String fromWarehouse=null; //发出仓库
		            if(wOMBatchingMaterialPart.getTaskID()!=null){
		            	logTaskNo=wOMBatchingMaterialPart.getTaskID().getTableNo();
		            	logBatchNum=wOMBatchingMaterialPart.getTaskID().getProductBatchNum();
		                logSapNp=wOMBatchingMaterialPart.getTaskID().getCharparama();
		            }
		            if(wOMBatchingMaterialPart.getProductId()!=null){
		                 productCode=wOMBatchingMaterialPart.getProductId().getProductCode();  //物品编码
		                 productUnit=wOMBatchingMaterialPart.getProductId().getUnit();          //单位
		            }
		            BigDecimal productNum=wOMBatchingMaterialPart.getDoneNum();           //数量
		            String ALLOTFLAG="1";                                                        //调拨标识   当前默认为1
		            String productBatchNum=wOMBatchingMaterialPart.getBatchNum();//物料批号
		            if("000000".equals(productBatchNum)){
		            	productBatchNum=null;
		            }
					
		            MESBasicFactoryModel factoryModel=wOMBatchingMaterialPart.getFactoryId();
		            MESBasicProduct product=wOMBatchingMaterialPart.getProductId();	
						
		            if(wOMBatchingMaterialPart.getWareID()!=null){
						fromWarehouse=wOMBatchingMaterialPart.getWareID().getWareCode();      //发出仓库
				    }else{		            			            	                                          
						MESBasicFacWareMaterial toWare1=wOMInterfaceSelfService.getFacWareMaterialByfp(factoryModel, product);
			            if(toWare1!=null&&toWare1.getWareId()!=null){
							fromWarehouse=toWare1.getWareId().getWareCode();
			            }
			        }		        
			        MESBasicObjWareStore toWare2=wOMInterfaceSelfService.getObjWareStoreByfp(factoryModel, product);
		            String toWarehouse=null;
			        if(toWare2!=null){
						if(toWare2.getWare()!=null){
			            	toWarehouse =toWare2.getWare().getWareCode();
			            }
			        }  
		            
		            //接受仓库
		            String CharParamA="1";                                                     // 四川默认一步
		           //如果同仓库 不生成调拨单
		         if(toWarehouse!=fromWarehouse||(toWarehouse==null&&fromWarehouse==null)){  
		            
		            Zmes007Stru zmes007Stru=new Zmes007Stru();
		            zmes007Stru.setBudat(calDate);
		            zmes007Stru.setMatnr(productCode);
		            zmes007Stru.setMenge(productNum);
		            zmes007Stru.setReverse(ALLOTFLAG);
		            zmes007Stru.setMeins(productUnit);
		            zmes007Stru.setCharg(productBatchNum);
		            zmes007Stru.setLgort1(fromWarehouse);
		            zmes007Stru.setLgort2(toWarehouse);
		            zmes007Stru.setSteps(CharParamA);
		            loginfor=(" Date：Budat:"+calDate+" Matnr:"+productCode+" Menge:"+productNum+" Reverse:"+ALLOTFLAG+" Meins:"+
		            		productUnit+" Charg:"+productBatchNum+" Lgort1:"+fromWarehouse+" Lgort2:"+toWarehouse+" Steps:"+CharParamA);
		            logString=(" 库存调拨数据： 过账日期:"+calDate+" 物品编码:"+productCode+" 数量:"+productNum+" 调拨标识:"+ALLOTFLAG+" 单位:"+
		            		productUnit+" 批次:"+productBatchNum+" 发出仓库:"+fromWarehouse+" 接收仓库:"+toWarehouse+" 一步/两步:"+CharParamA);
		            
	            
    
	            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_message007 = new javax.xml.ws.Holder<java.lang.String>();
	            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_sflag007 = new javax.xml.ws.Holder<java.lang.String>();
	   
                    zmes007.zMesGetStocktr(zmes007Stru, _zMesGetIqcres_message007, _zMesGetIqcres_sflag007);	
               
	            
	            Long Partid= wOMBatchingMaterialPart.getId();                   //id 
			    String tableNo=wOMBatchingMaterialPart.getHeadId().getTableNo();
			    	//	.getHeadId().getTableNo();//单据编号
			    Date now=new Date();                                 //处理时间
			    String poerate="add";                                //操作类型
			    Long staffID=wOMBatchingMaterialPart.getHeadId().getId(); //同步人员
		    	String  synflag="0";                                 //同步状态
			    String logisignor="0";                             //是否可忽略
			    
			    
			     if("Y".equals(_zMesGetIqcres_sflag007.value)){
			    	  synflag="1";                                 
			 	      logisignor="0";  
			 	 	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_message007.value);
			    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_sflag007.value);
			    	logger.error(_zMesGetIqcres_message007.value, "YYYYYYYYYYYYYYYYYYY");
			    	logger.error(_zMesGetIqcres_sflag007.value, "YYYYYYYYYYYYYYYYYYY");
		            	
		            }else{
		              synflag="0";                                 
					  logisignor="0";       
						logger.error("NNNNNNNNNNNNNN", _zMesGetIqcres_message007.value);
				    	logger.error("NNNNNNNNNNNNNN", _zMesGetIqcres_sflag007.value);
				    	logger.error(_zMesGetIqcres_message007.value, "NNNNNNNNNNN");
				    	logger.error(_zMesGetIqcres_sflag007.value, "NNNNNNNNNNNN");
		            }
			    String logFAault= _zMesGetIqcres_message007.value.toString()+" "+logString+loginfor;                    //错误描述
			    String logType= "sapSyn";                            //数据类型
			    String logtypedes="库存调拨同步给SAP";                //数据类型描述
			    batchingMaterialPartDao.createNativeQuery(sql)
			    .setParameter(0,INTERFACE_SYNC_LOG_ID)
			    .setParameter(1,Partid)   
			    .setParameter(2,tableNo )
			    .setParameter(3, now)
			    .setParameter(4, poerate)
			    .setParameter(5, staffID)
			    .setParameter(6, synflag)
			    .setParameter(7, logFAault)
			    .setParameter(8, logType)
			    .setParameter(9, logisignor)
			    .setParameter(10, logtypedes)
			    .setParameter(11, "1000")
			    .setParameter(12, logTaskNo)
			    .setParameter(13,logBatchNum)
			    .setParameter(14, logSapNp).executeUpdate();
		         }
  
				
			} catch (Exception ex) {
				// TODO: handle exception
			    Long Partid= wOMBatchingMaterialPart.getId();                   //id 
			    String tableNo=wOMBatchingMaterialPart.getHeadId().getTableNo();
			    	//	.getHeadId().getTableNo();//单据编号
			    Date now=new Date();                                 //处理时间
			    String poerate="add";                                //操作类型
			    Long staffID=wOMBatchingMaterialPart.getHeadId().getId(); //同步人员
			    String  synflag="0";                                 //同步状态
			    String logFAault="网络问题或者内部数据不符合要求，出现错误，注意批号等位数"+ ex.toString()+" "+logString+loginfor;                    //错误描述
			    String logType= "sapSyn";                            //数据类型
			    String logtypedes="库存调拨同步给SAP";                //数据类型描述
			    String logisignor="0";                             //是否可忽略
			    if(wOMBatchingMaterialPart.getTaskID()!=null){
		            	logTaskNo=wOMBatchingMaterialPart.getTaskID().getTableNo();
		            	logBatchNum=wOMBatchingMaterialPart.getTaskID().getProductBatchNum();
		                logSapNp=wOMBatchingMaterialPart.getTaskID().getCharparama();
		         }
			    batchingMaterialPartDao.createNativeQuery(sql)
			    .setParameter(0,INTERFACE_SYNC_LOG_ID)
			    .setParameter(1,Partid)   
			    .setParameter(2,tableNo )
			    .setParameter(3, now)
			    .setParameter(4, poerate)
			    .setParameter(5, staffID)
			    .setParameter(6, synflag)
			    .setParameter(7, logFAault)
			    .setParameter(8, logType)
			    .setParameter(9, logisignor)
			    .setParameter(10, logtypedes)
			    .setParameter(11, "1000")
			    .setParameter(12, logTaskNo)
			    .setParameter(13,logBatchNum)
			    .setParameter(14, logSapNp).executeUpdate();
			    }
		
				
			}
	}

	 //重新同步
	@Override
	public Boolean sendSAPforAction(Long logId, Long id) {
		        String loginfor="";
	        	String logString="";   //日志信息 
	           	Boolean sycnFlag=false;
		// TODO Auto-generated method stub
				JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
				factory.setServiceClass(ZMES007.class);	
				factory.setAddress("http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes007/800/zmes007/zmes007");
				
				ZMES007 zmes007 = (ZMES007) factory.create();
				BindingProvider bp007=(BindingProvider)zmes007;
				
				bp007.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
				bp007.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");
				String sql="update INTERFACE_SYNC_LOG set LOG_IS_IGNORE= ? ,LOG_SYN_FLAG=?,LOG_FAULT=? where id=?";
				long INTERFACE_SYNC_LOG_ID=autoGeneratorID.getNextId("INTERFACE_SYNC_LOG");
				WOMBatchingMaterialPart	wOMBatchingMaterialPart=batchingMaterialPartService.getBatchingMaterialPart(logId);
				if(wOMBatchingMaterialPart!=null){
				try {
					  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			            String calDate = formatter.format(new Date());   //过账日期
			            String productCode=null;//物品编码
			            String productUnit=null;//单位
			            String fromWarehouse=null; //发出仓库
			            if(wOMBatchingMaterialPart.getProductId()!=null){
			                 productCode=wOMBatchingMaterialPart.getProductId().getProductCode();  //物品编码
			                 productUnit=wOMBatchingMaterialPart.getProductId().getUnit();          //单位
			            }
			            BigDecimal productNum=wOMBatchingMaterialPart.getDoneNum();           //数量
			            String ALLOTFLAG="1";                                                        //调拨标识   当前默认为1
			            String productBatchNum=wOMBatchingMaterialPart.getBatchNum();//物料批号
			            if("000000".equals(productBatchNum)){
			            	productBatchNum=null;
			            }
			            if(wOMBatchingMaterialPart.getWareID()!=null){
			                 fromWarehouse=wOMBatchingMaterialPart.getWareID().getWareCode();      //发出仓库
			            }
			            MESBasicFactoryModel factoryModel=wOMBatchingMaterialPart.getFactoryId();
			            MESBasicProduct product=wOMBatchingMaterialPart.getProductId();			        
			            MESBasicObjWareStore toWare2=wOMInterfaceSelfService.getObjWareStoreByfp(factoryModel, product);

		                String toWarehouse=null;
		    
			             if	(toWare2!=null){
			            	 if(toWare2.getWare()!=null){
			            		 toWarehouse =toWare2.getWare().getWareCode();
			            	 }
			             }

			            
			            
			            //接受仓库
			            String CharParamA="1";                                                     // 四川默认一步
			            
			            
			            Zmes007Stru zmes007Stru=new Zmes007Stru();
			            zmes007Stru.setBudat(calDate);
			            zmes007Stru.setMatnr(productCode);
			            zmes007Stru.setMenge(productNum);
			            zmes007Stru.setReverse(ALLOTFLAG);
			            zmes007Stru.setMeins(productUnit);
			            zmes007Stru.setCharg(productBatchNum);
			            zmes007Stru.setLgort1(fromWarehouse);
			            zmes007Stru.setLgort2(toWarehouse);
			            zmes007Stru.setSteps(CharParamA);
			            loginfor=(" date：Budat:"+calDate+" Matnr:"+productCode+" Menge:"+productNum+" Reverse:"+ALLOTFLAG+" Meins:"+
			            		productUnit+" Charg:"+productBatchNum+" Lgort1:"+fromWarehouse+" Lgort2:"+toWarehouse+" Steps:"+CharParamA);
			            logString=(" 库存调拨数据： 过账日期:"+calDate+" 物品编码:"+productCode+" 数量:"+productNum+" 调拨标识:"+ALLOTFLAG+" 单位:"+
			            		productUnit+" 批次:"+productBatchNum+" 发出仓库:"+fromWarehouse+" 接收仓库:"+toWarehouse+" 一步/两步:"+CharParamA);
			            
		    
			            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_message007 = new javax.xml.ws.Holder<java.lang.String>();
			            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_sflag007 = new javax.xml.ws.Holder<java.lang.String>();
			            
			            zmes007.zMesGetStocktr(zmes007Stru, _zMesGetIqcres_message007, _zMesGetIqcres_sflag007);
		                         
					     if("Y".equals(_zMesGetIqcres_sflag007.value)){
						    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_message007.value);
						    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_sflag007.value);
						    	logger.error(_zMesGetIqcres_message007.value, "YYYYYYYYYYYYYYYYYYY");
						    	logger.error(_zMesGetIqcres_sflag007.value, "YYYYYYYYYYYYYYYYYYY");
						    	batchingMaterialPartDao.createNativeQuery(sql)
						    	.setParameter(0,"1")
								.setParameter(1,"0")
							    .setParameter(2,_zMesGetIqcres_message007.value.toString()+logString+loginfor)
							    .setParameter(3,id)
							    .executeUpdate();
							    sycnFlag=true;
								return sycnFlag;
				            	
				            }else{
				            	logger.error("NNNNNNNNNNNNNNNNNNN", _zMesGetIqcres_message007.value);
						    	logger.error("NNNNNNNNNNNNNNNNNNN", _zMesGetIqcres_sflag007.value);
						      	logger.error(_zMesGetIqcres_message007.value, "NNNNNNNNNNNNNNNNNNN");
						    	logger.error(_zMesGetIqcres_sflag007.value, "NNNNNNNNNNNNNNNNNNN");
						    	batchingMaterialPartDao.createNativeQuery(sql)
						    	.setParameter(0,"0")
								.setParameter(1,"0")
							    .setParameter(2,_zMesGetIqcres_message007.value.toString()+logString+loginfor)
							    .setParameter(3,id)
							    .executeUpdate();
						    	  sycnFlag=false;
						    	return sycnFlag;
				                                         
				            }
						
					} catch (Exception ex) {
						// TODO: handle exception
						logger.error("NNNNNNNNNNNNNNNNNNN错误错误"+ex.toString(), "NNNNNNNNNNNNNNNNNNN");
				    	logger.error("NNNNNNNNNNNNNNNNNNN错误错误"+ex.toString(), "NNNNNNNNNNNNNNNNNNN");
				    	return sycnFlag;
		
					}
				}
				return sycnFlag;
	
	}


}
