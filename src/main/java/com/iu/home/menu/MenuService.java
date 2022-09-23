package com.iu.home.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.home.shop.ShopDTO;

@Service
public class MenuService {

	@Autowired
	private MenuDAO menuDAO;
	
	public List<MenuDTO> getList()throws Exception{
		return menuDAO.getList();
	}
	public int setAdd(MenuDTO menuDTO)throws Exception{
		return menuDAO.setAdd(menuDTO);
	}
	public int setUpdate(MenuDTO menuDTO)throws Exception{
		return menuDAO.setUpdate(menuDTO);
	}
	public int setDelete(MenuDTO menuDTO)throws Exception{
		return menuDAO.setDelete(menuDTO);
	}
	
}
