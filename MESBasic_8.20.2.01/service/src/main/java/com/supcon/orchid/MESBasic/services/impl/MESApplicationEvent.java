/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.MESBasic.services.impl;

import org.springframework.context.ApplicationEvent;

/**
 * 
 * 
 * @author zhuyuyin
 * @version 1.0.0
 */
public class MESApplicationEvent extends ApplicationEvent {

	private static final long serialVersionUID = -2184714337700688586L;
	
	private String topic;
	
	public MESApplicationEvent(Object source) {
		super(source);
	}
	
	public MESApplicationEvent(Object source,String topic) {
		super(source);
		this.topic = topic;
	}

	public String getTopic() {
		return topic;
	}

}
