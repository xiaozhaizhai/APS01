package com.supcon.orchid.MESBasic.services;

import java.util.Map;

/*
 * @author fangjiahan
 * 
 */
public interface RMFactoryModelService {
	/*
	 * 同步批控工厂模型接口
	 *  
	 * 1、type	   processadd、processupdate 、 processdelete
	 * 			   unitadd、unitupdate 、 unitdelete                        操作类型
	 * 
	 * 2、processid、batchprocessid            对应mes和batch的id
	 * 
	 * 3、unitid 、batchunitid    
	 *     
	 */
	public boolean factoryModelsync(Map<String,String> data);
	
	/*
	 * 确定操作类型接口
	 *  
	 * 1、processid、unitid
	 * 
	 * return 
	 * batchprocessid 、batchunitid  批控对应中间表id  
	 *  type  操作类型   
	 */
	public Map<String, String> checkType(String processid,String unitid );
	
	
	/*
	 * 同步物料至批控-ljc
	 * 
	 * 
	 * */
	//public boolean productSync(Map<String,String> data);
}
