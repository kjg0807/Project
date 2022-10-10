package com.iu.home.shop;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.web.WebAppConfiguration;

import com.iu.home.MyAbstractTest;

public class ShopDAOTest extends MyAbstractTest {

	@Autowired
	private ShopDAO shopDAO;
	
//	@Test
//	public void getList()throws Exception{
//		List<ShopDTO> ar = shopDAO.getList(1);
//		assertNotEquals(0, ar.size());
//	}
	
//	@Test
//	public void setAddTest()throws Exception{
//		for(int i = 0; i<30; i++) {
//		ShopDTO shopDTO = new ShopDTO();
//		shopDTO.setCategoryNum(1L);
//		shopDTO.setShopPhone("010-0000-000"+i);
//		shopDTO.setShopName("shopName"+i);
//		shopDTO.setShopAddress("shopAddress"+i);
//		shopDTO.setPriceAvg(i+1L);
//		shopDTO.setDelivery(i+1L);
//		shopDTO.setContents("contents"+i);
//		shopDTO.setTitle("title"+i);
//		shopDTO.setHit(0L);
//		int result = shopDAO.setAdd(shopDTO);
//		}
//	}
//	
}
