package com.iu.home.reviews;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.home.reviewsComment.ReviewsCommentDAO;
import com.iu.home.reviewsComment.ReviewsCommentDTO;
import com.iu.home.util.FileManger;
import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsCommentPager;
import com.iu.home.util.ReviewsPager;

@Service
public class ReviewsService {
	
	@Autowired
	private ReviewsDAO reviewsDAO;
	@Autowired
	private FileManger fileManager;
	@Autowired
	private ReviewsCommentDAO reviewsCommentDAO;
	
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
	public int setReviewsUpdate(ReviewsDTO reviewsDTO, MultipartFile [] files, ServletContext servletContext) throws Exception{
		
		String path = "resources/upload/reviews";
		
		int result = reviewsDAO.setReviewsUpdate(reviewsDTO);
		
		if(result < 1) {
			return result;
		}
		
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			ReviewsFilesDTO reviewsFilesDTO = new ReviewsFilesDTO();
			reviewsFilesDTO.setFileName(fileName);
			reviewsFilesDTO.setOriName(multipartFile.getOriginalFilename());
			reviewsFilesDTO.setFilesNum(reviewsDTO.getReviewNum());
			
			System.out.println("Service 리뷰 넘버 : " + reviewsDTO.getReviewNum());
			System.out.println("Service 파일 넘버 : " + reviewsFilesDTO.getFilesNum());
			
			reviewsDAO.setReviewsAddFiles(reviewsFilesDTO);
			
		}
		
		return result;
	}
	
	//리뷰 삭제
	public int setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception{
		
		return reviewsDAO.setReviewsDelete(reviewsDTO);
	}
	

	public int setReviewsFilesDelete(ReviewsFilesDTO reviewsFilesDTO, ServletContext servletContext) throws Exception{
		
		reviewsFilesDTO = reviewsDAO.getReviewsFilesDetail(reviewsFilesDTO);
		
		int result = reviewsDAO.setReviewsFilesDelete(reviewsFilesDTO);
		
		String path = "resources/upload/reviews";
		
		if(result > 0) {
			fileManager.reviewsFilesDelete(servletContext, path, reviewsFilesDTO);
		}
		return result;
	}
	
	
	public List<ReviewsCommentDTO> getReviewsCommentList(ReviewsCommentPager reviewsCommentPager) throws Exception{

		reviewsCommentPager.getRowNum();
		Long totalCount = reviewsCommentDAO.getReviewsCommentListCount(reviewsCommentPager);
		reviewsCommentPager.makePage(totalCount);
		return reviewsCommentDAO.getReviewsCommentList(reviewsCommentPager);
	}
	
	//답글 달기
	public int setReviewsCommentAdd(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		System.out.println("num: " + reviewsCommentDTO.getReviewNum());
		return reviewsCommentDAO.setReviewsCommentAdd(reviewsCommentDTO);
	}
	
	public int setReviewsCommentUpdate(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		return reviewsCommentDAO.setReviewsCommentUpdate(reviewsCommentDTO);	
	}
	
	public int setReviewsCommentDelete(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		return reviewsCommentDAO.setReviewsCommentDelete(reviewsCommentDTO);
	}
	
}
