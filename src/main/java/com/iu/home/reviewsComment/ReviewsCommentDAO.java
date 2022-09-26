package com.iu.home.reviewsComment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.util.ReviewsCommentPager;

@Repository
public class ReviewsCommentDAO implements CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	public final String NAMESPACE = "com.iu.home.reviewsComment.ReviewsCommentDAO.";

	@Override
	public List<ReviewsCommentDTO> getReviewsCommentList(ReviewsCommentPager reviewsCommentPager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getReviewsCommentList", reviewsCommentPager);
	}

	@Override
	public int setReviewsCommentAdd(ReviewsCommentDTO reviewsCommentDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setReviewsCommentAdd", reviewsCommentDTO);
	}

	@Override
	public Long getReviewsCommentCount(ReviewsCommentPager reviewsCommentPager) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getReviewsCommentCount", reviewsCommentPager);
	}

	@Override
	public int setReviewsCommentUpdate(ReviewsCommentDTO reviewsCommentDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setReviewsCommentUpdate", reviewsCommentDTO);
	}

	@Override
	public int setReviewsCommentDelete(ReviewsCommentDTO reviewsCommentDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setReviewsCommentDelete",reviewsCommentDTO);
	}
	
	
	

}
