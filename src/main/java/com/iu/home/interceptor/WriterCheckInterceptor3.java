package com.iu.home.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.iu.home.member.MemberDTO;
import com.iu.home.party.PartyDTO;
import com.iu.home.qna.QnaDTO;

public class WriterCheckInterceptor3 extends HandlerInterceptorAdapter{
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv)  throws Exception{
		
		
		String method = request.getMethod();
		
		
		//만약 메소드가 POST 형식이라면  return
		if(method.equals("POST")) {
			
			return;
		}
		
		
		//로그인 한 사용자의 ID와  DTO의 USERID가 일치하는지 확인
		
		//로그인한 사용자의 정보
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		
		//DTO
		Map<String, Object> map = mv.getModel();
		
		PartyDTO partyDTO = (PartyDTO)map.get("partyListDTO");
		
//		if(!memberDTO.getUserName().equals(partyDTO.getUserID())) {
//			mv.setViewName("kjk/common/rs");
//			mv.addObject("result", 1);
//			mv.addObject("message", "작성자만 수정이 가능합니다!!");
//			mv.addObject("url", "../");
//			
//			System.out.println("작성자가 아닙니다");
//		}
		
		System.out.println("작성자 Interceptor");
		
		
	}

}
