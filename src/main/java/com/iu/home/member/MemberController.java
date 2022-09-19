package com.iu.home.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController
{
	@Autowired
	@Qualifier("myservice")
	private MemberService memberService;

	@GetMapping("login")
	public String login()
	{
		System.out.println("Login GET Test");

		return "member/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, HttpServletRequest request, MemberDTO memberDTO, Model model) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("Login POST Test");
		memberDTO = memberService.getLogin(memberDTO);
		session.setAttribute("member", memberDTO);

		String message = "로그인 실패";
		String url = "../member/login.naver";
		if (memberDTO != null)
		{ // login succeed
			message = "로그인 성공";
			url = "../";
		}
		mv.addObject("message", message);
		mv.addObject("url", url);
		mv.setViewName("common/rs");

		return mv;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception
	{
		// 1. session�쓣 �냼硫몄떆�궎湲�
		session.invalidate();

		return "redirect:../";
	}

	@GetMapping
	public String join()
	{
		System.out.println("Join GET Test");

		return "member/join";
	}
}
