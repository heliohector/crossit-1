package crossit.teamD.model;

public class AttendanceDO {

	private int atNum;			//출결번호
	private int atUrNum;		//회원번호
	private String atUrName;	//회원이름
	private int atUrTerm;		//회원기수
	private float atRest;		//잔여
	private int atPresent;		//출석
	private int atLate;			//지각
	private int atAbsent;		//결석
	private int atPlus;			//가산점
	

	public AttendanceDO() {
	}

	
	public int getAtNum() {
		return atNum;
	}

	public void setAtNum(int atNum) {
		this.atNum = atNum;
	}

	public int getAtUrNum() {
		return atUrNum;
	}

	public void setAtUrNum(int atUrNum) {
		this.atUrNum = atUrNum;
	}

	public String getAtUrName() {
		return atUrName;
	}

	public void setAtUrName(String atUrName) {
		this.atUrName = atUrName;
	}

	public int getAtUrTerm() {
		return atUrTerm;
	}

	public void setAtUrTerm(int atUrTerm) {
		this.atUrTerm = atUrTerm;
	}

	public float getAtRest() {
		return atRest;
	}

	public void setAtRest(float atRest) {
		this.atRest = atRest;
	}

	public int getAtPresent() {
		return atPresent;
	}

	public void setAtPresent(int atPresent) {
		this.atPresent = atPresent;
	}

	public int getAtLate() {
		return atLate;
	}

	public void setAtLate(int atLate) {
		this.atLate = atLate;
	}

	public int getAtAbsent() {
		return atAbsent;
	}

	public void setAtAbsent(int atAbsent) {
		this.atAbsent = atAbsent;
	}

	public int getAtPlus() {
		return atPlus;
	}

	public void setAtPlus(int atPlus) {
		this.atPlus = atPlus;
	}
}
