package web.spring.skintalk.domain;

import java.util.Date;

public class BoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String userId;
	private Date boardCdate;
	private int replyCount;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int boardNo, String boardTitle, String boardContent, String userId, Date boardCdate,
			int replyCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userId = userId;
		this.boardCdate = boardCdate;
		this.replyCount = replyCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getBoardCdate() {
		return boardCdate;
	}

	public void setBoardCdate(Date boardCdate) {
		this.boardCdate = boardCdate;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", userId=" + userId + ", boardCdate=" + boardCdate + ", replyCount=" + replyCount + "]";
	}
	
}
