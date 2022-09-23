package com.iu.home.menu;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.shop.ShopDTO;

@Repository
public class MenuDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.iu.home.menu.MenuDAO.";
	
	public List<MenuDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	public int setAdd(MenuDTO menuDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", menuDTO);
	}
	public int setUpdate(MenuDTO menuDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", menuDTO);
	}
	public int setDelete(MenuDTO menuDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", menuDTO);
	}

}
