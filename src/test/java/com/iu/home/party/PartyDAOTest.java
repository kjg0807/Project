package com.iu.home.party;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.iu.home.MyAbstractTest;
import com.iu.home.util.Pager;

public class PartyDAOTest extends MyAbstractTest {
	
	@Autowired
	private PartyDAO partyDAO;
	
//	@Test
//	public void setPartyAdd()throws Exception{
//		
//		for(int i=0; i<100; i++) {
//		PartyDTO partyDTO = new PartyDTO();
//		partyDTO.setUserID("user1");
//		partyDTO.setShopNum(1L);
//		partyDTO.setUserName("per1");
//		partyDTO.setAge(i);
//		partyDTO.setSpot("spot"+i);
//		partyDTO.setPartyContents("con"+i);
//		int result = partyDAO.setPartyAdd(partyDTO);
//		
//		if(i%10==0) {
//			Thread.sleep(500);
//		}
//		}
//		System.out.println("끝");
//		
//	}
	
//	@Test
//	public void setPartyCount()throws Exception{
//		Pager pager = new Pager();
//		long count = partyDAO.getPartyCount();
//		assertEquals(100L, count);
//		
//	}
	
//	@Test
//	public void getPartyList()throws Exception{
//		Pager pager = new Pager();
//		pager.getRowNum();
//		pager.setSearch(1L);
//		List<PartyDTO> ar = partyDAO.getPartyList(pager);
//		assertEquals(10, ar.size());
//	}
	
///	@Test
//	public void setPartyFileAdd()throws Exception{
//		PartyFileDTO partyFileDTO = new PartyFileDTO();
//		for(int i=0; i<50; i++) {
//			partyFileDTO.setFileName("FN"+i);
//			partyFileDTO.setOriName("ON"+i);
//			partyFileDTO.setPartyNum(i+1L);
//			partyDAO.setPartyFileAdd(partyFileDTO);
//			if(i%10==0) {
//				Thread.sleep(500);
//			}
//		}
//		
//	}
	
	

}
