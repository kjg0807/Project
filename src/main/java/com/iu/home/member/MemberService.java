package com.iu.home.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.iu.home.reviews.ReviewsDAO;
import com.iu.home.reviews.ReviewsDTO;
import com.iu.home.util.ReviewsPager;

@Service
@Repository("myservice")
public class MemberService
{
	@Autowired
	@Qualifier("mydao")
	private MemberDAO memberDAO;
	@Autowired
	private ReviewsDAO reviewsDAO;

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

	public int setUpdate(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.setUpdate(memberDTO);
	}

	public int setDelete(MemberDTO memberDTO) throws Exception
	{
		return memberDAO.setDelete(memberDTO);
	}

	public int getCheckId(String id) throws Exception
	{
		return memberDAO.getCheckId(id);
	}

	public List<ReviewsDTO> getReview(ReviewsPager reviewsPager) throws Exception
	{
		return reviewsDAO.getReviewsList(reviewsPager);
	}

	public List<ReviewsDTO> reviewsList(ReviewsDTO reviewsDTO) throws Exception
	{
		return memberDAO.reviewsList(reviewsDTO);
	}
}
