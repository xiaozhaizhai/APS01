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

import com.supcon.orchid.WOM.daos.WOMTaskReportingPartDao;
import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.entities.WOMTaskReportingPart;
import com.supcon.orchid.WOM.services.WOMTaskReportingPartService;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.WOM.services.WSSyncTaskPayService;
import com.supcon.orchid.WOM.webservise.wsSyncTaskPayRecouse.ZMES009;
import com.supcon.orchid.WOM.webservise.wsSyncTaskPayRecouse.Zmes009Stru;
import com.supcon.orchid.id.IdGenerator;


@Service("wSSyncTaskPayService")
@Transactional
public class WSSyncTaskPayServiceImpl implements WSSyncTaskPayService{

	private static final Logger logger = LoggerFactory.getLogger(WSSyncTaskPayServiceImpl.class);
	
    @Autowired
    WOMTaskReportingService  taskReportingService;
    
    @Autowired
    WOMTaskReportingPartService taskReportingPartService;
	//第九本  工单缴库    输入的是指令单ID
    @Autowired
    WOMTaskReportingPartDao taskReportingPartDao;
	
	@Autowired
	private IdGenerator autoGeneratorID;
	
	
    
	@Override
	public void sendSAP(Long id) {
		String sendDate="";
		String loger="";//查看信息
		// TODO Auto-generated method stub
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setServiceClass(ZMES009.class);
		
		factory.setAddress("http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes009/800/zmes009/zmes009");
		
		ZMES009 zmes009 = (ZMES009) factory.create();
		BindingProvider bp009=(BindingProvider)zmes009;
		bp009.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
		bp009.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");
		
		//根据id查询该指令单的生产报工主表
		List<WOMTaskReporting>  wOMTaskReportingList=taskReportingService.getTaskReportings("TASKID = '"+ id +"' and "+"valid= true", null);
	    String logTaskNo=null;//指令单号
	    String logBatchNum=null; //批次号   
	    String logSapNp=null;// SAP单号
		if(wOMTaskReportingList!=null){
        	
			WOMTaskReporting taskReporting=wOMTaskReportingList.get(0);
        	String taskNO=taskReporting.getTaskID().getCharparama();
        	logBatchNum=taskReporting.getTaskID().getProductBatchNum();
        	logSapNp=taskReporting.getTaskID().getCharparama();
        	logTaskNo=taskReporting.getTaskID().getTableNo();
        	//String calDate=taskReporting.getEffectTime().toString();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String calDate = formatter.format(new Date());
        	String productCode=taskReporting.getProductID().getProductCode();
        	String storeWarehouse=null;
        	if(taskReporting.getTaskID().getCharparamb()!=null){
          		storeWarehouse=taskReporting.getTaskID().getCharparamb();
        	}
        	List<WOMTaskReportingPart>  wOMTaskReportingPartList=taskReportingPartService.getTaskReportingParts("HEAD_ID = '"+ taskReporting.getId() +"' and "+"valid= true", null);
        	BigDecimal num=wOMTaskReportingPartList.get(0).getReportNum();
        	BigDecimal reportNUM=null;
        	if(num!=null){
        		reportNUM=num;
        	}
        	
    	
        	Zmes009Stru zmes009Stru=new Zmes009Stru();
        	zmes009Stru.setAufnr(taskNO);               //工单号 1129  000400346607
        	zmes009Stru.setBudat(calDate);              //过账日期 
        	zmes009Stru.setMatnr(productCode);          //物料编码 10035  300005248
        	zmes009Stru.setLgort1(storeWarehouse);      //仓库 
        	zmes009Stru.setMenge(reportNUM);            //数量   800
        	zmes009Stru.setReverse("1");                //反向标识 1
        	 sendDate=" Date:Aufnr:"+taskNO+" Budat:"+calDate+" Matnr:"+productCode+" Lgort1:"+storeWarehouse+" Menge:"+reportNUM+" Reverse:"+"1";
          	 loger=" 工单缴库数据:工单号:"+taskNO+" 过账日期:"+calDate+" 物品编码:"+productCode+" 仓库:"+storeWarehouse+" 数量:"+reportNUM+" 缴库标识:"+"1";
     		
        	 
        	 String sql = "insert into INTERFACE_SYNC_LOG(ID,LOGID, LOG_BILL_NO, LOG_DATE, LOG_OPERATE, LOG_STAFF, LOG_SYN_FLAG, LOG_FAULT,LOG_TYPE, LOG_IS_IGNORE, LOG_TYPE_DES,CID,LOG_TASK_NO,LOG_BATCH_NUM,LOG_SAP_NO)values(? ,? ,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    		long INTERFACE_SYNC_LOG_ID=autoGeneratorID.getNextId("INTERFACE_SYNC_LOG");
        	
     
            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_message = new javax.xml.ws.Holder<java.lang.String>();
            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_sflag = new javax.xml.ws.Holder<java.lang.String>();
           try {
        	   zmes009.zMesGetGr(zmes009Stru, _zMesGetIqcres_message, _zMesGetIqcres_sflag);
               

               
   			System.out.println(_zMesGetIqcres_message.value);
   			System.out.println(_zMesGetIqcres_sflag.value);
   		    if("Y".equals(_zMesGetIqcres_sflag.value.toString())){
   		    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_message.value);
   		    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_sflag.value);
   		    	logger.error( _zMesGetIqcres_message.value, "YYYYYYYYYYYYYYYYYYY");
   		    	logger.error(_zMesGetIqcres_sflag.value, "YYYYYYYYYYYYYYYYYYY");
   		    	   //标记id  单据编号  处理时间 操作类型 同步人员 同步状态 错误描述   数据类型
   			    Long Partid= taskReporting.getId();                   //id 
   			    String tableNo=taskReporting.getTableNo();
   			    	//	.getHeadId().getTableNo();//单据编号
   			    Date now=new Date();                                 //处理时间
   			    String poerate="add";                                //操作类型
   			    Long staffID=taskReporting.getCreateStaff().getId();   //同步人员
   			    String  synflag="1";                                 //同步状态
   			    String logFAault= _zMesGetIqcres_message.value+loger+sendDate;   //错误描述
   			    String logType= "sapSyn";                            //数据类型
   			    String logisignor="0";                             //是否可忽略
   			    String logtypedes="工单缴库同步SAP";                //数据类型描述
   			    taskReportingPartDao.createNativeQuery(sql)
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
   		    }else{
   		    	logger.error("NNNNNNNNNNNNNNNNNNN", _zMesGetIqcres_message.value);
   		    	logger.error("NNNNNNNNNNNNNNNNNNN", _zMesGetIqcres_sflag.value);
   		    	logger.error(_zMesGetIqcres_message.value, "NNNNNNNNNNNNNNNNNNN");
   		    	logger.error(_zMesGetIqcres_sflag.value, "NNNNNNNNNNNNNNNNNNN");
   		    	   //标记id  单据编号  处理时间 操作类型 同步人员 同步状态 错误描述   数据类型
   					    Long Partid= taskReporting.getId();                   //id 
   					    String tableNo=taskReporting.getTableNo();
   					    	//	.getHeadId().getTableNo();//单据编号
   					    Date now=new Date();                                 //处理时间
   					    String poerate="add";                                //操作类型
   					    Long staffID=taskReporting.getCreateStaff().getId();   //同步人员
   					    String  synflag="0";                                 //同步状态
   					    String logFAault=  _zMesGetIqcres_message.value+loger+sendDate;   //错误描述
   					    String logType= "sapSyn";                            //数据类型
   					    String logisignor="0";                             //是否可忽略
   					    String logtypedes="工单缴库同步SAP";                //数据类型描述
   					    taskReportingPartDao.createNativeQuery(sql)
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
		    	   //标记id  单据编号  处理时间 操作类型 同步人员 同步状态 错误描述   数据类型
				    Long Partid= taskReporting.getId();                   //id 
				    String tableNo=taskReporting.getTableNo();
				    	//	.getHeadId().getTableNo();//单据编号
				    Date now=new Date();                                 //处理时间
				    String poerate="add";                                //操作类型
				    Long staffID=taskReporting.getCreateStaff().getId();   //同步人员
				    String  synflag="0";                                 //同步状态
				    String logFAault= ex.toString()+loger+sendDate;   //错误描述
				    String logType= "sapSyn";                            //数据类型
				    String logisignor="0";                             //是否可忽略
				    String logtypedes="工单缴库同步SAP";                //数据类型描述
				    taskReportingPartDao.createNativeQuery(sql)
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
    public Boolean sendSAPforAction(Long logId,Long id) {
    	// TODO Auto-generated method stub
             	String sendDate="";
             	String loger="";
            	Boolean sycnFlag=false;
    			JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
    			factory.setServiceClass(ZMES009.class);
    			
    			factory.setAddress("http://skssapdev.skshu.com.cn:8000/sap/bc/srt/rfc/sap/zmes009/800/zmes009/zmes009");
    			
    			ZMES009 zmes009 = (ZMES009) factory.create();
    			BindingProvider bp009=(BindingProvider)zmes009;
    			bp009.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "yinzhi");
    			bp009.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "1234qwer");
    	      	String sql="update INTERFACE_SYNC_LOG set LOG_IS_IGNORE= ? ,LOG_SYN_FLAG=?,LOG_FAULT=? where id=?";
				long INTERFACE_SYNC_LOG_ID=autoGeneratorID.getNextId("INTERFACE_SYNC_LOG");
    			
    			//根据id查询该指令单的生产报工主表
    			List<WOMTaskReporting>  wOMTaskReportingList=taskReportingService.getTaskReportings("ID = '"+ logId +"' and "+"valid= true", null);    			
    	      
    			if(wOMTaskReportingList!=null){
    	        	
    				WOMTaskReporting taskReporting=wOMTaskReportingList.get(0);
    	        	String taskNO=taskReporting.getTaskID().getCharparama();
    	        	//String calDate=taskReporting.getEffectTime().toString();
    	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	            String calDate = formatter.format(new Date());
    	        	String productCode=taskReporting.getProductID().getProductCode();
    	        	String storeWarehouse=null;
    	        	if(taskReporting.getTaskID().getCharparamb()!=null){
          		        storeWarehouse=taskReporting.getTaskID().getCharparamb();
        	        }
    	        	List<WOMTaskReportingPart>  wOMTaskReportingPartList=taskReportingPartService.getTaskReportingParts("HEAD_ID = '"+ taskReporting.getId() +"' and "+"valid= true", null);
    	        	BigDecimal num=wOMTaskReportingPartList.get(0).getReportNum();
    	        	BigDecimal reportNUM=null;
    	        	if(num!=null){
    	        		reportNUM=num;
    	        	}
    	        	
    	    	
    	        	Zmes009Stru zmes009Stru=new Zmes009Stru();
    	        	zmes009Stru.setAufnr(taskNO);               //工单号
    	        	zmes009Stru.setBudat(calDate);              //过账日期
    	        	zmes009Stru.setMatnr(productCode);          //物料编码
    	        	zmes009Stru.setLgort1(storeWarehouse);      //仓库
    	        	zmes009Stru.setMenge(reportNUM);            //数量
    	        	zmes009Stru.setReverse("1");                //反向标识
    	        	 sendDate=" Aufnr:"+taskNO+" Budat:"+calDate+" Matnr:"+productCode+" Lgort1:"+storeWarehouse+" Menge:"+reportNUM+" Reverse:"+"1";
    	        	 loger=" 工单缴库数据:工单号:"+taskNO+" 过账日期:"+calDate+" 物品编码:"+productCode+" 仓库:"+storeWarehouse+" 数量:"+reportNUM+" 缴库标识:"+"1";
    	        	logger.info("同步给SAP的数据"+sendDate);
    	  
    	        	
    	     
    	            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_message = new javax.xml.ws.Holder<java.lang.String>();
    	            javax.xml.ws.Holder<java.lang.String> _zMesGetIqcres_sflag = new javax.xml.ws.Holder<java.lang.String>();
    	           try {
    	        	   zmes009.zMesGetGr(zmes009Stru, _zMesGetIqcres_message, _zMesGetIqcres_sflag);
    	               

    	               
    	   			System.out.println(_zMesGetIqcres_message.value);
    	   			System.out.println(_zMesGetIqcres_sflag.value);
    	   		    if("Y".equals(_zMesGetIqcres_sflag.value.toString())){
    	   		    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_message.value);
				    	logger.error("YYYYYYYYYYYYYYYYYYY", _zMesGetIqcres_sflag.value);
				    	logger.error(_zMesGetIqcres_message.value, "YYYYYYYYYYYYYYYYYYY");
				    	logger.error(_zMesGetIqcres_sflag.value, "YYYYYYYYYYYYYYYYYYY");
				    	taskReportingPartDao.createNativeQuery(sql)
				    	.setParameter(0,"0")
						.setParameter(1,"1")
					    .setParameter(2,_zMesGetIqcres_message.value.toString()+loger+sendDate)
					    .setParameter(3,id)
					    .executeUpdate();
					    sycnFlag=true;
						return sycnFlag;
    	   		    }else{
    	   		 	   logger.error("NNNNNNNNNNNNNNNNNN", _zMesGetIqcres_message.value);
			    	   logger.error("NNNNNNNNNNNNNNNNNN", _zMesGetIqcres_sflag.value);
			    	   logger.error(_zMesGetIqcres_message.value, "NNNNNNNNNNNNNNNNNNNN");
			    	   logger.error(_zMesGetIqcres_sflag.value, "NNNNNNNNNNNNNNNNNNNNNN");
			    	   taskReportingPartDao.createNativeQuery(sql)
			    	   .setParameter(0,"0")
					   .setParameter(1,"0")
				       .setParameter(2,_zMesGetIqcres_message.value.toString()+loger+sendDate)
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