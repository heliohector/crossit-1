package crossit.teamD.model;

public class UserDO {
	private int urNum;			//회원번호
	private String urName;		//회원이름
	private int urTerm;			//회원기수
	
	public UserDO(){
	}

	
	public int getUrNum() {
		return urNum;
	}

	public void setUrNum(int urNum) {
		this.urNum = urNum;
	}

	public String getUrName() {
		return urName;
	}

	public void setUrName(String urName) {
		this.urName = urName;
	}

	public int getUrTerm() {
		return urTerm;
	}

	public void setUrTerm(int urTerm) {
		this.urTerm = urTerm;
	}
}
