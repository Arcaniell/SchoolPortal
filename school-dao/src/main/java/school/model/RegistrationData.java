package school.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "REGISTRATION_DATA")
@NamedQuery(name = RegistrationData.FIND_BY_USER_AND_CODE, query = RegistrationData.FIND_BY_USER_AND_CODE_QUERY)
public class RegistrationData {
	
	public static final String FIND_BY_USER_AND_CODE = "RegistrationData.findByUserAndCode";
	public static final String FIND_BY_USER_AND_CODE_QUERY = "SELECT r FROM RegistrationData r WHERE "
			+ "r.user.id = :userId and r.registrationCode = :registrationCode";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(nullable = false)
	private int registrationCode;
	@Column(nullable = false)
	private String question;
	@Column(nullable = false)
	private String answer;
	@OneToOne
	@JoinColumn(name = "userId", nullable = false)
	private User user;
	
	public RegistrationData() {
		super();
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getRegistrationCode() {
		return registrationCode;
	}
	public void setRegistrationCode(int registrationCode) {
		this.registrationCode = registrationCode;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
