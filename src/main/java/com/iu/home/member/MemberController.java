package com.iu.home.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println(memberDTO.getUserid());
		System.out.println(memberDTO.getPwd());
		memberDTO = memberService.getLogin(memberDTO);
		session.setAttribute("member", memberDTO);

		memberDTO = (MemberDTO) session.getAttribute("member");

		System.out.println(memberDTO);

		String message = "로그인 실패";
		String url = "../member/login";
		if (memberDTO != null)
		{ // login succeed
			message = "로그인 성공";
			url = "../";
		}
		mv.addObject("dto", memberDTO);
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

	@GetMapping(value = "join")
	public String join()
	{
		System.out.println("Join GET Test");

		return "member/join";
	}

	@PostMapping(value = "join")
	public ModelAndView join(MemberDTO memberDTO) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("Join POST Test");
		// System.out.println(memberDTO);
		// System.out.println(memberDTO.getUserid());
		System.out.println(memberDTO.getUsername());
		// System.out.println(memberDTO.getGender());

		int rs = memberService.setJoin(memberDTO);
		System.out.println(rs == 1);

		mv.addObject("join", memberDTO);
		mv.setViewName("redirect:./login");

		// return "redirect:./login";
		return mv;
	}

	@GetMapping(value = "mypage")
	public ModelAndView mypage(HttpSession session) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("mypage Get Test");

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO = memberService.getMyPage(memberDTO);
		mv.addObject("dto", memberDTO);

		mv.setViewName("member/mypage");

		return mv;
	}

	@GetMapping(value = "adpage")
	public ModelAndView adMypage(MemberDTO memberDTO, HttpSession session) throws Exception
	{
		System.out.println("Adpage GEt");
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> ar = memberService.adMyPage(memberDTO);
		for (MemberDTO memberDTO2 : ar)
		{
			System.out.println(memberDTO2.getPwd());
			System.out.println(memberDTO2.getEmail());
			System.out.println(memberDTO2.getPhone());
		}
		mv.addObject("dto", ar);
		mv.setViewName("member/adpage");

		return mv;
	}
}
