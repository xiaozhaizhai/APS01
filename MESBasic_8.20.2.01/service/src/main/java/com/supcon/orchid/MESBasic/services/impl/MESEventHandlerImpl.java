/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.services.impl;

import org.osgi.service.event.Event;
import org.osgi.service.event.EventConstants;
import org.osgi.service.event.EventHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supcon.orchid.MESBasic.services.ApiService;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealService;
import com.supcon.orchid.MESBasic.services.MESEventHandler;
import com.supcon.orchid.foundation.entities.Position;
import com.supcon.orchid.services.BaseServiceImpl;
import com.supcon.orchid.MESBasic.services.MESBasicPositionDealService;

/**
 * 岗位事件监听接口 
 * @author zhuyuyin
 * @version 1.0.0
 */
@Service("mesEventHandler")
public class MESEventHandlerImpl extends BaseServiceImpl implements MESEventHandler,EventHandler{
	private static Logger logger = LoggerFactory.getLogger(MESEventHandlerImpl.class);
	/**
	 * 新增岗位topic
	 */
	private static final String EVENT_POSITION_ADD_TOPIC = "com/supcon/orchid/entities/sync/position/add";
	/**
	 * 删除岗位topic
	 */
	private static final String EVENT_POSITION_DELETE_TOPIC = "com/supcon/orchid/entities/sync/position/delete";
	/**
	 * 修改岗位topic
	 */
	private static final String EVENT_POSITION_MODIFY_TOPIC = "com/supcon/orchid/entities/sync/position/modify";
	
	/**
	 *新增人员topic
	 */
	private static final String EVENT_STAFF_ADD_TOPIC = "com/supcon/orchid/entities/sync/staff/add";
	/**
	 *修改人员topic
	 */
	private static final String EVENT_STAFF_MODIFY_TOPIC = "com/supcon/orchid/entities/sync/staff/modify";
	/**
	 *删除人员topic
	 */
	private static final String EVENT_STAFF_DELETE_TOPIC = "com/supcon/orchid/entities/mne/staff/del";
	@Autowired
	private MESBasicPositionDealService positionDealService;
	
	@Autowired
	private ApiService apiService;
	@Override
	public void handleEvent(Event event) {
		String topic = (String) event.getProperty(EventConstants.EVENT_TOPIC);
		if(topic.equals(EVENT_POSITION_ADD_TOPIC) || topic.equals(EVENT_POSITION_DELETE_TOPIC)){
			Object[] mainEntity = (Object[]) event.getProperty(EventConstants.EVENT);
			if ( mainEntity == null)
				return;
			Position position = (Position) mainEntity[0];
			if(null != position){
				if(topic.equals(EVENT_POSITION_ADD_TOPIC)){
					positionDealService.addPositionDeal(position.getId());
				} else {
					positionDealService.deletePosition(position.getId());
				}
			}
			
		}
		//如果是人员、岗位、部门的等发生变化，清空缓存
		if(topic.equals(EVENT_POSITION_DELETE_TOPIC)||topic.equals(EVENT_STAFF_ADD_TOPIC)||topic.equals(EVENT_STAFF_MODIFY_TOPIC)||topic.equals(EVENT_STAFF_DELETE_TOPIC)||topic.equals(EVENT_POSITION_ADD_TOPIC)||topic.equals(EVENT_POSITION_MODIFY_TOPIC)){
			apiService.clearCache();
		}
		
	}
	
}
