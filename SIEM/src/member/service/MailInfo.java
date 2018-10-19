package member.service;

public class MailInfo {

	private String email;
	private String registerCode;
	private String content;
	
	public MailInfo() {}
	
	public MailInfo(String email, String registerCode) {
		this.email = email;
		this.registerCode = registerCode;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setRegisterCode(String registerCode) {
		this.registerCode = registerCode;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setRegisterContent() {
		this.content = "<a href="
				+"'http://localhost:8080/register.do?email="+email+"&registerCode="+registerCode+"'>"
				+ "지금 이곳을 눌러 바로 인증하세요.</a>";
	}
}
