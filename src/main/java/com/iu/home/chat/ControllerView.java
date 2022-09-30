package com.iu.home.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/chat/*")
public class ControllerView {

	// 채팅방 입장
	@GetMapping("chat")
	public ModelAndView chat() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chat");
		return mv;
	}
	
	@GetMapping("join")
	public String joinChat()throws Exception{
		System.out.println("진입");
		
		return "chat/join";
	}
	
	@PostMapping("join")
	public String joinChat(ChatDTO chatDTO)throws Exception{
		System.out.println("챗 진입실행");
		
		return "chat/chat";
	}
}