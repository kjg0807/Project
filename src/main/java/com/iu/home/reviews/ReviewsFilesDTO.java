package com.iu.home.reviews;

import java.util.List;

public class ReviewsFilesDTO extends ReviewsDTO{
	
	private Long filesNum;
	private String fileName;
	private String oriName;
	private List<ReviewsDTO> reviewsDTOs;
	
	
	
	public Long getFilesNum() {
		return filesNum;
	}
	public void setFilesNum(Long filesNum) {
		this.filesNum = filesNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String filesName) {
		this.fileName = filesName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public List<ReviewsDTO> getReviewsDTOs() {
		return reviewsDTOs;
	}
	public void setReviewsDTOs(List<ReviewsDTO> reviewsDTOs) {
		this.reviewsDTOs = reviewsDTOs;
	}

	

	
	
}
