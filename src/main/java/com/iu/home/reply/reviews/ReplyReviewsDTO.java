package com.iu.home.reply.reviews;

import java.sql.Clob;
import java.sql.Date;

public class ReplyReviewsDTO {
	
	private Long replyNum;
	private String userId;
	private Long reviewNum;
	private Long num;
	private Clob replyContents;
	private Date regDate;
	
	
	public Long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Clob getReplyContents() {
		return replyContents;
	}
	public void setReplyContents(Clob replyContents) {
		this.replyContents = replyContents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	

}
