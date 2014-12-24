package jms.publisher;

import org.apache.activemq.command.ActiveMQTopic;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jms.core.JmsTemplate;

@Configuration
public class JmsSenderSpringConfig {

	@Autowired
	ActiveMQConnectionFactory activeMQConnectionFactory;

	@Bean
	public ActiveMQTopic activeMQTopic() {
		ActiveMQTopic activeMQTopic = new ActiveMQTopic("schoolTopic");
		return activeMQTopic;
	}

	@Bean
	public JmsTemplate jmsTemplate() {
		JmsTemplate jmsTemplate = new JmsTemplate();
		jmsTemplate.setConnectionFactory(activeMQConnectionFactory);
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
	public Publisher publisher() {
		Publisher publisher = new Publisher();
		publisher.setJmsTemplate(jmsTemplate());
		return publisher;
	}
}
