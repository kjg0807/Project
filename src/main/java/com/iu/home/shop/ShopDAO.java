package com.iu.home.shop;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iu.home.menu.MenuDTO;
import com.iu.home.util.ShopPager;

import oracle.net.aso.m;

@Repository
public class ShopDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.iu.home.shop.ShopDAO.";
	

	public int setAdd(ShopDTO shopDTO)throws Exception{
		System.out.println("setAdd");
		return sqlSession.insert(NAMESPACE+"setAdd", shopDTO);
	}

	public List<ShopDTO> getList(ShopPager shopPager)throws Exception{
		System.out.println("setList");
		return sqlSession.selectList(NAMESPACE+"getList", shopPager);
	}
	public Long getCount(ShopPager shopPager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", shopPager);
	}
	
	public ShopDTO getDetail(ShopDTO shopDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", shopDTO);
	}
	public int setUpdate(ShopDTO shopDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", shopDTO);
	}
	public int setDelete(ShopDTO shopDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", shopDTO);
	}
	//=============================file
	public int setAddFile(ShopFileDTO shopFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddFile", shopFileDTO);
	}
	//=============================menu
	public int setAddMenu(ShopDTO shopDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddMenu", shopDTO);
	}
	public int setUpdateMenu(ShopDTO shopDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateMenu", shopDTO);
	}
	public int setDeleteMenu(ShopDTO shopDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteMenu", shopDTO);
	}



}
