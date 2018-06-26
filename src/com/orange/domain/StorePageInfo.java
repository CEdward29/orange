package com.orange.domain;

import java.util.List;

public class StorePageInfo {

	private int currentPage;      //当前页
	private int storeNum;		  //显示的店铺数
	private int totalPage;        //总页数
	private int totalStore;		  //总店铺数
	private List<Store> stores;   //店铺
	public int getTotalStore() {
		return totalStore;
	}
	public void setTotalStore(int totalStore) {
		this.totalStore = totalStore;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<Store> getStores() {
		return stores;
	}
	public void setStores(List<Store> stores) {
		this.stores = stores;
	}
	
}
