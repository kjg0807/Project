package com.iu.home.reviews;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.home.util.FileManger;
import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

@Service
public class ReviewsService {
	
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private FileManger fileManager;
	
	//리뷰 목록
	public List<ReviewsDTO> getReviewsList(ReviewsPager reviewsPager) throws Exception{
		Long totalCount = reviewsDAO.getReviewsCount(reviewsPager);
		reviewsPager.getNum(totalCount);
		reviewsPager.getRowNum();
		
		return reviewsDAO.getReviewsList(reviewsPager);
	}
	
	//리뷰 상세
	public ReviewsDTO getReviewsDetail(ReviewsDTO reviewsDTO) throws Exception{
		
		return reviewsDAO.getReviewsDetail(reviewsDTO);
	}
	
	//리뷰 쓰기
	public int setReviewsAdd(ReviewsDTO reviewsDTO, MultipartFile [] files, ServletContext servletContext) throws Exception{
		int result = reviewsDAO.setReviewsAdd(reviewsDTO);
		String path = "resources/upload/reviews";
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			ReviewsFilesDTO reviewsFilesDTO = new ReviewsFilesDTO();
			reviewsFilesDTO.setFileName(fileName);
			reviewsFilesDTO.setOriName(multipartFile.getOriginalFilename());
			reviewsFilesDTO.setReviewNum(reviewsDTO.getReviewNum());
			reviewsDAO.setReviewsAddFiles(reviewsFilesDTO);
			
		}
		
		
		return result;
	}
	
	//리뷰 수정
	public int setReviewsUpdate(ReviewsDTO reviewsDTO) throws Exception{
		
		return reviewsDAO.setReviewsUpdate(reviewsDTO);
	}
	
	//리뷰 삭제
	public int setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception{
		
		return reviewsDAO.setReviewsDelete(reviewsDTO);
	}
	

	public int setReviewsFilesDelete(ReviewsFilesDTO reviewsFilesDTO, ServletContext servletContext) throws Exception{
		
		reviewsFilesDTO = reviewsDAO.getReviewsFilesDetail(reviewsFilesDTO);
		
		int result = reviewsDAO.setReviewsDelete(reviewsFilesDTO);
		
		String path = "resources/upload/reviews";
		
		if(result > 0) {
			fileManager.deleteReviewsFiles(servletContext, path, reviewsFilesDTO);
		}
		return result;
	}
	
}
