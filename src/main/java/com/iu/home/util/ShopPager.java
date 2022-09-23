package com.iu.home.util;

public class ShopPager {
	
		private Long shopPage;
		private Long startNum;
		private Long lastNum;
		private Long startRow;
		private Long lastRow;
		private Long perPage;
		private Long perBlock;
		private boolean pre;
		private boolean next;
		
		private String kind;
		private String search;
		
		public ShopPager() {
			this.perPage = 10L;
			this.perBlock = 5L;
		}
		
		public void getRowNum()throws Exception{
			this.startRow = (this.getShopPage()-1)*this.getPerPage()+1;
			this.lastRow = (this.getShopPage()*this.getPerPage());
		}
		
		public void getNum(Long totalCount)throws Exception{
			Long totalPage = totalCount/this.getPerPage();
			
			if(totalCount%this.getPerPage() !=0) {
				totalPage++;	
			}
			if(this.getShopPage() > totalPage) {
				this.setShopPage(totalPage);
			}
			Long totalBlock = totalPage/this.getPerBlock();
			if(totalPage%this.getPerBlock() != 0) {
				totalBlock++;
			}
			
			Long curBlock = this.getShopPage()/this.getPerBlock();
			if(this.getShopPage()%this.getPerBlock() != 0 ) {
				curBlock++;
			}
			this.startNum = (curBlock-1)*this.getPerBlock()+1;
			this.lastNum = curBlock*this.getPerBlock();
			
			if(curBlock == totalBlock) {
				this.lastNum=totalPage;
			}
			if(curBlock>1) {
				pre = true;
			}
			if(curBlock<totalBlock) {
				next = true;
			}
			
		}//getNum끝
		
		
		
		public Long getShopPage() {
			if(this.shopPage==null || this.shopPage < 1) {
				this.shopPage=1L;
			}
			return shopPage;
		}
		public void setShopPage(Long shopPage) {
			this.shopPage = shopPage;
		}
		public Long getStartNum() {
			if(this.startNum < 1) {
				this.startNum=1L;
			}
			return startNum;
		}
		public void setStartNum(Long startNum) {
			this.startNum = startNum;
		}
		public Long getLastNum() {
			return lastNum;
		}
		public void setLastNum(Long lastNum) {
			this.lastNum = lastNum;
		}
		public Long getStartRow() {
			return startRow;
		}
		public void setStartRow(Long startRow) {
			this.startRow = startRow;
		}
		public Long getLastRow() {
			return lastRow;
		}
		public void setLastRow(Long lastRow) {
			this.lastRow = lastRow;
		}
		public Long getPerPage() {
			if(this.perPage==null) {
				this.perPage=10L;
			}
			return perPage;
		}
		public void setPerPage(Long perPage) {
			this.perPage = perPage;
		}
		public Long getPerBlock() {
			return perBlock;
		}
		public void setPerBlock(Long perBlock) {
			this.perBlock = perBlock;
		}
		public boolean isPre() {
			return pre;
		}
		public void setPre(boolean pre) {
			this.pre = pre;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}

		public String getKind() {
			return kind;
		}

		public void setKind(String kind) {
			this.kind = kind;
		}

		public String getSearch() {
			if(this.search == null) {
				this.search="";
			}
			return search;
		}

		public void setSearch(String search) {
			this.search = search;
		}
		

}
