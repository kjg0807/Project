package com.iu.home.member;

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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/kjk/member/*")
public class MemberController
{
	@Autowired
	@Qualifier("myservice")
	private MemberService memberService;

	@GetMapping(value = "login")
	public String login()
	{
		System.out.println("Login GET Test");

		return "kjk/member/login";
	}

	@PostMapping(value = "login")
	public ModelAndView login1(HttpSession session, HttpServletRequest request, MemberDTO memberDTO, Model model) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("Login POST Test");
		// System.out.println(memberDTO.getUserid());
		// System.out.println(memberDTO.getPwd());
		memberDTO = memberService.getLogin(memberDTO);
		session.setAttribute("member", memberDTO);

		memberDTO = (MemberDTO) session.getAttribute("member");

		// System.out.println(memberDTO);

		String message = "로그인 실패";
		String url = "../member/login";
		if (memberDTO != null)
		{ // login succeed
			message = "로그인 성공";
			url = "../../";
		}
		mv.addObject("dto", memberDTO);
		mv.addObject("message", message);
		mv.addObject("url", url);
		mv.setViewName("kjk/common/rs");

		return mv;
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) throws Exception
	{
		// 1. session�쓣 �냼硫몄떆�궎湲�
		session.invalidate();

		return "redirect:../../";
	}

	@GetMapping(value = "join")
	public String join()
	{
		System.out.println("Join GET Test");

		return "kjk/member/join";
	}

	@PostMapping(value = "join")
	public ModelAndView join(MemberDTO memberDTO) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("Join POST Test");
		// System.out.println(memberDTO);
		// System.out.println(memberDTO.getUserid());
		// System.out.println(memberDTO.getUsername());
		// System.out.println(memberDTO.getGender());

		int rs = memberService.setJoin(memberDTO);
		// System.out.println(rs == 1);

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

		mv.setViewName("kjk/member/mypage");

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
			// System.out.println(memberDTO2.getPwd());
			// System.out.println(memberDTO2.getEmail());
			// System.out.println(memberDTO2.getPhone());
		}
		mv.addObject("dto", ar);
		mv.setViewName("kjk/member/adpage");

		return mv;
	}

	@GetMapping(value = "update")
	public void update(HttpSession session, Model model) throws Exception
	{
		System.out.println("Update GET Page");

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO = memberService.getMyPage(memberDTO);

		System.out.println(memberDTO.getUserID());
		System.out.println(memberDTO.getPwd());
		System.out.println(memberDTO.getGender());

		model.addAttribute("dto", memberDTO);
	}

	@PostMapping(value = "update")
	public String setUpdate(MemberDTO memberDTO) throws Exception
	{
		System.out.println("update POST");
		int rs = memberService.setUpdate(memberDTO);
		System.out.println(rs == 1);

		return "redirect:./mypage?userID=" + memberDTO.getUserID();
	}

	@GetMapping(value = "delete")
	public void setDelete(HttpSession session, Model model) throws Exception
	{
		System.out.println("Delete GET Page");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO = memberService.getMyPage(memberDTO);

		model.addAttribute("dto", memberDTO);
	}

	@PostMapping(value = "delete")
	public String setDelete(MemberDTO memberDTO, HttpSession session) throws Exception
	{
		System.out.println("Delete POST Page");
		int rs = memberService.setDelete(memberDTO);
		session.invalidate();

		return "redirect:../../";
	}

	@GetMapping(value = "idCheck")
	public void idCheck() throws Exception
	{
		System.out.println("GET idCheck");
	}
}
