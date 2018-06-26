package com.orange.dao;

import java.sql.SQLException;
import java.util.List;

import com.orange.domain.Store;
import com.orange.domain.StorePageInfo;

public interface StoreDao {

	public List<Store> findStores(StorePageInfo spf) throws SQLException;

	public List<Store> adminFindStores(StorePageInfo spf) throws SQLException;
	
	public int countStores() throws SQLException;
	
	public Store findStoreByStoreId(String storeId) throws SQLException;

	public void changeStoreState() throws SQLException;
	
}
