/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.services.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;

import com.supcon.orchid.services.ActiveMQSyncService;

/**
 * 
 * 
 * @author zhuyuyin
 * @version 1.0.0
 */
public class MESApplicationListener implements ApplicationListener {

	private static final Logger logger = LoggerFactory.getLogger("bap.sync.MESApplicationListener");
	@Autowired
	private ActiveMQSyncService activeMQSyncService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof MESApplicationEvent) {
			MESApplicationEvent applicationEvent = (MESApplicationEvent) event;
			String topic = applicationEvent.getTopic();
          	logger.info("[ActiveMQ] receive register xml message,topic:{0}",topic);
			if (null != topic) {
				Object source = applicationEvent.getSource();
				if (null != source) {
					String message = (String) source;
                    logger.info("[ActiveMQ] register xml message content:{0}",message);
					if (null != message && message.trim().length() > 0) {
						try {
                          	logger.info("[ActiveMQ] start send message to ActiveMQ");
							activeMQSyncService.sendMessage(topic, message);
                          	logger.info("[ActiveMQ] send message to ActiveMQ Success");
						} catch (Exception e) {
                          	logger.info("[ActiveMQ] send message to ActiveMQ Failed");
							logger.error(e.getMessage(), e);
						}
					}
				}
			}
		}
	}
}
