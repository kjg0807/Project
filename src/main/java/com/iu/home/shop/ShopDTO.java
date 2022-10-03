package com.iu.home.shop;

import java.util.List;

import com.iu.home.category.CategoryDTO;
import com.iu.home.menu.MenuDTO;


public class ShopDTO extends MenuDTO{
	
	private Long shopNum;
	private Long categoryNum;
	private String shopPhone;
	private String shopName;
	private String shopAddress;
	private Long priceAvg;
	private Long delivery;
	private String contents;
	private String title;
	private Long hit;
	private List<ShopFileDTO> shopFileDTOs;
	private List<MenuDTO> menuDTOs;
	private List<CategoryDTO> categoryDTOs;


	
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getShopNum() {
		return shopNum;
	}
	public void setShopNum(Long shopNum) {
		this.shopNum = shopNum;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getShopPhone() {
		return shopPhone;
	}
	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopAddress() {
		return shopAddress;
	}
	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}
	public Long getPriceAvg() {
		return priceAvg;
	}
	public void setPriceAvg(Long priceAvg) {
		this.priceAvg = priceAvg;
	}
	public Long getDelivery() {
		return delivery;
	}
	public void setDelivery(Long delivery) {
		this.delivery = delivery;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<ShopFileDTO> getShopFileDTOs() {
		return shopFileDTOs;
	}
	public void setShopFileDTOs(List<ShopFileDTO> shopFileDTOs) {
		this.shopFileDTOs = shopFileDTOs;
	}
	public List<MenuDTO> getMenuDTOs() {
		return menuDTOs;
	}
	public void setMenuDTOs(List<MenuDTO> menuDTOs) {
		this.menuDTOs = menuDTOs;
	}
	public List<CategoryDTO> getCategoryDTOs() {
		return categoryDTOs;
	}
	public void setCategoryDTOs(List<CategoryDTO> categoryDTOs) {
		this.categoryDTOs = categoryDTOs;
	}


	
	
	
	
}
