package com.iu.home.reviews;

import java.sql.Date;
import java.util.List;

import com.iu.home.member.ClassDTO;
import com.iu.home.member.MemberDTO;
import com.iu.home.member.UserClassDTO;

public class ReviewsDTO{
	
	private Long reviewNum;
	private Long shopNum;
	private String userID;
	private String title;
	private String writer;
	private String contents;
	private Date reviewDate;
	private Long hits;
	private List<ReviewsFilesDTO> reviewsFilesDTOs;
	private List<MemberDTO> memberDTOs;
	private List<UserClassDTO> userClassDTOs;
	private List<ClassDTO> classDTOs;
	
	
	
	
	
	
	public List<UserClassDTO> getUserClassDTOs() {
		return userClassDTOs;
	}
	public void setUserClassDTOs(List<UserClassDTO> userClassDTOs) {
		this.userClassDTOs = userClassDTOs;
	}
	public List<ClassDTO> getClassDTOs() {
		return classDTOs;
	}
	public void setClassDTOs(List<ClassDTO> classDTOs) {
		this.classDTOs = classDTOs;
	}
	public List<MemberDTO> getMemberDTOs() {
		return memberDTOs;
	}
	public void setMemberDTOs(List<MemberDTO> memberDTOs) {
		this.memberDTOs = memberDTOs;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public Long getShopNum() {
		return shopNum;
	}
	public void setShopNum(Long shopNum) {
		this.shopNum = shopNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public Long getHits() {
		return hits;
	}
	public void setHits(Long hits) {
		this.hits = hits;
	}
	public List<ReviewsFilesDTO> getReviewsFilesDTOs() {
		return reviewsFilesDTOs;
	}
	public void setReviewsFilesDTOs(List<ReviewsFilesDTO> reviewsFilesDTOs) {
		this.reviewsFilesDTOs = reviewsFilesDTOs;
	}
	
	
	
	
	
	

}
