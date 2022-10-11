package com.iu.home.reviews;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsDetailPager;
import com.iu.home.util.ReviewsPager;

@Repository
public class ReviewsDAO implements ReviewsIntDAO{

	@Autowired
	private SqlSession sqlSession;
	public final String NAMESPACE = "com.iu.home.reviews.ReviewsDAO.";
	
	
	@Override
	public List<ReviewsDTO> getReviewsList(ReviewsPager reviewsPager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getReviewsList", reviewsPager);
	}


	@Override
	public ReviewsDTO getReviewsDetail(ReviewsDTO reviewsDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getReviewsDetail", reviewsDTO);
	}


	@Override
	public int setReviewsAdd(ReviewsDTO reviewsDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setReviewsAdd", reviewsDTO);
	}


	@Override
	public int setReviewsUpdate(ReviewsDTO reviewsDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"setReviewsUpdate", reviewsDTO);
	}


	@Override
	public int setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception {

		return sqlSession.delete(NAMESPACE+"setReviewsDelete", reviewsDTO);
	}


	@Override
	public Long getReviewsCount(ReviewsPager reviewsPager) throws Exception {
	
		return sqlSession.selectOne(NAMESPACE+"getReviewsCount", reviewsPager);
	}


	@Override
	public int setReviewsAddFiles(ReviewsFilesDTO reviewsFilesDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setReviewsAddFiles", reviewsFilesDTO);
	}


	@Override
	public ReviewsFilesDTO getReviewsFilesDetail(ReviewsFilesDTO reviewsFilesDTO) throws Exception {
	
		return sqlSession.selectOne(NAMESPACE+"getReviewsFilesDetail", reviewsFilesDTO);
	}


	@Override
	public int setReviewsFilesDelete(ReviewsFilesDTO reviewsFilesDTO) throws Exception {
	
		return sqlSession.delete(NAMESPACE+"setReviewsFilesDelete", reviewsFilesDTO);
	}


	@Override
	public int setReviewsHitsUpdate(ReviewsDTO reviewsDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setReviewsHitsUpdate", reviewsDTO);
	}


	
	//SHOP 디테일페이지에 뿌리는 리뷰리스트 페이징처리
//	@Override
//	public List<ReviewsDTO> getReviewsShopDetailList(ReviewsDetailPager reviewsDetailPager) throws Exception {
//		
//		return sqlSession.selectList(NAMESPACE+"getReviewsShopDetailList", reviewsDetailPager);
//	}
//
//
//	@Override
//	public Long getReviewsShopDetailCount(ReviewsDetailPager reviewsDetailPager) throws Exception {
//		
//		return sqlSession.selectOne(NAMESPACE+"getReviewsShopDetailCount", reviewsDetailPager);
//	}

	
	

}
