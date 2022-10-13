package com.iu.home.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.home.member.MemberDAO;
import com.iu.home.member.MemberDTO;

public class MemberInterceptor1 extends HandlerInterceptorAdapter{
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	//컨트롤러 들어가기 전 확인하려고 함 
//	ex)로그인한 사람은 통과 로그인 하지 않은 사람은 거절
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//로그인 유무를 판별하기 위해 request를 꺼냄
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		ModelAndView modelAndView = new ModelAndView();
		
		Map<String, Object> map = modelAndView.getModel();
		
		MemberDTO memberDTO = (MemberDTO)map.get("dto");
		
		if(obj != null) {
			System.out.println("로그인");
			return true;
		}else {
			System.out.println("비로그인");
			modelAndView.setViewName("kjk/common/rs");
			modelAndView.addObject("result", 1);
			modelAndView.addObject("message", "로그인을 먼저 하셔야 합니다.");
			response.sendRedirect("../member/login");
			return false;
		}

	}
}
