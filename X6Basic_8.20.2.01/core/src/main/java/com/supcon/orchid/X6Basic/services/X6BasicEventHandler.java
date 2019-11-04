package com.supcon.orchid.X6Basic.services;

import java.util.Map;

import com.supcon.orchid.X6Basic.entities.X6BasicSyncConfigs;
import com.supcon.orchid.X6Basic.entities.X6BasicSyncLog;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.User;
import com.supcon.orchid.services.BAPException;

public interface X6BasicEventHandler{
	public void syncBBs(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log);
	public void syncPandion(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log);
	public void syncEmail(X6BasicSyncConfigs syncConfig,String topic,User user,Staff staff,X6BasicSyncLog log);
	/*
	 * osgi事件发布
	 * syncFlag=true 同步，否则异步
	 * 
	 * */
	public void setBAPEventPublisher(String event, Object[] objs, Map<String, Object> properties,boolean syncFlag) throws BAPException ;
}
