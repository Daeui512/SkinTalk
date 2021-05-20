package web.spring.skintalk.domain;

import java.util.Date;

public class ReplyVO {
   private int replyNo;
   private int replyBno;
   private String replyContent;
   private String replyAdminId;
   private Date replyCdate;
   
   public ReplyVO() {}

   public ReplyVO(int replyNo, int replyBno, String replyContent, String replyAdminId, Date replyCdate) {
      super();
      this.replyNo = replyNo;
      this.replyBno = replyBno;
      this.replyContent = replyContent;
      this.replyAdminId = replyAdminId;
      this.replyCdate = replyCdate;
   }

   public int getReplyNo() {
      return replyNo;
   }

   public void setReplyNo(int replyNo) {
      this.replyNo = replyNo;
   }

   public int getReplyBno() {
      return replyBno;
   }

   public void setReplyBno(int replyBno) {
      this.replyBno = replyBno;
   }

   public String getReplyContent() {
      return replyContent;
   }

   public void setReplyContent(String replyContent) {
      this.replyContent = replyContent;
   }

   public String getReplyAdminId() {
      return replyAdminId;
   }

   public void setReplyAdminId(String replyAdminId) {
      this.replyAdminId = replyAdminId;
   }

   public Date getReplyCdate() {
      return replyCdate;
   }

   public void setReplyCdate(Date replyCdate) {
      this.replyCdate = replyCdate;
   }

   @Override
   public String toString() {
      return "ReplyVO [replyNo=" + replyNo + ", replyBno=" + replyBno + ", replyContent=" + replyContent
            + ", replyAdminId=" + replyAdminId + ", replyCdate=" + replyCdate + "]";
   }
   
   
   
   }