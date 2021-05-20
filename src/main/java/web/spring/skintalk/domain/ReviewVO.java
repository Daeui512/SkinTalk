package web.spring.skintalk.domain;

import java.util.Date;

public class ReviewVO {
	private int reviewNo;
	private int reviewPno;
	private String reviewContent;
	private String reviewNickName;
	private int reviewGrade;
	private int reviewAge;
	private String reviewGender;
	private String reviewSkinType;
	private Date reviewCdate;
	
	public ReviewVO() {}

	public ReviewVO(int reviewNo, int reviewPno, String reviewContent, String reviewNickName, int reviewGrade,
			int reviewAge, String reviewGender, String reviewSkinType, Date reviewCdate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewPno = reviewPno;
		this.reviewContent = reviewContent;
		this.reviewNickName = reviewNickName;
		this.reviewGrade = reviewGrade;
		this.reviewAge = reviewAge;
		this.reviewGender = reviewGender;
		this.reviewSkinType = reviewSkinType;
		this.reviewCdate = reviewCdate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewPno() {
		return reviewPno;
	}

	public void setReviewPno(int reviewPno) {
		this.reviewPno = reviewPno;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewNickName() {
		return reviewNickName;
	}

	public void setReviewNickName(String reviewNickName) {
		this.reviewNickName = reviewNickName;
	}

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public int getReviewAge() {
		return reviewAge;
	}

	public void setReviewAge(int reviewAge) {
		this.reviewAge = reviewAge;
	}

	public String getReviewGender() {
		return reviewGender;
	}

	public void setReviewGender(String reviewGender) {
		this.reviewGender = reviewGender;
	}

	public String getReviewSkinType() {
		return reviewSkinType;
	}

	public void setReviewSkinType(String reviewSkinType) {
		this.reviewSkinType = reviewSkinType;
	}

	public Date getReviewCdate() {
		return reviewCdate;
	}

	public void setReviewCdate(Date reviewCdate) {
		this.reviewCdate = reviewCdate;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewPno=" + reviewPno + ", reviewContent=" + reviewContent
				+ ", reviewNickName=" + reviewNickName + ", reviewGrade=" + reviewGrade + ", reviewAge=" + reviewAge
				+ ", reviewGender=" + reviewGender + ", reviewSkinType=" + reviewSkinType + ", reviewCdate="
				+ reviewCdate + "]";
	}

} // end of class
