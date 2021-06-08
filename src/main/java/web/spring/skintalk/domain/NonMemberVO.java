package web.spring.skintalk.domain;

public class NonMemberVO {
	private String userId;
	private String phone;
	private String email;
	
	public NonMemberVO() {}

	public NonMemberVO(String userId, String phone, String email) {
		super();
		this.userId = userId;
		this.phone = phone;
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "NonMemberVO [userId=" + userId + ", phone=" + phone + ", email=" + email + "]";
	}
	
	

}
