package com.iu.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.home.member.MemberDAO;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	
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
		
		
		if(obj != null) {
			System.out.println("로그인");
			return true;
		}else {
			System.out.println("비로그인");
			response.sendRedirect("../kjk/member/login");
			return false;
		}
		
		
	}

}
