package com.supcon.orchid.RM.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.MESBasic.entities.MESBasicFactoryModel;
import com.supcon.orchid.MESBasic.services.MESBasicFactoryModelService;
import com.supcon.orchid.MESBasic.services.RMFactoryModelService;
import com.supcon.orchid.RM.daos.RMFactoryMapOtherDao;
import com.supcon.orchid.RM.daos.RMInterfaceSyncLogDao;
import com.supcon.orchid.RM.entities.RMFactoryMapOther;
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.entities.RMInterfaceSyncLog;
import com.supcon.orchid.RM.services.RMFactoryMapOtherService;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.services.ConsulService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service("rMFactoryModelService")
@Transactional
public class RMFactoryModelServiceImpl implements RMFactoryModelService{
	protected final Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	MESBasicFactoryModelService factoryModelService;
	@Autowired
	private RMFactoryMapOtherDao factoryMapOtherDao;
	@Autowired
	private RMInterfaceSyncLogDao interfaceSyncLogDao;
	@Resource
	private ConsulService consulService;
	private String interfaceURL;
	
	private String getUrl(String systemCodeId){
		String sql = "select CODE_DESA from " + SystemCode.TABLE_NAME + " where id = ?";
		String url = interfaceSyncLogDao.createNativeQuery(sql, systemCodeId)!=null?interfaceSyncLogDao.createNativeQuery(sql, systemCodeId).uniqueResult().toString():null;
		return url;
	}
	
	@Override
	public boolean factoryModelsync(Map<String, String> mapdata) {
		//根据系统配置项取Webservice地址
		//interfaceURL=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")!=null&&!"".equals(consulService.getValueAsString("platform/bap/RM/RM.serviceUrl"))?"http://"+consulService.getValueAsString("platform/bap/RM/RM.serviceUrl")+":8081/":"http://localhost:8081/";
		String type=mapdata.get("type");
		String processid=mapdata.get("processid");
		String unitid=mapdata.get("unitid");
		String batchprocessid=mapdata.get("batchprocessid");
		String batchunitid=mapdata.get("batchunitid");
		String data="";
		String logids=mapdata.get("logids");
		MESBasicFactoryModel process=new MESBasicFactoryModel();
		MESBasicFactoryModel unit=new MESBasicFactoryModel();
		if(null!=type&&!"".equals(type)){
			if(type.contains("add")){
				if(unitid != null && unitid.length()>0){
					//设备单元新增
					unit=factoryModelService.getFactoryModel(Long.parseLong(unitid));
					if(null!=unit){
						interfaceURL = getUrl(unit.getInterfaceUrl().getId())!=null&&getUrl(unit.getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(unit.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
						data = getAddUnitString(unit,batchprocessid);
						data = unit.getInterfaceUrl().getId() + "##" + data;
						Map<String,String> createMap = new HashMap<String,String>();
						createMap.put("factoryModels", data);
						String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
						boolean isSuccess=setUnitBatchID(refdata);
						//setLogIgnoreFlag(unitid,"FactoryModel");
						List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,unitid,refdata,"unitadd",logids);
						insertLog(logMap);
						return isSuccess;
					}
				}else{
					//生产线新增
					process=factoryModelService.getFactoryModel(Long.parseLong(processid));
					if(null!=process){
						interfaceURL = getUrl(process.getInterfaceUrl().getId())!=null&&getUrl(process.getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(process.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
						data = getAddProcessString(process);
						data = process.getInterfaceUrl().getId() + "##" + data;
						Map<String,String> createMap = new HashMap<String,String>();
						createMap.put("factoryModels", data);
						String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
						boolean isSuccess=setProcessBatchID(refdata);
						//setLogIgnoreFlag(processid,"FactoryModel");
						List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,processid,refdata,"processadd",logids);
						insertLog(logMap);
						return isSuccess;
					}
				}
			}
			/*if(type.equals("processadd")){
				//生产线新增
				process=factoryModelService.getFactoryModel(Long.parseLong(processid));
				if(null!=process){
					interfaceURL = getUrl(process.getInterfaceUrl().getId())!=null&&getUrl(process.getInterfaceUrl().getId()).length()>0?
							"http://" + getUrl(process.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					data = getAddProcessString(process);
					data = process.getInterfaceUrl().getId() + "##" + data;
					Map<String,String> createMap = new HashMap<String,String>();
					createMap.put("factoryModels", data);
					String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
					boolean isSuccess=setProcessBatchID(refdata);
					//setLogIgnoreFlag(processid,"FactoryModel");
					List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,processid,refdata,"processadd",logids);
					insertLog(logMap);
					return isSuccess;
				}
			}else if(type.equals("unitadd")){
				//设备单元新增
				unit=factoryModelService.getFactoryModel(Long.parseLong(unitid));
				if(null!=unit){
					interfaceURL = getUrl(unit.getInterfaceUrl().getId())!=null&&getUrl(unit.getInterfaceUrl().getId()).length()>0?
							"http://" + getUrl(unit.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					data = getAddUnitString(unit,batchprocessid);
					data = unit.getInterfaceUrl().getId() + "##" + data;
					Map<String,String> createMap = new HashMap<String,String>();
					createMap.put("factoryModels", data);
					String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
					boolean isSuccess=setUnitBatchID(refdata);
					//setLogIgnoreFlag(unitid,"FactoryModel");
					List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,unitid,refdata,"unitadd",logids);
					insertLog(logMap);
					return isSuccess;
				}
			}*/else if(type.equals("processupdate")){
				//生产线更新
				process=factoryModelService.getFactoryModel(Long.parseLong(processid));
				if(null!=process){
					interfaceURL = getUrl(process.getInterfaceUrl().getId())!=null&&getUrl(process.getInterfaceUrl().getId()).length()>0?
							"http://" + getUrl(process.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					if(interfaceURL != null && interfaceURL.length() > 0){
						if(null!=batchprocessid&&!"".equals(batchprocessid)){
							data = getUpdateProcessString(process,batchprocessid);
							data = process.getInterfaceUrl().getId() + "##" + data;
							Map<String,String> createMap = new HashMap<String,String>();
							createMap.put("factoryModels", data);
							createMap.put("_method", "put");
							String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
							boolean isSuccess=checkIssuccess(refdata);
							//setLogIgnoreFlag(processid,"FactoryModel");
							List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,processid,refdata,"processupdate",logids);
							insertLog(logMap);
							return isSuccess;
						}
					}else{
						List<Map<String,String>> logMap= setFactoryLogMap(false,processid,"获取中间服务地址有误","processupdate",logids);
						insertLog(logMap);
						return false;
					}
				}
			}else if(type.equals("unitupdate")){
				//设备单元更新
				unit=factoryModelService.getFactoryModel(Long.parseLong(unitid));
				if(null!=unit){
					interfaceURL = getUrl(unit.getInterfaceUrl().getId())!=null&&getUrl(unit.getInterfaceUrl().getId()).length()>0?
							"http://" + getUrl(unit.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					if(interfaceURL != null && interfaceURL.length() > 0){
						if(null!=batchunitid&&!"".equals(batchunitid)){
							data = getUpdateUnitString(unit,batchunitid);
							data = unit.getInterfaceUrl().getId() + "##" + data;
							Map<String,String> createMap = new HashMap<String,String>();
							createMap.put("factoryModels", data);
							createMap.put("_method", "put");
							String refdata=sendSmsPost(interfaceURL+"factoryModels",createMap);
							boolean isSuccess=checkIssuccess(refdata);
							//setLogIgnoreFlag(unitid,"FactoryModel");
							List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,unitid,refdata,"unitupdate",logids);
							insertLog(logMap);
							return isSuccess;
						}
					}else{
						List<Map<String,String>> logMap= setFactoryLogMap(false,unitid,"获取中间服务地址有误","unitupdate",logids);
						insertLog(logMap);
						return false;
					}
				}
			}else if(type.equals("processdelete")){
				//生产线删除
				if(null!=processid&&!"".equals(processid)){
					process=factoryModelService.getFactoryModel(Long.parseLong(processid));
					if(null!=process){
						interfaceURL = getUrl(process.getInterfaceUrl().getId())!=null&&getUrl(process.getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(process.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					}	
					if(interfaceURL != null && interfaceURL.length() > 0){
						String batchid="";
						List<RMFactoryMapOther> factorymap=factoryMapOtherDao.findByCriteria(Restrictions.eq("mesFacID", processid),Restrictions.eq("valid", true));
						if(null!=factorymap&&factorymap.size()>0){
							batchid=factorymap.get(0).getBatchFacID();
						}
						if(null!=batchid&&!"".equals(batchid)){
							String refdata=sendSmsDelete(interfaceURL+"factoryModels/"+batchid+",Cells");
							boolean isSuccess=checkIssuccess(refdata);
							//setLogIgnoreFlag(processid,"FactoryModel");
							List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,processid,refdata,"processdelete",logids);
							insertLog(logMap);
							return isSuccess;
						}
					
					}else{
						List<Map<String,String>> logMap= setFactoryLogMap(false,processid,"获取中间服务地址有误","unitupdate",logids);
						insertLog(logMap);
						return false;
					}
				}
			}else if(type.equals("unitdelete")){
				//设备单元删除
				 if(null!=unitid&&!"".equals(unitid)){
					unit=factoryModelService.getFactoryModel(Long.parseLong(unitid));
					if(null!=unit){
						interfaceURL = getUrl(unit.getInterfaceUrl().getId())!=null&&getUrl(unit.getInterfaceUrl().getId()).length()>0?
								"http://" + getUrl(unit.getInterfaceUrl().getId()) + ":8081/":"http://localhost:8081/";
					}	
					if(interfaceURL != null && interfaceURL.length() > 0){
						String batchid="";
						List<RMFactoryMapOther> factorymap=factoryMapOtherDao.findByCriteria(Restrictions.eq("mesFacID", unitid),Restrictions.eq("valid", true));
						if(null!=factorymap&&factorymap.size()>0){
							batchid=factorymap.get(0).getBatchFacID();
						}
						if(null!=batchid&&!"".equals(batchid)){
							String refdata=sendSmsDelete(interfaceURL+"factoryModels/"+batchid+",UnitEquips");
							boolean isSuccess=checkIssuccess(refdata);
							//setLogIgnoreFlag(unitid,"FactoryModel");
							List<Map<String,String>> logMap= setFactoryLogMap(isSuccess,unitid,refdata,"unitdelete",logids);
							insertLog(logMap);
							return isSuccess;
						}
					}else{
						List<Map<String,String>> logMap= setFactoryLogMap(false,unitid,"获取中间服务地址有误","unitupdate",logids);
						insertLog(logMap);
						return false;
					}
				}
			}
		}
		return false;
	}
	
	//组织生产线新增的json参数
	public String getAddProcessString(MESBasicFactoryModel factory){
		StringBuffer sb = new StringBuffer(); 
		sb.append("{\"Cells\":[{");
		//sb.append("\"Name\":\""+factory.getName()+"\",");
		sb.append("\"Name\":\""+factory.getCode()+"\",");
		sb.append("\"Remark\":\""+factory.getDescription()+"\",");
		sb.append("\"MESID\":"+factory.getId()+"}]}");
		return sb.toString();
	}
	
	//组织设备单元新增的json参数
	public String getAddUnitString(MESBasicFactoryModel factory,String processid){
		StringBuffer sb = new StringBuffer(); 
		sb.append("{\"UnitEquips\":[{");
		sb.append("\"CellID\":"+processid+",");
		//sb.append("\"Name\":\""+factory.getName()+"\",");
		sb.append("\"Name\":\""+factory.getCode()+"\",");
		sb.append("\"Remark\":\""+factory.getDescription()+"\",");
		sb.append("\"MESID\":"+factory.getId()+"}]}");
		return sb.toString();
	}
	
	//组织生产线更新的json参数
	public String getUpdateProcessString(MESBasicFactoryModel factory,String batchid){
		StringBuffer sb = new StringBuffer(); 
		sb.append("{\"Cells\":[{");
		sb.append("\"ID\":"+batchid+",");
		//sb.append("\"Name\":\""+factory.getName()+"\",");
		sb.append("\"Name\":\""+factory.getCode()+"\",");
		sb.append("\"Remark\":\""+factory.getDescription()+"\"}]}");
		return sb.toString();
	}
	
	//组织设备单元更新的json参数
	public String getUpdateUnitString(MESBasicFactoryModel factory,String batchid){
		StringBuffer sb = new StringBuffer(); 
		sb.append("{\"UnitEquips\":[{");
		sb.append("\"ID\":"+batchid+",");
		//sb.append("\"Name\":\""+factory.getName()+"\",");
		sb.append("\"Name\":\""+factory.getCode()+"\",");
		sb.append("\"Remark\":\""+factory.getDescription()+"\"}]}");
		return sb.toString();
	}
	
	//设置生产线的batchID
	public boolean  setProcessBatchID(String jsondata) {
		if(null==jsondata||"".equals(jsondata)){
			return false;
		}
		 JSONObject sobj;
		try {
			sobj = new JSONObject(jsondata);
			String resultFlag = sobj.getString("dealSuccessFlag");  
	        String  refdata= sobj.getString("data");
	        sobj = new JSONObject(refdata);
	        String  refProcess=sobj.getString("Cells");
	        if("true".equals(resultFlag)){
	        	JSONArray sobjarr = new JSONArray(refProcess);
	        	if(null!=sobjarr){
					for (int i = 0; i < sobjarr.length(); i++) {
						JSONObject Processobj=sobjarr.getJSONObject(i);
						RMFactoryMapOther factorymap=new RMFactoryMapOther();;
						factorymap.setBatchFacID(Processobj.getString("ID"));
						factorymap.setMesFacID(Processobj.getString("MESID"));
						factoryMapOtherDao.save(factorymap);
					}
				}
	        	return true;
	        }
		} catch (JSONException e) {
			log.error(e.getMessage(),e);
		}  
		return false;
	}
	
	//设置设备单元的batchID
	public boolean  setUnitBatchID(String jsondata) {
		if(null==jsondata||"".equals(jsondata)){
			return false;
		}
		 JSONObject sobj;
		try {
			sobj = new JSONObject(jsondata);
			String resultFlag = sobj.getString("dealSuccessFlag");  
	        String  refdata= sobj.getString("data");
	        sobj = new JSONObject(refdata);
	        String  refUnit=sobj.getString("UnitEquips");
	        if("true".equals(resultFlag)){
	        	JSONArray sobjarr = new JSONArray(refUnit);
	        	if(null!=sobjarr){
					for (int i = 0; i < sobjarr.length(); i++) {
						JSONObject Unitobj=sobjarr.getJSONObject(i);
						RMFactoryMapOther factorymap=new RMFactoryMapOther();;
						factorymap.setBatchFacID(Unitobj.getString("ID"));
						factorymap.setMesFacID(Unitobj.getString("MESID"));
						factoryMapOtherDao.save(factorymap);
					}
				}
	        	return true;
	        }
		} catch (JSONException e) {
			log.error(e.getMessage(),e);  
		}  
		return false;
	}
	
	//post方式调用webservice
	public String sendSmsPost(String url,Map<String,String> map){
		if(null==url){
			return null;
		}
        HttpClient httpClient = null;  
        HttpPost httpPost = null;  
        String result = "";  
        try{
        	httpClient=new DefaultHttpClient();
            httpPost = new HttpPost(url);  
            //设置参数  
            List<NameValuePair> list = new ArrayList<NameValuePair>();  
            Iterator iterator = map.entrySet().iterator();  
            while(iterator.hasNext()){  
                Entry<String,String> elem = (Entry<String, String>) iterator.next();  
                list.add(new BasicNameValuePair(elem.getKey(),elem.getValue()));  
            }  
            if(list.size() > 0){  
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,"utf-8");  
                httpPost.setEntity(entity);  
            }  
            HttpResponse response = httpClient.execute(httpPost);  
            if(response != null){  
                HttpEntity resEntity = response.getEntity();  
                if(resEntity != null){  
                    result = EntityUtils.toString(resEntity,"utf-8");
                }  
            }  
        }catch(Exception ex){  
        	log.error(ex.getMessage(),ex);    
        }  
        return result;  
    }
	
	//delete方式调用webservice
	public  String sendSmsDelete(String url){
		if(null==url){
			return null;
		}
		HttpClient httpClient = null;
		HttpDelete httpDelete=null;
		String result = "";
		try{
        	httpClient=new DefaultHttpClient();
        	httpDelete = new HttpDelete(url);  
            HttpResponse response = httpClient.execute(httpDelete);  
            if(response != null){  
                HttpEntity resEntity = response.getEntity();  
                if(resEntity != null){  
                    result = EntityUtils.toString(resEntity,"utf-8");  
                }  
            }  
        }catch(Exception ex){  
        	log.error(ex.getMessage(),ex);  
        }  
		return result;  
	}
	
	//验证是否成功
	public boolean checkIssuccess(String jsondata){
		if(null==jsondata||"".equals(jsondata)){
			return false;
		}
		JSONObject sobj;
		try {
			sobj = new JSONObject(jsondata);
			String resultFlag = sobj.getString("dealSuccessFlag");
			if("true".equals(resultFlag)){
				return true;
			}
		} catch (JSONException e) {
			log.error(e.getMessage(),e);  
		}  
		return false;
	}
	
	//根据生产线id和设备单元id判断执行的操作类型
	public Map<String, String> checkType(String processid,String unitid ){
		String batchprocessid="";
		String batchunitid="";
		String type="";
		Map<String, String> returnmap=new HashMap<String, String>();
		if(null!=processid&&processid.length()>0){
			List<RMFactoryMapOther> factorymap=factoryMapOtherDao.findByCriteria(Restrictions.eq("mesFacID", processid),Restrictions.eq("valid", true));
			if(null!=factorymap&&factorymap.size()>0){
				batchprocessid=factorymap.get(0).getBatchFacID();
			}
		}
		if(null!=unitid&&!"".equals(unitid)){
			List<RMFactoryMapOther> factorymap=factoryMapOtherDao.findByCriteria(Restrictions.eq("mesFacID", unitid),Restrictions.eq("valid", true));
			if(null!=factorymap&&factorymap.size()>0){
				batchunitid=factorymap.get(0).getBatchFacID();
			}
		}
		if(null==batchprocessid||"".equals(batchprocessid)){
			type="processadd";
		}else if(null==unitid||"".equals(unitid)){
			type="processupdate";
		}else if(null==batchunitid||"".equals(batchunitid)){
			type="unitadd";
		}else if(null!=batchunitid&&!"".equals(batchunitid)){
			type="unitupdate";
		}
		returnmap.put("batchprocessid", batchprocessid);
		returnmap.put("batchunitid",batchunitid);
		returnmap.put("type", type);
		return returnmap;
	}
	
	//将日志设为忽视
	public void setLogIgnoreFlag(String ids,String logType){
		String[] logids=null;
		if(null!=ids&&ids.length()>0){
			logids=ids.split(",");
		}
		if(null!=logids){
			for (String id : logids) {
				List<RMInterfaceSyncLog> interfaceLogs=interfaceSyncLogDao.findByCriteria(Restrictions.eq("valid", true),
						Restrictions.eq("logID", id),Restrictions.eq("logType", logType),
						Restrictions.eq("logIsIgnore", false),Restrictions.eq("logSynFlag", false));
				if(null!=interfaceLogs){
					for (RMInterfaceSyncLog interfaceLog : interfaceLogs) {
						interfaceLog.setLogIsIgnore(true);
						interfaceSyncLogDao.save(interfaceLog);
					}
				}
			}
		}
	}
	
	//组织日志的参数
	public List<Map<String,String>> setFactoryLogMap(Boolean isSuccess,String ids,String returnValue,String operationType,String logids){
		String[] idarr=ids.split(",");
		String[] logidarr=null;
		if(null!=logids&&logids.length()>0){
			logidarr=logids.split(",");
		}
		List<Map<String,String>> maplist=new ArrayList<Map<String,String>>();
		for (int i=0;i<idarr.length;i++) {
			MESBasicFactoryModel factoryModel=null;
			factoryModel=factoryModelService.getFactoryModel(Long.parseLong(idarr[i]));
			if(null!=factoryModel){
				Map<String,String> logMap = new HashMap<String,String>();
				logMap.put("logSynFlag", isSuccess.toString());
				logMap.put("logID", factoryModel.getId().toString());
				logMap.put("logTypeDes", factoryModel.getName());
				logMap.put("logType", "FactoryModel");
				logMap.put("logOperate", operationType);
              	if(isSuccess){
                  logMap.put("logFault", "success");
                }else{
                  logMap.put("logFault", returnValue);
                }
				if(null!=logidarr&&null!=logidarr[i]){
					logMap.put("logid", logidarr[i]);
				}
				maplist.add(logMap);
			}
		}
		return maplist;
	}
	
	//根据参数插入日志
	public void insertLog(List<Map<String,String>> maplist){
		for (Map<String, String> data : maplist) {
			RMInterfaceSyncLog interfaceLog=null;
			String logid=data.get("logid");
			if(null!=logid&&!"".equals(logid)){
				interfaceLog=interfaceSyncLogDao.get(Long.parseLong(logid));
			}
			if(null==interfaceLog){
				interfaceLog=new RMInterfaceSyncLog();
			}
			interfaceLog.setLogSynFlag(Boolean.valueOf(data.get("logSynFlag")));
			interfaceLog.setLogID(data.get("logID"));
			interfaceLog.setLogTypeDes(data.get("logTypeDes"));
			interfaceLog.setLogType(data.get("logType"));
			interfaceLog.setLogDate(new Date());
			interfaceLog.setLogOperate((String)data.get("logOperate"));
			interfaceLog.setLogFault((String)data.get("logFault"));
			interfaceSyncLogDao.save(interfaceLog);
		}
	}
}