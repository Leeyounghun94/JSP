package MemberShip;

public class MemberDTO {
	// Member 객체
	
	
	
	
	//필드
	private String id;
	private String pass;
	private String name;
	private String regdate;
	
	
	
	//생성자
	public MemberDTO() {
		
	}//기본생성자



	
	//메서드 (게터, 세터)
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPass() {
		return pass;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
