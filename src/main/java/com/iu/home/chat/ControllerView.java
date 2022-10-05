package com.iu.home.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.member.MemberDTO;

@Controller
@RequestMapping(value="/chat/*")
public class ControllerView {

	// 채팅방 입장
	@GetMapping("chat")
	public ModelAndView chat(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", (MemberDTO)session.getAttribute("member"));
		mv.setViewName("chat/chat");
		return mv;
	}
	
}