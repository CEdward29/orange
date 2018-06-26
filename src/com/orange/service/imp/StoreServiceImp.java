package com.orange.service.imp;

import java.sql.SQLException;
import java.util.List;

import com.orange.dao.StoreDao;
import com.orange.dao.imp.StoreDaoImp;
import com.orange.domain.Store;
import com.orange.domain.StorePageInfo;
import com.orange.exception.StoreException;
import com.orange.service.StoreService;

public class StoreServiceImp implements StoreService {

	StoreDao sd = new StoreDaoImp();
	StoreDaoImp sud = new StoreDaoImp();
	
	@Override
	public List<Store> findStores(StorePageInfo spf) {
		
		try {
			return sd.findStores(spf);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int countStores() {
		
		try {
			return sd.countStores();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Store findStoreByStoreId(String storeId) {
		
		try {
			return sd.findStoreByStoreId(storeId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void regist(Store store) throws StoreException{
		
		try {
			sud.addUser(store);
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new StoreException("注册失败！");
		}
	}

	public Store login(String storeName, String password) throws StoreException {
		Store store = null;
		try {
			store = sud.findByUsernameAndPassword(storeName,password);
			if(store==null) {
				throw new StoreException("用户名或密码错误！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new StoreException("用户登录失败!");
		}
		return store;
	}

	public Store findUserById(String storeId) throws StoreException {

		try {
			return sud.findUserById(storeId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new StoreException("商家信息錯誤！");
		}
	}

	public void modifySUser(Store store) throws StoreException {
		try {
			sud.modifySUser(store);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new StoreException("修改商家信息失败");
		}
		
	}

	@Override
	public List<Store> adminFindStores(StorePageInfo spf) {
		
		try {
			return sd.adminFindStores(spf);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	@Override
	public void getThroughStore() {

		try {
			sd.changeStoreState();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
