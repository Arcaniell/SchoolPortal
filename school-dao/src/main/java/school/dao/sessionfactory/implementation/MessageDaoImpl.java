package school.dao.sessionfactory.implementation;

import school.dao.MessageDao;
import school.model.Message;

public class MessageDaoImpl extends BaseDaoImpl<Message> implements MessageDao{

	public MessageDaoImpl() {
		super(Message.class);
	}
	
}