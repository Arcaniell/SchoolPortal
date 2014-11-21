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
@Table(name = "RESTORE_PASSWORD")
@NamedQuery(name=RestorePassword.FIND_BY_USER_AND_CODE, query=RestorePassword.FIND_BY_USER_AND_CODE_QUERY)
public class RestorePassword {

	public static final String FIND_BY_USER_AND_CODE = "RestorePassword.findByUserAndCode";
	public static final String FIND_BY_USER_AND_CODE_QUERY = "SELECT r FROM RestorePassword r WHERE "
			+ "r.user.id = :userId and r.restoreCode = :restoreCode";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(nullable = false)
	private int restoreCode;
	@Column(length = 65)
	private String newPassword;
	@OneToOne
	@JoinColumn(name = "userId", nullable = false)
	private User user;
	
	public RestorePassword() {
		super();
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getRestoreCode() {
		return restoreCode;
	}
	public void setRestoreCode(int restoreCode) {
		this.restoreCode = restoreCode;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
