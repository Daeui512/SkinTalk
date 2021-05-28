package web.spring.skintalk.domain;

import java.util.Date;

public class RreviewVO {
	private int rReviewNo;
	private int rReviewRno;
	private String rReviewContent;
	private Date rReviewCdate;
	
	public RreviewVO() {
		// TODO Auto-generated constructor stub
	}

	public RreviewVO(int rReviewNo, int rReviewRno, String rReviewContent, Date rReviewCdate) {
		super();
		this.rReviewNo = rReviewNo;
		this.rReviewRno = rReviewRno;
		this.rReviewContent = rReviewContent;
		this.rReviewCdate = rReviewCdate;
	}

	public int getrReviewNo() {
		return rReviewNo;
	}

	public void setrReviewNo(int rReviewNo) {
		this.rReviewNo = rReviewNo;
	}

	public int getrReviewRno() {
		return rReviewRno;
	}

	public void setrReviewRno(int rReviewRno) {
		this.rReviewRno = rReviewRno;
	}

	public String getrReviewContent() {
		return rReviewContent;
	}

	public void setrReviewContent(String rReviewContent) {
		this.rReviewContent = rReviewContent;
	}

	public Date getrReviewCdate() {
		return rReviewCdate;
	}

	public void setrReviewCdate(Date rReviewCdate) {
		this.rReviewCdate = rReviewCdate;
	}

	@Override
	public String toString() {
		return "RreviewVO [rReviewNo=" + rReviewNo + ", rReviewRno=" + rReviewRno + ", rReviewContent=" + rReviewContent
				+ ", rReviewCdate=" + rReviewCdate + "]";
	}

}
