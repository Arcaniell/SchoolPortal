package jms.subscriber;

import org.apache.activemq.command.ActiveMQTopic;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.listener.DefaultMessageListenerContainer;

@Configuration
public class JmsReceiverSpringConfig {
	
	@Bean
	public ActiveMQTopic activeMQTopic() {
		ActiveMQTopic activeMQTopic = new ActiveMQTopic("schoolTopic");
		return activeMQTopic;
	}

	@Bean
	public JmsTemplate jmsTemplate() {
		JmsTemplate jmsTemplate = new JmsTemplate();
		jmsTemplate.setConnectionFactory(connectionFactory());
		jmsTemplate.setPubSubDomain(true);
		jmsTemplate.setDefaultDestination(activeMQTopic());
		jmsTemplate.setDeliveryMode(2);
		jmsTemplate.setSessionAcknowledgeMode(2);
		return jmsTemplate;
	}

	@Bean
	public ActiveMQConnectionFactory connectionFactory() {
		ActiveMQConnectionFactory activeMQConnectionFactory = new ActiveMQConnectionFactory();
		activeMQConnectionFactory.setBrokerURL("failover:tcp://localhost:61616");
		return activeMQConnectionFactory;
	}

	@Bean
	public Subscriber subscriber() {
		return new Subscriber();
	}

	@Bean
	public DefaultMessageListenerContainer messageListenerContainer() {
		DefaultMessageListenerContainer messageListenerContainer = new DefaultMessageListenerContainer();
		messageListenerContainer.setConnectionFactory(connectionFactory());
		messageListenerContainer.setDestination(activeMQTopic());
		messageListenerContainer.setMessageListener(subscriber());
		messageListenerContainer.setConcurrentConsumers(1);
		return messageListenerContainer;
	}
}
