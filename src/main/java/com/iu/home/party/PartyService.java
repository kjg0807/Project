package com.iu.home.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.home.util.Pager;

@Service
public class PartyService {
	
	@Autowired
	private PartyDAO partyDAO;

	public int setPartyFileAdd(PartyFileDTO partyFileDTO)throws Exception{
		return partyDAO.setPartyFileAdd(partyFileDTO);
	}
	
	public PartyListDTO getPartyDetail(PartyListDTO partyListDTO)throws Exception{
		return partyDAO.getPartyDetail(partyListDTO);
	}
	
	
	public List<PartyListDTO> getPartyList(Pager pager)throws Exception{
		Long totalCount = partyDAO.getPartyCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		return partyDAO.getPartyList(pager);
	}
	
	public int setPartyAdd(PartyListDTO partyListDTO)throws Exception{
		return partyDAO.setPartyAdd(partyListDTO);
	}
	
}
