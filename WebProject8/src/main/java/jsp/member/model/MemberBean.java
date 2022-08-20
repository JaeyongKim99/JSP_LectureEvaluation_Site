package jsp.member.model;

public class MemberBean {
	private String nickname; //닉네임
	private String id; //아이디
	private String password; //비밀번호
	private String email; //이메일
	private String classyear; //학년
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getClassyear() {
		return classyear;
	}
	public void setClassyear(String classyear) {
		this.classyear = classyear;
	}

}