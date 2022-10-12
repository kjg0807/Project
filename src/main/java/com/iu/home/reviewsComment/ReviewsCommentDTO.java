package com.iu.home.reviewsComment;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.iu.home.member.MemberDTO;
import com.iu.home.reviews.ReviewsDTO;

public class ReviewsCommentDTO {
	
	private Long num;
	private Long reviewNum;
	private String userID;
	private String contents;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regDate;
	private List<MemberDTO> memberDTOs;
	private List<ReviewsDTO> reviewsDTOs;
	
	
	
	
	public List<MemberDTO> getMemberDTOs() {
		return memberDTOs;
	}
	public void setMemberDTOs(List<MemberDTO> memberDTOs) {
		this.memberDTOs = memberDTOs;
	}
	public List<ReviewsDTO> getReviewsDTOs() {
		return reviewsDTOs;
	}
	public void setReviewsDTOs(List<ReviewsDTO> reviewsDTOs) {
		this.reviewsDTOs = reviewsDTOs;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	

}
