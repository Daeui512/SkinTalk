package web.spring.skintalk.domain;

public class RequestMessageVO {
	private String userKey;
	private String type;
	private String content;
	
	public RequestMessageVO() {
		// TODO Auto-generated constructor stub
	}

	public RequestMessageVO(String userKey, String type, String content) {
		super();
		this.userKey = userKey;
		this.type = type;
		this.content = content;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "RequestMessageVO [userKey=" + userKey + ", type=" + type + ", content=" + content + "]";
	}
	

}
