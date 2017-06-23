package crossit.teamD.model;

import javax.servlet.http.HttpServletRequest;

public class ContactDO {
	private int ctNum;				//문의번호
	private String ctName;			//문의자이름
	private String ctEmail;			//문의자이메일
	private String ctMsg;			//문의내용
	private String ctRgDate;		//문의일자
	private String ctReply;			//답장내용
	

	public ContactDO() {
	}

	public ContactDO getRequestParameter(HttpServletRequest request){
		ContactDO ctDO = new ContactDO();
		
		ctDO.setCtName(request.getParameter("name"));
		ctDO.setCtEmail(request.getParameter("email"));
		ctDO.setCtMsg(request.getParameter("msg"));
		
		return ctDO; 
	}
	
	public int getCtNum() {
		return ctNum;
	}

	public void setCtNum(int ctNum) {
		this.ctNum = ctNum;
	}

	public String getCtName() {
		return ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public String getCtEmail() {
		return ctEmail;
	}

	public void setCtEmail(String ctEmail) {
		this.ctEmail = ctEmail;
	}

	public String getCtMsg() {
		return ctMsg;
	}

	public void setCtMsg(String ctMsg) {
		this.ctMsg = ctMsg;
	}

	public String getCtRgDate() {
		return ctRgDate;
	}

	public void setCtRgDate(String ctRgDate) {
		this.ctRgDate = ctRgDate;
	}
	
	public String getCtReply() {
		return ctReply;
	}

	public void setCtReply(String ctReply) {
		this.ctReply = ctReply;
	}
}
