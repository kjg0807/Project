package com.iu.home.reviewsComment;

import java.util.List;

import com.iu.home.util.ReviewsCommentPager;

public interface CommentDAO {
	
	public List<ReviewsCommentDTO> getReviewsCommentList(ReviewsCommentPager reviewsCommentPager) throws Exception;
	
	public int setReviewsCommentAdd(ReviewsCommentDTO reviewsCommentDTO) throws Exception;
	
	public Long getReviewsCommentListCount(ReviewsCommentPager reviewsCommentPager) throws Exception;
	
	public int setReviewsCommentUpdate(ReviewsCommentDTO reviewsCommentDTO) throws Exception;
	
	public int setReviewsCommentDelete(ReviewsCommentDTO reviewsCommentDTO) throws Exception;
	
	
}
