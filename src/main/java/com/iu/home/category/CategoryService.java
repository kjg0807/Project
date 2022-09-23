package com.iu.home.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.home.shop.ShopDTO;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	public int setAdd(CategoryDTO categoryDTO)throws Exception{
		return categoryDAO.setAdd(categoryDTO);
	}
	
	public List<CategoryDTO> getList()throws Exception{
		return categoryDAO.getList();
	}
//	public List<CategoryDTO> getCategoryList(ShopDTO shopDTO)throws Exception{
//		return categoryDAO.getCategoryList(shopDTO);
//	}

	public int setDelete(CategoryDTO categoryDTO)throws Exception{
		return categoryDAO.setDelete(categoryDTO);
	}
}

