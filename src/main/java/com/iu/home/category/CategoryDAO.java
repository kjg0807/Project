package com.iu.home.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.shop.ShopDTO;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.home.category.CategoryDAO.";
	
	public int setAdd(CategoryDTO categoryDTO)throws Exception{
	 return sqlSession.insert(NAMESPACE+"setAdd", categoryDTO);
	}

	public List<CategoryDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
//	public List<CategoryDTO> getCategoryList(ShopDTO shopDTO)throws Exception{
//		return sqlSession.selectList(NAMESPACE+"getCategoryList", shopDTO);
//	}
	
	public int setDelete(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", categoryDTO);
	}
	
	public int setUpdate(CategoryDTO categoryDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", categoryDTO);
	}
}
