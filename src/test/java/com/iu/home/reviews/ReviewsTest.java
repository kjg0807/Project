package com.iu.home.reviews;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iu.home.MyAbstractTest;

public class ReviewsTest extends MyAbstractTest{

	@Autowired
	private ReviewsDAO reviewsDAO;
	
	
	@Test
	public void setReviewsTest() throws Exception{
		
		for(int i=0; i<100; i++) {
			ReviewsDTO reviewsDTO = new ReviewsDTO();
			
			reviewsDTO.setUserId("id1");
			reviewsDTO.setTitle("제목" + i);
			reviewsDTO.setContents("내용" + i);
		
			int result = reviewsDAO.setReviewsAdd(reviewsDTO);
		}
	}

}
