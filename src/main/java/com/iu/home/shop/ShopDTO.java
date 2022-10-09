package com.iu.home.shop;

import java.util.List;

import com.iu.home.category.CategoryDTO;
import com.iu.home.member.MemberDTO;
import com.iu.home.menu.MenuDTO;
import com.iu.home.reviews.ReviewsDTO;
import com.iu.home.reviews.ReviewsFilesDTO;


public class ShopDTO extends MenuDTO{
   
   private Long shopNum;
   private Long categoryNum;
   private String shopPhone;
   private String shopName;
   private String shopAddress;
   private Long priceAvg;
   private Long delivery;
   private String shopContents;
   private String shopTitle;
   private Long hit;
   private String userID;
   private List<ShopFileDTO> shopFileDTOs;
   private List<MenuDTO> menuDTOs;
   private List<CategoryDTO> categoryDTOs;
   private List<ReviewsDTO> reviewsDTOs;
   private List<MemberDTO> memberDTOs;



   
   public String getUserID() {
      return userID;
   }
   public void setUserID(String userID) {
      this.userID = userID;
   }
   public List<MemberDTO> getMemberDTOs() {
      return memberDTOs;
   }
   public void setMemberDTOs(List<MemberDTO> memberDTOs) {
      this.memberDTOs = memberDTOs;
   }
   public String getShopContents() {
      return shopContents;
   }
   public void setShopContents(String shopContents) {
      this.shopContents = shopContents;
   }
   public String getShopTitle() {
      return shopTitle;
   }
   public void setShopTitle(String shopTitle) {
      this.shopTitle = shopTitle;
   }
   public List<ReviewsDTO> getReviewsDTOs() {
      return reviewsDTOs;
   }
   public void setReviewsDTOs(List<ReviewsDTO> reviewsDTOs) {
      this.reviewsDTOs = reviewsDTOs;
   }
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