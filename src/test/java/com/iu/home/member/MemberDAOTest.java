package com.iu.home.member;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iu.home.MyAbstractTest;

public class MemberDAOTest extends MyAbstractTest {

	@Autowired
	MemberDAO memberDAO;
	
	@Test
	public void setJoin()throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		for(int i=3; i<100; i++) {
			memberDTO.setUserid("testID"+i);
			memberDTO.setUsername("per"+i);
			memberDTO.setPwd("pwd"+i);
			memberDTO.setEmail("email"+i);
			memberDTO.setAge(i+0L);
			memberDTO.setBirth("birth"+i);
			memberDTO.setPhone("phone"+i);
			memberDTO.setGender(1L);
			memberDAO.setJoin(memberDTO);
			if(i%10==0) {
				Thread.sleep(500);
			}
		}
	}
	
}
