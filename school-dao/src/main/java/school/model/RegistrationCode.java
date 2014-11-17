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
@Table(name = "REGISTRATION_CODE")
@NamedQuery(name = RegistrationCode.FIND_BY_USER_AND_CODE, query = RegistrationCode.FIND_BY_USER_AND_CODE_QUERY)
public class RegistrationCode {
	
	public static final String FIND_BY_USER_AND_CODE = "RegistrationCode.findByUserAndCode";
	public static final String FIND_BY_USER_AND_CODE_QUERY = "SELECT r FROM RegistrationCode r WHERE "
			+ "r.user.id = :userId and r.registrationCode = :registrationCode";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(nullable = false)
	private int registrationCode;
	@OneToOne
	@JoinColumn(name = "userId", nullable = false)
	private User user;
	
	public RegistrationCode() {
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
