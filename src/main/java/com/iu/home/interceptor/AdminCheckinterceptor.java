package com.iu.home.interceptor;

import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.home.member.ClassDTO;
import com.iu.home.member.MemberDTO;

public class AdminCheckinterceptor extends HandlerInterceptorAdapter{
	//원하는 시점을 오버라이팅
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		
		boolean check = false;
		
		for(ClassDTO classDTO:memberDTO.getClassDTOs()) {
			if(classDTO.getClassName().equals("admin")) {
				check = true;
				break;
			}
		}
		if(!check) {
			request.setAttribute("message", "권한이 없습니다.");
			request.setAttribute("url", "../../../../../../../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/kjk/common/rs.jsp");
			view.forward(request, response);
		}
	return check;
	}
	

}
