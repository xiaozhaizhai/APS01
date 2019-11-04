package com.supcon.orchid.WOM.services.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jws.WebService;
import javax.xml.ws.BindingProvider;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.velocity.runtime.log.Log;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.WOM.daos.WOMPutInMaterialDao;
import com.supcon.orchid.WOM.daos.WOMPutInMaterialPartDao;
import com.supcon.orchid.WOM.entities.WOMPutInMaterial;
import com.supcon.orchid.WOM.entities.WOMPutInMaterialPart;
import com.supcon.orchid.WOM.services.WOMInterfaceSelfService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialPartService;
import com.supcon.orchid.WOM.services.WOMPutInMaterialService;
import com.supcon.orchid.WOM.services.WsSyncWOMPutInMaterialService;
import com.supcon.orchid.WOM.wsSyncPutInMaterial.ZMES008;
import com.supcon.orchid.WOM.wsSyncPutInMaterial.Zmes008Stru2;
import com.supcon.orchid.id.IdGenerator;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.MESBasic.entities.MESBasicFacWareMaterial;
import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
//投料

@Service("wsSyncWOMPutInMaterialService")
@Transactional
public class WsSyncWOMPutInMaterialServiceImpl implements WsSyncWOMPutInMaterialService {

	@Autowired
	private WOMPutInMaterialService womPutInMaterialService;
	@Autowired
	private WOMPutInMaterialDao wOMPutInMaterialDao;
	@Autowired
	private WOMPutInMaterialPartService wOMPutInMaterialPartService;
	@Autowired
	private IdGenerator autoGeneratorID;
	@Autowired
	private WOMPutInMaterialPartDao wOMPutInMaterialPartDao;
	@Autowired
	private  WOMInterfaceSelfService  wOMInterfaceSelfService;

	private static final Logger logger = LoggerFactory.getLogger(WsSyncWOMPutInMaterialServiceImpl.class);

	public void syncWOMPutInMaterial(long id) {
		List<WOMPutInMaterialPart> wOMPutInMaterialPartList = wOMPutInMaterialPartService
				.getPutInMaterialParts("HEAD_ID = '" + id + " '", null);

		logger.info("WXYNNNNNNNNNNNNNN" + wOMPutInMaterialPartList.size(),
				"WXYNNNNNNNNNNNNNN" + wOMPutInMaterialPartList.size());

		for (int i = 0; i < wOMPutInMaterialPartList.size(); i++) {

			sendSAP(wOMPutInMaterialPartList.get(i).getId());
		}

	}

	public void sendSAP(Long id) {
		String sql = "insert into INTERFACE_SYNC_LOG(ID,LOGID, LOG_BILL_NO, LOG_DATE, LOG_OPERATE, LOG_STAFF, LOG_SYN_FLAG, LOG_FAULT,LOG_TYPE, LOG_IS_IGNORE, LOG_TYPE_DES,CID,LOG_TASK_NO,LOG_BATCH_NUM,LOG_SAP_NO)values(? ,? ,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		long INTERFACE_SYNC_LOG_ID = autoGeneratorID.getNextId("INTERFACE_SYNC_LOG");
	    String loger="";  //存放数据信息
    	String logString="";   //日志信息 
		  
		javax.xml.ws.Holder<java.lang.String> _zMesGetGi_message = new javax.xml.ws.Holder<java.lang.String>();
		javax.xml.ws.Holder<java.lang.String> _zMesGetGi_sflag = new javax.xml.ws.Holder<java.lang.String>();

		String address = "http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes008/800/zmes008/zmes008";
		JaxWsProxyFactoryBean jaxFactory = new JaxWsProxyFactoryBean();
		jaxFactory.setServiceClass(ZMES008.class);
		jaxFactory.setAddress(address);
		ZMES008 zmes008 = (ZMES008) jaxFactory.create();
		BindingProvider provider = (BindingProvider) zmes008;
		provider.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
		provider.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");

		List<WOMPutInMaterialPart> wOMPutInMaterialPartList = wOMPutInMaterialPartService
				.getPutInMaterialParts("id = '" + id + "'", null);

		WOMPutInMaterialPart womPutInMaterialPart = wOMPutInMaterialPartList.get(0);
		
	    String logTaskNo=null;//指令单号
	    String logSapNp=null;// SAP单号
	    String logBatchNum=null; //批次号   
	    
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String taskNO=null;                                                        //工单号
			String calDate = formatter.format(womPutInMaterialPart.getPutinDate());    //过账日期
			String productCode=null;                                                   //物品编码
			String productUnit=null;                                                   //工作单位
			String wareID=null;                                                        //出库仓库	
			BigDecimal useNum=null;                                                    //投料数量
			String productBatchNum=null;                                               // 批次
			String putFlag="1";                                                        // 反向标识
			if(womPutInMaterialPart.getTaskID()!=null){
				taskNO=womPutInMaterialPart.getTaskID().getCharparama();             //工单号
				 logTaskNo=womPutInMaterialPart.getTaskID().getProductBatchNum();
	             logBatchNum=womPutInMaterialPart.getTaskID().getTableNo();
	             logSapNp=womPutInMaterialPart.getTaskID().getCharparama();
			}
			if(womPutInMaterialPart.getProductId()!=null){
				productCode=womPutInMaterialPart.getProductId().getProductCode();    //物品编号 
				productUnit=womPutInMaterialPart.getProductId().getUnit();           //工作单位
			}
			if(womPutInMaterialPart.getWareID()!=null){
				wareID=womPutInMaterialPart.getWareID().getWareCode();               //出库仓库
			}else{
	            MESBasicFactoryModel factoryModel=womPutInMaterialPart.getFactoryId();
	            MESBasicProduct product=womPutInMaterialPart.getProductId();	
	            if(factoryModel!=null&&product!=null){
	            	MESBasicFacWareMaterial toWare1=wOMInterfaceSelfService.getFacWareMaterialByfp(factoryModel, product);
	                if(toWare1!=null&&toWare1.getWareId()!=null){
	                	wareID=toWare1.getWareId().getWareCode();
	    			 }
	            }
			}
			useNum=womPutInMaterialPart.getUseNum();                                 //投料数量
			productBatchNum=womPutInMaterialPart.getBatchNum();                      //批次
			if("000000".equals(productBatchNum)){
				productBatchNum=null;
			}
		
			
			Zmes008Stru2 zmes008Stru2 = new Zmes008Stru2();
			zmes008Stru2.setAufnr(taskNO);                        // 订单号
			zmes008Stru2.setBudat(calDate);                       // 过账日期
			zmes008Stru2.setMatnr(productCode);                   // 物品编码		
			zmes008Stru2.setMeins(productUnit);                   // 单位
			zmes008Stru2.setReverse(putFlag);                     // 反向标识
			zmes008Stru2.setLgort1(wareID);                       // 出库仓库	
			zmes008Stru2.setMenge(useNum);                        // 投料数量
			if(productBatchNum!=null){
		    	zmes008Stru2.setCharg(productBatchNum);               // 批次		
			}		

			zmes008.zMesGetGi(zmes008Stru2, _zMesGetGi_message, _zMesGetGi_sflag);
			loger="  date： Aufnr:"+taskNO+" Budat:"+calDate+" Matnr:"+productCode+" Meins:"+productUnit+" Reverse:"+putFlag+
					" Lgort1:"+wareID+" Menge:"+useNum+" Charg:"+productBatchNum;
			logString="  工单投料数据： 工单号:"+taskNO+" 过账日期:"+calDate+" 物品编码:"+productCode+" 单位:"+productUnit+" 投料标识:"+putFlag+
					" 出库仓库:"+wareID+" 投料数量:"+useNum+" 批次:"+productBatchNum;
			// 标记id 单据编号 处理时间 操作类型 同步人员 同步状态 错误描述 数据类型
			if ("Y".equals(_zMesGetGi_sflag.value.toString())) {
				Long Partid = womPutInMaterialPart.getId(); // id
				String tableNo = womPutInMaterialPart.getHeadId().getTableNo();// 单据编号
				Date now = new Date(); // 处理时间
				String poerate = "add"; // 操作类型
				Long staffID = womPutInMaterialPart.getHeadId().getCreateStaff().getId();// 同步人员
				String synflag = "1"; // 同步状态
				String logFAault = _zMesGetGi_message.value+logString+loger; // 错误描述
				String logisignor = "0"; // 是否可忽略
			    String logType= "sapSyn";                            //数据类型
			    String logtypedes="工单投料同步给SAP";                //数据类型描述
				wOMPutInMaterialPartDao.createNativeQuery(sql)
				.setParameter(0, INTERFACE_SYNC_LOG_ID)
				.setParameter(1, Partid)
				.setParameter(2, tableNo)
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
			} else {
				logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService",
						_zMesGetGi_message.value);
				logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService",
						_zMesGetGi_sflag.value);
				logger.error(_zMesGetGi_message.value,
						"NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");
				logger.error(_zMesGetGi_sflag.value,
						"NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");
				Long Partid = womPutInMaterialPart.getId(); // id
				String tableNo = womPutInMaterialPart.getHeadId().getTableNo();// 单据编号
				Date now = new Date(); // 处理时间
				String poerate = "add"; // 操作类型
				Long staffID = womPutInMaterialPart.getHeadId().getCreateStaff().getId();// 同步人员
				String synflag = "0"; // 同步状态
				String logFAault = _zMesGetGi_message.value+logString+loger; // 错误描述
				String logisignor = "0"; // 是否可忽略
			    String logType= "sapSyn";                            //数据类型
			    String logtypedes="工单投料同步给SAP";                //数据类型描述
				wOMPutInMaterialPartDao.createNativeQuery(sql).setParameter(0, INTERFACE_SYNC_LOG_ID)
						.setParameter(1, Partid).setParameter(2, tableNo).setParameter(3, now).setParameter(4, poerate)
						.setParameter(5, staffID).setParameter(6, synflag).setParameter(7, logFAault)
						.setParameter(8, logType).setParameter(9, logisignor).setParameter(10, logtypedes)
						.setParameter(11, "1000") .setParameter(12, logTaskNo).setParameter(13,logBatchNum)
					    .setParameter(14, logSapNp).executeUpdate();
			}
		} catch (Exception ex) {
			logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService", ex.toString());
			logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService", ex.toString());
			logger.error(ex.toString(), "NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");
			logger.error(ex.toString(), "NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");
			Long Partid = womPutInMaterialPart.getId(); // id
			String tableNo = womPutInMaterialPart.getHeadId().getTableNo();// 单据编号
			Date now = new Date(); // 处理时间
			String poerate = "add"; // 操作类型
			Long staffID = womPutInMaterialPart.getHeadId().getCreateStaff().getId();// 同步人员
			String synflag = "0"; // 同步状态
			String logFAault = "网络问题！系统内部信息数据不完整或者存在不符合SAP要求数据填写！"+ex.toString()+logString+loger; // 错误描述
			String logisignor = "0"; // 是否可忽略
		    String logType= "sapSyn";                            //数据类型
		    String logtypedes="工单投料同步给SAP";                //数据类型描述
			wOMPutInMaterialPartDao.createNativeQuery(sql).setParameter(0, INTERFACE_SYNC_LOG_ID).setParameter(1, Partid)
					.setParameter(2, tableNo).setParameter(3, now).setParameter(4, poerate).setParameter(5, staffID)
					.setParameter(6, synflag).setParameter(7, logFAault).setParameter(8, logType)
					.setParameter(9, logisignor).setParameter(10, logtypedes).setParameter(11, "1000").setParameter(12, logTaskNo)
					.setParameter(13,logBatchNum) .setParameter(14, logSapNp).executeUpdate();

		    new BAPException(ex.toString());
		}
		
	}
    
	public Boolean sendSAPforAction(Long logId, Long id){
       	Boolean sycnFlag=false;
    	String sql="update INTERFACE_SYNC_LOG set LOG_IS_IGNORE= ? ,LOG_SYN_FLAG= ?,LOG_FAULT=? where id=?";
		long INTERFACE_SYNC_LOG_ID = autoGeneratorID.getNextId("INTERFACE_SYNC_LOG_ID");
		
		javax.xml.ws.Holder<java.lang.String> _zMesGetGi_message = new javax.xml.ws.Holder<java.lang.String>();
		javax.xml.ws.Holder<java.lang.String> _zMesGetGi_sflag = new javax.xml.ws.Holder<java.lang.String>();

		String address = "http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes008/800/zmes008/zmes008";
		JaxWsProxyFactoryBean jaxFactory = new JaxWsProxyFactoryBean();
		jaxFactory.setServiceClass(ZMES008.class);
		jaxFactory.setAddress(address);
		ZMES008 zmes008 = (ZMES008) jaxFactory.create();
		BindingProvider provider = (BindingProvider) zmes008;
		provider.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
		provider.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");

		List<WOMPutInMaterialPart> wOMPutInMaterialPartList = wOMPutInMaterialPartService
				.getPutInMaterialParts("id = '" + logId + "'", null);
        if(wOMPutInMaterialPartList!=null&&wOMPutInMaterialPartList.size()>0){
        	
        }
		WOMPutInMaterialPart womPutInMaterialPart = wOMPutInMaterialPartList.get(0);
		String loger="";
    	String logString="";   //日志信息 
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String taskNO=null;                                                        //工单号
			String calDate = formatter.format(womPutInMaterialPart.getPutinDate());    //过账日期
			String productCode=null;                                                   //物品编码
			String productUnit=null;                                                   //工作单位
			String wareID=null;                                                        //出库仓库	
			BigDecimal useNum=null;                                                    //投料数量
			String productBatchNum=null;                                               // 批次
			String putFlag="1";                                                        // 反向标识
			if(womPutInMaterialPart.getTaskID()!=null){
				taskNO=womPutInMaterialPart.getTaskID().getCharparama();             //工单号
			}
			if(womPutInMaterialPart.getProductId()!=null){
				productCode=womPutInMaterialPart.getProductId().getProductCode();    //物品编号 
				productUnit=womPutInMaterialPart.getProductId().getUnit();           //工作单位
			}
			if(womPutInMaterialPart.getWareID()!=null){
				wareID=womPutInMaterialPart.getWareID().getWareCode();               //出库仓库
			}else{
	            MESBasicFactoryModel factoryModel=womPutInMaterialPart.getFactoryId();
	            MESBasicProduct product=womPutInMaterialPart.getProductId();	
	            if(factoryModel!=null&&product!=null){
	            	MESBasicFacWareMaterial toWare1=wOMInterfaceSelfService.getFacWareMaterialByfp(factoryModel, product);
	                if(toWare1!=null&&toWare1.getWareId()!=null){
	                	wareID=toWare1.getWareId().getWareCode();
	    			 }
	            }
			}
			useNum=womPutInMaterialPart.getUseNum();                                 //投料数量
			productBatchNum=womPutInMaterialPart.getBatchNum();                      //批次
			if("000000".equals(productBatchNum)){
				productBatchNum=null;
			}
		
			
			Zmes008Stru2 zmes008Stru2 = new Zmes008Stru2();
			zmes008Stru2.setAufnr(taskNO);                        // 订单号
			zmes008Stru2.setBudat(calDate);                       // 过账日期
			zmes008Stru2.setMatnr(productCode);                   // 物品编码		
			zmes008Stru2.setMeins(productUnit);                   // 单位
			zmes008Stru2.setReverse(putFlag);                     // 反向标识
			zmes008Stru2.setLgort1(wareID);                       // 出库仓库	
			zmes008Stru2.setMenge(useNum);                        // 投料数量
			if(productBatchNum!=null){
		    	zmes008Stru2.setCharg(productBatchNum);               // 批次		
			}		
			loger=" date:Aufnr:"+taskNO+" Budat:"+calDate+" Matnr:"+productCode+" Meins:"+productUnit+" Reverse:"+putFlag+
					"Lgort1:"+wareID+" Menge:"+useNum+" Charg:"+productBatchNum;
			logString="  工单投料数据： 工单号:"+taskNO+" 过账日期:"+calDate+" 物品编码:"+productCode+" 单位:"+productUnit+" 投料标识:"+putFlag+
					" 出库仓库:"+wareID+" 投料数量:"+useNum+" 批次:"+productBatchNum;
			zmes008.zMesGetGi(zmes008Stru2, _zMesGetGi_message, _zMesGetGi_sflag);
			// 标记id 单据编号 处理时间 操作类型 同步人员 同步状态 错误描述 数据类型
			if("Y".equals(_zMesGetGi_sflag.value)){
		    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetGi_message.value);
		    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetGi_sflag.value);
		    	logger.error(_zMesGetGi_message.value, "YYYYYYYYYYYYYYYYYYY");
		    	logger.error(_zMesGetGi_sflag.value, "YYYYYYYYYYYYYYYYYYY");
		    	wOMPutInMaterialPartDao.createNativeQuery(sql)
		        .setParameter(0,"1")
				.setParameter(1,"1")
				.setParameter(2,_zMesGetGi_message.value+logString+loger)
				.setParameter(3,id)
				.executeUpdate();
			    sycnFlag=true;
				return sycnFlag;
            	
            }else{
    	    	logger.error("NNNNNNNNNNNNNNNNN", _zMesGetGi_message.value);
		    	logger.error("NNNNNNNNNNNNNNNNN", _zMesGetGi_sflag.value);
		    	logger.error(_zMesGetGi_message.value, "NNNNNNNNNNNNNNNNN");
		    	logger.error(_zMesGetGi_sflag.value, "NNNNNNNNNNNNNNNNN");
		    	wOMPutInMaterialPartDao.createNativeQuery(sql)
		        .setParameter(0,"0")
				.setParameter(1,"0")
				.setParameter(2,_zMesGetGi_message.value+logString+loger)
			    .setParameter(3,id)
			    .executeUpdate();
		    	 sycnFlag=false;
		    	return sycnFlag;
                                         
            }
		} catch (Exception ex) {
			logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService", ex.toString()+loger);
			logger.error("NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService", ex.toString()+loger);
			logger.error(ex.toString()+loger, "NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");
			logger.error(ex.toString()+loger, "NNNNNNNNNNWsSyncWOMPutInMaterialServiceWsSyncWOMPutInMaterialService");

			return sycnFlag;
		}		
	}
}