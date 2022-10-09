package com.iu.home.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.util.Pager;
import com.iu.home.util.ReviewsPager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	//Qna List
	@GetMapping(value = "list")
	public ModelAndView getQnaList(ReviewsPager reviewsPager) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Qna List Get 실행");
		List<QnaDTO> ar = qnaService.getQnaList(reviewsPager);
		mv.addObject("reviewsPager", reviewsPager);
		mv.addObject("list", ar);
		mv.setViewName("qna/list");
		
		return mv;
	}
	
	//Qna Detail
	@GetMapping(value = "detail")
	public ModelAndView getQnaDetail(QnaDTO qnaDTO) throws Exception{
		System.out.println("Qna Detail Get 실행");
		
		ModelAndView mv = new ModelAndView();
		qnaDTO = qnaService.getQnaDetail(qnaDTO);
		qnaService.setQnaHitsUpdate(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		mv.setViewName("qna/detail");
		
		return mv;
	}
	
	//Qna Add
	@GetMapping(value = "add")
	public String setQnaAdd() throws Exception{
		System.out.println("Qna Add Get실행");
		return "qna/add";
	}
	
	@PostMapping(value ="add")
	public ModelAndView setQnaAdd(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Qna Add Post 실행");
		
		int result = qnaService.setQnaAdd(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		mv.setViewName("redirect:./list");
		
		if(result==1) {
			System.out.println("Qna 글 추가 성공!!");
		}else {
			System.out.println("Qna 글 추가 실패ㅜㅜ");
		}
		
		return mv;
	}
	
	//Qna Update
	@GetMapping(value = "update")
	public ModelAndView setQnaUpdate(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Qna Update Get 실행");
		
		qnaDTO = qnaService.getQnaDetail(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		mv.setViewName("qna/update");
		
		return mv;
	}
	
	@PostMapping(value = "update")
	public ModelAndView setQnaUpdatePost(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Qna Update Post 실행");
		
		int result = qnaService.setQnaUpdate(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		mv.setViewName("redirect:./list");
		
		if(result==1) {
			System.out.println("수정에 성공하였습니다!!");
		}else {
			System.out.println("수정에 실패하였습니다ㅠㅠ");
		}
		
		return mv;
	}
	
	//Qna Delete
	@GetMapping(value = "delete")
	public ModelAndView setQnaDelete(QnaDTO qnaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Qna Delete 실행");
		
		System.out.println(qnaDTO.getNum());
		System.out.println(qnaDTO.getTitle());
		System.out.println(qnaDTO.getContents());
		int result = qnaService.setQnaDelete(qnaDTO);
		
		mv.addObject("dto", qnaDTO);
		mv.setViewName("redirect:./list");
		
		if(result==1) {
			System.out.println("삭제 성공!!");
		}else {
			System.out.println("삭제 실패 ㅜㅜ");
		}
		
		return mv;
	}
	
	//Qna Reply
	@GetMapping(value = "reply")
	public ModelAndView setReply(ModelAndView mv, QnaDTO qnaDTO)throws Exception{
		mv.addObject("qnaDTO", qnaDTO);
		mv.setViewName("qna/reply");
		
		return mv;
	}
	
	@PostMapping(value = "reply")
	public String setReply(QnaDTO qnaDTO) throws Exception{
		int result = qnaService.setReply(qnaDTO);
		
		return "redirect:./list";
	}
	
	
	
	

}
