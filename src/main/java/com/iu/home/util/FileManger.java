package com.iu.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.iu.home.reviews.ReviewsFilesDTO;

@Component
public class FileManger {
	//@Autowired
	//private ServletContext servletContext;
	
	//save
	//public void saveFile(ServletContext servletContext, String path)throws Exception{
	public String saveFile(ServletContext servletContext, String path, MultipartFile multipartFile)throws Exception{
		//1. 실제 경로
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		
		//2. 폴더(directory) 체크
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//3. 저장할 파일명 생성
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+multipartFile.getOriginalFilename();
		
		//4. HDD에 저장
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		
		return fileName;
	}

	
	//Delete
	
	public boolean deleteReviewsFiles(ServletContext servletContext, String path, ReviewsFilesDTO reviewsFilesDTO) throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		File file = new File(realPath, reviewsFilesDTO.getFileName());
		
		return file.delete();
	}
}
