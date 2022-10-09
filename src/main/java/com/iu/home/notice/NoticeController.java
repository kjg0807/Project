package com.iu.home.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;



@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	//공지사항 list
	@GetMapping(value = "list")
	public ModelAndView getNoticeList(ReviewsPager reviewsPager) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("공지사항 List Get 실행");
		List<NoticeDTO> ar = noticeService.getNoticeList(reviewsPager);
		mv.addObject("reviewsPager", reviewsPager);
		mv.addObject("list", ar);
		mv.setViewName("notice/list");
		
		return mv;
		
	}
	
	
	//공지사항 detail
	@GetMapping(value = "detail")
	public ModelAndView getNoticeDetail(NoticeDTO noticeDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("공지사항 Detail Get 실행");
		noticeDTO = noticeService.getNoticeDetail(noticeDTO);
		noticeService.setNoticeHitsUpdate(noticeDTO);
		
		mv.addObject("dto", noticeDTO);
		mv.setViewName("notice/detail");
		
		return mv;
	}
	
	//공지사항 add Get
	@GetMapping(value = "add")
	public String setNoticeAdd() throws Exception{
		System.out.println("공지사항 Add Get 실행");
		
		return "notice/add";
	}
	
	//공지사항 add Post
	@PostMapping(value = "add")
	public ModelAndView setNoticeAdd(NoticeDTO noticeDTO) throws Exception{
		System.out.println("공지사항 Add Post 실행");
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("dto", noticeDTO);
		mv.setViewName("redirect:./list");
		
		int result = noticeService.setNoticeAdd(noticeDTO);
		
		
		if(result == 1) {
			System.out.println("글쓰기 추가가 성공하였습니다!!");
		}else {
			System.out.println("글쓰기 추가가 실패하였습니다 ㅠㅠ");
		}
		
		return mv;
	}
	
	//공지사항 Update Get
	@GetMapping(value = "update")
	public ModelAndView setNoticeUpdateGet(NoticeDTO noticeDTO) throws Exception{
		System.out.println("공지사항 수정하기 GET실행");
		
		ModelAndView mv = new ModelAndView();
		
		noticeDTO = noticeService.getNoticeDetail(noticeDTO);
		mv.setViewName("notice/update");
		mv.addObject("dto", noticeDTO);

		
		
		return mv;
	}
	
	//공지사항 Update Post
	@PostMapping(value = "update")
	public ModelAndView setNoticeUpdate(NoticeDTO noticeDTO) throws Exception{
		System.out.println("공지사항 수정하기 POST 실행");
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", noticeDTO);
		mv.setViewName("redirect:./list");
		
		int result = noticeService.setNoticeUpdate(noticeDTO);
		
		if (result == 1) {
			System.out.println("수정에 성공하였습니다!!");
		} else {
			System.out.println("수정에 실패하였습니다ㅠㅠ");
		}
		
		return mv;
	}
	
	//공지사항 Delete 
	@GetMapping(value = "delete")
	public ModelAndView setNoticeDelete(NoticeDTO noticeDTO) throws Exception{
		System.out.println("공지사항 삭제하기 실행");
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("dto", noticeDTO);
		mv.setViewName("redirect:./list");
		
		int result = noticeService.setNoticeDelete(noticeDTO);
		
		
		if(result == 1) {
			System.out.println("공지사항 삭제하기 성공!!");
		}else {
			System.out.println("공지사항 삭제하기 실패ㅜㅜ");
		}
		
		return mv;
	}
	
	

}
