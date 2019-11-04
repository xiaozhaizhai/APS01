/**
 * Copyright (C) 2011 ZHEJIANG SUPCON TECHNOLOGY CO.,LTD. 
 * All rights reserved.
 */
package com.supcon.orchid.X6Basic.services.impl;

import java.util.Dictionary;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;

import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.framework.Constants;
import org.osgi.framework.Filter;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;
import org.osgi.service.event.Event;
import org.osgi.service.event.EventAdmin;
import org.osgi.service.event.EventConstants;
import org.osgi.util.tracker.ServiceTracker;
import org.osgi.util.tracker.ServiceTrackerCustomizer;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.supcon.orchid.services.ActiveMQSyncService;
import com.supcon.orchid.services.BAPMneCodeService;
import com.supcon.orchid.services.SyncService;

/**
 * X6事件发布
 * 
 * @author zhushizhang
 * 
 */
public class X6EventPublisher {
	
	private static ServiceTracker tracker;
	
	private static EventAdmin eventAdmin;
		

	
	static{
		try{
			Bundle bundle = FrameworkUtil.getBundle(X6EventPublisher.class);
			if (null != bundle) {
				BundleContext bundleContext = bundle.getBundleContext();
				Filter filter = FrameworkUtil.createFilter("(|(" + Constants.OBJECTCLASS + "=" + EventAdmin.class.getName()
						+ ")(" + Constants.OBJECTCLASS + "=" + ActiveMQSyncService.class.getName() + ")(" + Constants.OBJECTCLASS + "=" + SyncService.class.getName() + "))");
				ServiceTrackerCustomizer customizer = new X6EventPublisherTracker(bundleContext);
				tracker = new ServiceTracker(bundleContext, filter, customizer);
				tracker.open();
			}
		}catch(Exception e){
			
		}
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public static void postEvent(String eventName, Object eventObject, Map<String, Object> properties) {
		if(null != eventAdmin){
			Dictionary props = new Hashtable();
			props.put(EventConstants.EVENT_TOPIC, eventName);
			props.put(EventConstants.EVENT, eventObject);
			if(null != properties && !properties.isEmpty()) {
				Set<String> names = properties.keySet();
				for(String name : names) {
					if(!EventConstants.EVENT.equals(name) && !EventConstants.EVENT_TOPIC.equals(name)){
						props.put(name, properties.get(name));
					}
				}
			}
			
			Event event = new Event(eventName, props);
			eventAdmin.postEvent(event);
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Transactional(propagation=Propagation.REQUIRED)
	public static void sendEvent(String eventName, Object eventObject, Map<String, Object> properties) throws Exception{
		if(null != eventAdmin ){
			Dictionary props = new Hashtable();
			props.put(EventConstants.EVENT_TOPIC, eventName);
			props.put(EventConstants.EVENT, eventObject);
			if(null != properties && !properties.isEmpty()) {
				Set<String> names = properties.keySet();
				for(String name : names) {
					if(!EventConstants.EVENT.equals(name) && !EventConstants.EVENT_TOPIC.equals(name)){
						props.put(name, properties.get(name));
					}
				}
			}
			
			Event event = new Event(eventName, props);
			eventAdmin.sendEvent(event);
		}
	}
	
	
	
	static class X6EventPublisherTracker implements ServiceTrackerCustomizer{
		
		private BundleContext bundleContext;
		
		public X6EventPublisherTracker(BundleContext bundleContext){
			this.bundleContext = bundleContext;
		}

		@Override
		public Object addingService(ServiceReference reference) {
			Object service = bundleContext.getService(reference);
			if (null != service) {
				if (service instanceof EventAdmin) {
					eventAdmin = (EventAdmin) service;
				}
				return service;
			}
			return null;
		}

		@Override
		public void modifiedService(ServiceReference reference, Object service) {
			if (null != service && service instanceof EventAdmin) {
				eventAdmin = (EventAdmin) service;
			}
		}

		@Override
		public void removedService(ServiceReference reference, Object service) {
			if (service instanceof EventAdmin) {
				eventAdmin = null;
			}
		}
		
	}
	
}
