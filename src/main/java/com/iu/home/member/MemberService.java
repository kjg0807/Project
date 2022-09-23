package com.iu.home.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository("myservice")
public class MemberService
{
	@Autowired
	@Qualifier("mydao")
	private MemberDAO memberDAO;

	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.getLogin(memberDTO);
	}

	public int setJoin(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.setJoin(memberDTO);
	}

	public MemberDTO getMyPage(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.getMyPage(memberDTO);
	}

	public List<MemberDTO> adMyPage(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.adMyPage(memberDTO);
	}
}
