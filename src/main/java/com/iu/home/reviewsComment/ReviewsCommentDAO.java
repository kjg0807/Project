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
		System.out.println("list NUM : " + reviewsCommentPager.getReviewNum());
		
		return sqlSession.selectList(NAMESPACE+"getReviewsCommentList", reviewsCommentPager);
	}

	@Override
	public int setReviewsCommentAdd(ReviewsCommentDTO reviewsCommentDTO) throws Exception {
		System.out.println("DAO NUM: " + reviewsCommentDTO.getReviewNum());
		return sqlSession.insert(NAMESPACE+"setReviewsCommentAdd", reviewsCommentDTO);
	}

	@Override
	public Long getReviewsCommentListCount(ReviewsCommentPager reviewsCommentPager) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getReviewsCommentListCount", reviewsCommentPager);
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
