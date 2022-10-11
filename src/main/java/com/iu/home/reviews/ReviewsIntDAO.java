package com.iu.home.reviews;

import java.util.List;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsDetailPager;
import com.iu.home.util.ReviewsPager;

public interface ReviewsIntDAO {
	
	public List<ReviewsDTO> getReviewsList(ReviewsPager reviewsPager) throws Exception;
	
	//SHOP 디테일에 뿌리는 리뷰리스트 5페이지씩 출력
//	public List<ReviewsDTO> getReviewsShopDetailList(ReviewsDetailPager reviewsDetailPager) throws Exception;
	
	public ReviewsDTO getReviewsDetail(ReviewsDTO reviewsDTO) throws Exception;
	
	public int setReviewsAdd(ReviewsDTO reviewsDTO) throws Exception;
	
	public int setReviewsUpdate(ReviewsDTO reviewsDTO) throws Exception;
	
	public int setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception;
	
	public Long getReviewsCount(ReviewsPager reviewsPager) throws Exception;
	
	//SHOP 디테일에 뿌리는 리뷰리스트 5페이지 출력 카운트 메서드
//	public Long getReviewsShopDetailCount(ReviewsDetailPager reviewsDetailPager) throws Exception;
	
	public int setReviewsAddFiles(ReviewsFilesDTO reviewsFilesDTO) throws Exception;
	
	public ReviewsFilesDTO getReviewsFilesDetail(ReviewsFilesDTO reviewsFilesDTO) throws Exception;
	
	public int setReviewsFilesDelete(ReviewsFilesDTO reviewsFilesDTO) throws Exception;
	
	public int setReviewsHitsUpdate(ReviewsDTO reviewsDTO) throws Exception;

}
