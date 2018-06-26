package com.orange.service;

import java.util.List;

import com.orange.domain.Store;
import com.orange.domain.StorePageInfo;

public interface StoreService {

	public List<Store> findStores(StorePageInfo spf);
	
	public List<Store> adminFindStores(StorePageInfo spf);

	public int countStores();
	
	public Store findStoreByStoreId(String storeId);
	
	public void getThroughStore();
	
}
