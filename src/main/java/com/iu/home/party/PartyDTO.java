package com.iu.home.party;

import java.util.List;

import com.iu.home.member.MemberDTO;

public class PartyDTO {
	
	private Long partyNum;
	private String userName;
	private int partyAge;
	private int partyGender;
	private String partyComment;
	private int partyRequest;
	private int shopNum;
	private String userID;
	
	private List<MemberDTO> memberDTOs;
	
	
	
	public List<MemberDTO> getMemberDTOs() {
		return memberDTOs;
	}
	public void setMemberDTOs(List<MemberDTO> memberDTOs) {
		this.memberDTOs = memberDTOs;
	}
	public Long getPartyNum() {
		return partyNum;
	}
	public void setPartyNum(Long partyNum) {
		this.partyNum = partyNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPartyAge() {
		return partyAge;
	}
	public void setPartyAge(int partyAge) {
		this.partyAge = partyAge;
	}
	public int getPartyGender() {
		return partyGender;
	}
	public void setPartyGender(int partyGender) {
		this.partyGender = partyGender;
	}
	public String getPartyComment() {
		return partyComment;
	}
	public void setPartyComment(String partyComment) {
		this.partyComment = partyComment;
	}
	public int getPartyRequest() {
		return partyRequest;
	}
	public void setPartyRequest(int partyRequest) {
		this.partyRequest = partyRequest;
	}
	public int getShopNum() {
		return shopNum;
	}
	public void setShopNum(int shopNum) {
		this.shopNum = shopNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	

	

}
