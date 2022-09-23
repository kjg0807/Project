package com.iu.home.reviews;

import java.sql.Date;
import java.util.List;

public class ReviewsDTO{
	
	private Long reviewNum;
	private Long shopNum;
	private String userId;
	private Long categoryNum;
	private String title;
	private String writer;
	private String contents;
	private Date reviewDate;
	private Long hits;
	private List<ReviewsFilesDTO> reviewsFilesDTOs;
	
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
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
