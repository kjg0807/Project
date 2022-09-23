package com.iu.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.iu.home.shop.ShopFileDTO;

import oracle.net.aso.m;

@Component//요소
public class ShopFileManager {
	
	public boolean deleteFile(ServletContext servletContext, String path, ShopFileDTO shopFileDTO)throws Exception{
		String realPath = servletContext.getRealPath(path);
		
		File file = new File(realPath, shopFileDTO.getFileName());
		
		return file.delete();
	}
	
	public String saveFile(String path, ServletContext servletContext, MultipartFile multipartFile)throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+multipartFile.getOriginalFilename();
		
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	

}
