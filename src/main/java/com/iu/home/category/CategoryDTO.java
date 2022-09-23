package com.iu.home.category;

import java.util.List;

import com.iu.home.shop.ShopDTO;

public class CategoryDTO {
	private Long categoryNum;
	private String categoryName;
//	private List<ShopDTO> shopDTOs;
	
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
//	public List<ShopDTO> getShopDTOs() {
//		return shopDTOs;
//	}
//	public void setShopDTOs(List<ShopDTO> shopDTOs) {
//		this.shopDTOs = shopDTOs;
//	}
	
}
