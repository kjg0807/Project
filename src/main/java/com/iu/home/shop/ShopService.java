package com.iu.home.shop;

import java.io.File;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.home.menu.MenuDTO;
import com.iu.home.util.ShopFileManager;
import com.iu.home.util.ShopPager;

@Service
public class ShopService {
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private ShopFileManager shopFileManager;
	
	
	public int setAdd(ShopDTO shopDTO, MultipartFile[] files, ServletContext servletContext)throws Exception{
		int result = shopDAO.setAdd(shopDTO);
		String path = "resources/upload/shop";
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = shopFileManager.saveFile(path, servletContext, multipartFile);
			ShopFileDTO shopFileDTO = new ShopFileDTO();
			shopFileDTO.setFileName(fileName);
			shopFileDTO.setOriName(multipartFile.getOriginalFilename());
			shopFileDTO.setShopNum(shopDTO.getShopNum());
			shopDAO.setAddFile(shopFileDTO);
		}
		return result;
	}
	
	public List<ShopDTO> getList(ShopPager shopPager) throws Exception{
		// TODO Auto-generated method stub
		Long totalCount = shopDAO.getCount(shopPager);
		shopPager.getNum(totalCount);
		shopPager.getRowNum();
		return shopDAO.getList(shopPager);
	}
	
	public ShopDTO getDetail(ShopDTO shopDTO)throws Exception{
		return shopDAO.getDetail(shopDTO);
	}
	public int setHitUpdate(ShopDTO shopDTO)throws Exception{
		return shopDAO.setHitUpdate(shopDTO);
	}
	
	public int setUpdate(ShopDTO shopDTO,  MultipartFile[] files, ServletContext servletContext)throws Exception{
		String path = "resources/upload/shop";
		int result = shopDAO.setUpdate(shopDTO);
		if(result<1) {
			return result;
		}
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = shopFileManager.saveFile(path, servletContext, multipartFile);
			ShopFileDTO shopFileDTO = new ShopFileDTO();
			shopFileDTO.setFileName(fileName);
			shopFileDTO.setOriName(multipartFile.getOriginalFilename());
			shopFileDTO.setShopNum(shopDTO.getShopNum());
			shopDAO.setAddFile(shopFileDTO);
		}
		return result;
	}
	
	public int setDelete(ShopDTO shopDTO)throws Exception{
		return shopDAO.setDelete(shopDTO);
	}
//						MENU
	public int setAddMenu(ShopDTO shopDTO)throws Exception{
		return shopDAO.setAddMenu(shopDTO);
	}
	
	public int setUpdateMenu(ShopDTO shopDTO)throws Exception{
		return shopDAO.setUpdateMenu(shopDTO);
	}
	
	public int setDeleteMenu(ShopDTO shopDTO)throws Exception{
		return shopDAO.setDeleteMenu(shopDTO);
	}
//                     FILE
	public int setFileDelete(ShopFileDTO shopFileDTO, ServletContext servletContext)throws Exception{
		shopFileDTO = shopDAO.getFileDetail(shopFileDTO);
		int result = shopDAO.setFileDelete(shopFileDTO);
		String path = "resources/upload/shop";
		if (result > 0) {
			shopFileManager.deleteFile(servletContext, path, shopFileDTO);
		}
		return result;
	}
	

}
