package com.iu.home.party;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PartyListDTO {
	
	private Long partyNum;
	private String userID;
	private String userName;
	private Long shopNum;
	private String partyTitle;
	private String partyContents;
	@JsonFormat(pattern = "yy-MM-dd")
	private Date partyRegdate;
	@JsonFormat(pattern = "HH:mm:ss")
	private Date partyTimeout;
	private int partyHH;
	private int partymm;
	private List<PartyFileDTO> partyFileDTOs;
	
	public Long getPartyNum() {
		return partyNum;
	}
	public void setPartyNum(Long partyNum) {
		this.partyNum = partyNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getShopNum() {
		return shopNum;
	}
	public void setShopNum(Long shopNum) {
		this.shopNum = shopNum;
	}
	public String getPartyTitle() {
		return partyTitle;
	}
	public void setPartyTitle(String partyTitle) {
		this.partyTitle = partyTitle;
	}
	public String getPartyContents() {
		return partyContents;
	}
	public void setPartyContents(String partyContents) {
		this.partyContents = partyContents;
	}
	public Date getPartyRegdate() {
		return partyRegdate;
	}
	public void setPartyRegdate(Date partyRegdate) {
		this.partyRegdate = partyRegdate;
	}
	public Date getPartyTimeout() {
		return partyTimeout;
	}
	public void setPartyTimeout(Date partyTimeout) {
		this.partyTimeout = partyTimeout;
	}
	public List<PartyFileDTO> getPartyFileDTOs() {
		return partyFileDTOs;
	}
	public void setPartyFileDTOs(List<PartyFileDTO> partyFileDTOs) {
		this.partyFileDTOs = partyFileDTOs;
	}
	public int getPartyHH() {
		return partyHH;
	}
	public void setPartyHH(int partyHH) {
		this.partyHH = partyHH;
	}
	public int getPartymm() {
		return partymm;
	}
	public void setPartymm(int partymm) {
		this.partymm = partymm;
	}
	
	
	

}
