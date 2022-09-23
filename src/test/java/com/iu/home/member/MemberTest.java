package com.iu.home.member;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iu.home.MyAbstractTest;

public class MemberTest extends MyAbstractTest
{
	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void adpage() throws Exception
	{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserid("asd");
		memberDTO.setUsername("asdf");
		memberDTO.setPwd("qwef");
		memberDTO.setAge(22L);
		memberDTO.setBirth("888888");
		memberDTO.setEmail("asdf@aqwer");
		memberDTO.setGender(1L);
		memberDTO.setPhone("010-3451-2345");
		
		List<MemberDTO> rs = memberDAO.adMyPage(memberDTO);
		
		System.out.println(memberDTO.getUserid());
		System.out.println(memberDTO.getUsername());
		System.out.println(memberDTO.getPwd());
		System.out.println(memberDTO.getAge());
		System.out.println(memberDTO.getBirth());
		System.out.println(memberDTO.getEmail());
		System.out.println(memberDTO.getGender());
		System.out.println(memberDTO.getPhone());
		
		assertNotEquals(0, rs.size());
	}
}
