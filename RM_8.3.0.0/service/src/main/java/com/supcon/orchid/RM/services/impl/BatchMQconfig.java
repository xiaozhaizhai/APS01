package com.supcon.orchid.RM.services.impl;

import javax.annotation.Resource;
import javax.jms.ConnectionFactory;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTopic;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.listener.DefaultMessageListenerContainer;
import com.supcon.orchid.services.ConsulService;

/**
 * 
 * 
 * @author fangjiahan
 */
@Configuration
public class BatchMQconfig implements  ApplicationContextAware{
	
	private ApplicationContext applicationContext;
	private static final String AUTH_TOPIC = "com.supcon.vxbatch.>";
	private String syncBrokerURL="tcp://localhost:61616";
	
	@Resource(name = "rMFMQsyncService")
	private RMFMQsyncService listenerService;
	@Resource
	private ConsulService consulService;

	
	@Bean(name = { "topicjmsContainer" })
	public DefaultMessageListenerContainer topicjmsContainer() {
		String mqurl=consulService.getValueAsString("platform/bap/RM/RM.serviceUrl");
		if (mqurl != null && mqurl.length() > 0 ) {
			syncBrokerURL="tcp://"+mqurl+":61616";
		}
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory( syncBrokerURL);
		ActiveMQTopic topic=new ActiveMQTopic(AUTH_TOPIC);
		JmsTemplate jmst=new JmsTemplate();
		jmst.setConnectionFactory(connectionFactory);
		jmst.setDefaultDestination(topic);
		jmst.setPubSubDomain(true);
		jmst.setReceiveTimeout(3000);
		DefaultMessageListenerContainer topicjmsContainer=new DefaultMessageListenerContainer();
		topicjmsContainer.setConnectionFactory(connectionFactory);
		topicjmsContainer.setDestination(topic);
		topicjmsContainer.setMessageListener(listenerService);
		return topicjmsContainer;
	}
	
	@Bean
	public RMFMQsyncService messageListenerService() {
		RMFMQsyncService service = new RMFMQsyncService();
		return service;
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}


}
