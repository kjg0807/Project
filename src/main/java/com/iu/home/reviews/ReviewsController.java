package com.iu.home.reviews;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.member.MemberDTO;
import com.iu.home.reviewsComment.ReviewsCommentDTO;
import com.iu.home.shop.ShopDTO;
import com.iu.home.util.ReviewsCommentPager;
import com.iu.home.util.ReviewsDetailPager;
import com.iu.home.util.ReviewsPager;

@Controller
@RequestMapping(value = "/reviews/*")
public class ReviewsController {
	
	@Autowired
	private ReviewsService reviewsService;
	
	//리뷰 리스트
	@GetMapping(value = "list")
	public ModelAndView getReviewsList(ReviewsPager reviewsPager, HttpSession session, ReviewsDTO reviewsDTO) throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		reviewsDTO.setUserID(memberDTO.getUserID());
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("리뷰 List 실행");
		
		List<ReviewsDTO> ar = reviewsService.getReviewsList(reviewsPager);
		
		mv.addObject("reviewsPager", reviewsPager);
		mv.addObject("list", ar);
		mv.setViewName("reviews/list");
		
		return mv;
	}
	
	//shop 디테일 리뷰리스트
//	@GetMapping(value = "list2")
//	public ModelAndView getReviewsShopDetailList(ReviewsDetailPager reviewsDetailPager, HttpSession session, ReviewsDTO reviewsDTO) throws Exception{
//		
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		
//		reviewsDTO.setUserID(memberDTO.getUserID());
//		
//		ModelAndView mv = new ModelAndView();
//		
//		System.out.println("리뷰 List 실행");
//		
//		List<ReviewsDTO> ar = reviewsService.getReviewsShopDetailList(reviewsDetailPager);
//		
//		mv.addObject("reviewsDetailPager", reviewsDetailPager);
//		mv.addObject("detailList", ar);
//		mv.setViewName("reviews/list2");
//		
//		return mv;
//	}
	
	
	//리뷰리스트 (Model)
//	public String getReviewsList(ReviewsPager reviewsPager, HttpSession session, ReviewsDTO reviewsDTO, Model model) throws Exception{
//		
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		
//		reviewsDTO.setUserID(memberDTO.getUserID());
//		
//		
//		
//		System.out.println("리뷰 List 실행");
//		
//		List<ReviewsDTO> ar = reviewsService.getReviewsList(reviewsPager);
//		
//		
//		model.addAttribute("reviewsPager", reviewsPager);
//		model.addAttribute("list", ar);
//		
//		return "reviews/list";
//	}
	
	//리뷰 디테일
	@GetMapping(value = "detail")
	public ModelAndView getReviewsDetail(ReviewsDTO reviewsDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println("리뷰 Detail 실행");
		
		reviewsDTO = reviewsService.getReviewsDetail(reviewsDTO);
		reviewsService.setReviewsHitsUpdate(reviewsDTO);
		
		
		mv.addObject("dto", reviewsDTO);
		mv.setViewName("reviews/detail");
		
		return mv;
	}
	
	//리뷰 Add
	@GetMapping(value = "add")
	public String setReviewsAdd(ReviewsDTO reviewsDTO, Long shopNum, HttpSession session) throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		System.out.println("리뷰 Add Get 실행");
		System.out.println("SHOPNUM GET : " + reviewsDTO.getShopNum());
		
		if(memberDTO != null) {
			return "reviews/add";
		}else {
			return "redirect:../kjk/member/login";
		}
		
	}
	
	@PostMapping(value = "add")
	public ModelAndView setReviewsAdd(ReviewsDTO reviewsDTO, Long shopNum, MultipartFile [] files, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		reviewsDTO.setUserID(memberDTO.getUserID());
		
		System.out.println("SHOPNUM : " + reviewsDTO.getShopNum());
		System.out.println("userID : " + reviewsDTO.getUserID());
		System.out.println("TITLE : " + reviewsDTO.getTitle());
		System.out.println("CONTENTS : " + reviewsDTO.getContents());
		int result = reviewsService.setReviewsAdd(reviewsDTO, files, session.getServletContext());
		
		System.out.println("리뷰 Add Post 실행");
		mv.addObject("result", result);
		mv.addObject("dto", reviewsDTO);
		mv.addObject("detail", reviewsDTO);
//		mv.setViewName("redirect:../kdy/shop/detailHTML?shopNum="+reviewsDTO.getShopNum());
//		mv.setViewName("redirect:./list");
		mv.setViewName("redirect:../shop/detailHTML?shopNum="+reviewsDTO.getShopNum());
		
		if(result == 1) {
			System.out.println("리뷰 글이 작성되었습니다!!");
		}else {
			System.out.println("리뷰 글 작성이 실패하였습니다 ㅜㅜ");
		}
		
		return mv;
	}
	
	//리뷰 수정
	@GetMapping(value = "update")
	public String setReviewsUpdate(ReviewsDTO reviewsDTO, Model model) throws Exception{
		
		
		System.out.println("리뷰글 수정하기 GET 실행");
	
		reviewsDTO = reviewsService.getReviewsDetail(reviewsDTO);
		
		model.addAttribute("dto", reviewsDTO);
	
	
		
		return "reviews/update";
		
	}
	
	
	@PostMapping(value = "update")
	public ModelAndView setReviewsUpdate(ReviewsDTO reviewsDTO, MultipartFile [] files, HttpSession session) throws Exception{
		
		System.out.println("리뷰 글 수정하기 POST 실행");
		ReviewsFilesDTO reviewsFilesDTO = new ReviewsFilesDTO();
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Controller 리뷰 넘버 : " + reviewsDTO.getReviewNum());
		System.out.println("Controller 파일 넘버 : " + reviewsFilesDTO.getFilesNum());
		
		int result = reviewsService.setReviewsUpdate(reviewsDTO, files, session.getServletContext());
		
		
		mv.addObject("dto", reviewsDTO);
//		mv.setViewName("redirect:./detail?reviewNum="+reviewsDTO.getReviewNum());
		mv.setViewName("redirect:./list");
		
		if(result == 1) {
			System.out.println("리뷰 글 수정하기가 성공하였습니다!!");
		}else {
			System.out.println("리뷰 글 수정하기가 실패하였습니다 ㅜㅜ");
		}
		
		return mv;
	}
	
	//리뷰 삭제 
	@GetMapping(value = "delete")
	public ModelAndView setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("리뷰 글 삭제 실행");
		
		
		System.out.println(reviewsDTO.getReviewNum());
		System.out.println(reviewsDTO.getTitle());
		System.out.println(reviewsDTO.getContents());
		
		int result = reviewsService.setReviewsDelete(reviewsDTO);
		
		mv.addObject("dto", reviewsDTO);
		mv.setViewName("redirect:./list");
		
		if(result == 1) {
			System.out.println("글 삭제가 성공하였씁니다!!");
		}else {
			System.out.println("글 삭제가 실패하였습니다 ㅜㅜ");
		}
		
		return mv;
	}
	
//	@GetMapping(value = "delete")
//	public String setReviewsDelete(ReviewsDTO reviewsDTO) throws Exception{
//		System.out.println("리뷰 글 삭제 실행");
//		
//		int result = reviewsService.setReviewsDelete(reviewsDTO);
//		
//		if(result == 1) {
//			System.out.println("삭제 성공");
//		}else {
//			System.out.println("삭제 실패");
//		}
//		
//		return "redirect:./list";
//	}
	

	
	@PostMapping(value = "reviewsFilesDelete")
	@ResponseBody
	public int setReviewsFilesDelete(ReviewsFilesDTO reviewsFilesDTO, HttpSession session) throws Exception{
		int result = reviewsService.setReviewsFilesDelete(reviewsFilesDTO, session.getServletContext());
		
		return result;
	}
	
	
	
	// jsp에 출력하고 결과물을 응답으로 전송
	@GetMapping(value = "reviewsCommentList")
	@ResponseBody
	public Map<String, Object> reviewsCommentList(ReviewsCommentPager reviewsCommentPager, HttpSession session) throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ReviewsDTO reviewsDTO = new ReviewsDTO();
		ReviewsCommentDTO reviewsCommentDTO = new ReviewsCommentDTO();
		
		reviewsCommentDTO.setUserID(memberDTO.getUserID());
		
		List<ReviewsCommentDTO> ar = reviewsService.getReviewsCommentList(reviewsCommentPager);
		
		System.out.println("답글 목록");
		System.out.println("ar.size : " + ar.size());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", ar);
		map.put("reviewsCommentPager", reviewsCommentPager);
		
		return map;
	}
	
	
	
//	@GetMapping(value = "reviewsCommentAdd")
//	public void reviewsCommentAdd () throws Exception{
//		
//		System.out.println("답글달기 GET 실행");
//	}
//	
	
	
	@PostMapping(value = "reviewsCommentAdd")
	@ResponseBody
	public int reviewsCommentAdd(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("답글달기 POST 실행");
		
		int result = reviewsService.setReviewsCommentAdd(reviewsCommentDTO);
		
		mv.addObject("result", result);
		
		if(result == 1) {
			System.out.println("답글이 성공적으로 달렸습니다!!");
		}else {
			System.out.println("답글이 달리지 못했씁니다ㅜㅜ");
		}
		
		return result;
	}
	
	
	
	@PostMapping(value = "reviewsCommentUpdate")
	@ResponseBody
	
	//jsp를 안거치고 body에 바로 담아 응답으로 내보냄
	public int reviewsCommentUpdate(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		
		System.out.println("답글 수정하기 POST실행");
		
		int result = reviewsService.setReviewsCommentUpdate(reviewsCommentDTO);
		
		if(result == 1) {
			System.out.println("답글 수정 완료!!");
		}else {
			System.out.println("답글 수정 실패 ㅜㅜ");
		}
		
		return result;
	}
	
	
	@PostMapping(value = "reviewsCommentDelete")
	@ResponseBody
	//jsp를 안거치고 body에 바로 담아 응답으로 내보냄
	public int setReviewsCommentDelete(ReviewsCommentDTO reviewsCommentDTO) throws Exception{
		
		System.out.println("답글 삭제 POST 실행");
		
		int result = reviewsService.setReviewsCommentDelete(reviewsCommentDTO);
		
		return result;
	}
	
	
	
	

}
