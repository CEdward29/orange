package com.orange.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.orange.dao.StoreDao;
import com.orange.domain.Store;
import com.orange.domain.StorePageInfo;
import com.orange.domain.User;
import com.orange.utils.C3P0Util;

public class StoreDaoImp implements StoreDao {

	@Override
	public List<Store> findStores(StorePageInfo spf) throws SQLException {
		
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		//limit查询的开始下标
		int storeIndex = (spf.getCurrentPage() - 1) * spf.getStoreNum();
		String sql = "SELECT * FROM store where state=1 LIMIT ?,?";
		return (List<Store>) qr.query(sql, new BeanListHandler<Store>(Store.class), storeIndex, spf.getStoreNum());
		
	}

	@Override
	public int countStores() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		Number n = (Number)qr.query("SELECT COUNT(*) FROM store", new ScalarHandler(1));
		return n.intValue();
	}

	@Override
	public Store findStoreByStoreId(String storeId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		//根据storeId获取store信息和该store的食物信息
		return qr.query("SELECT * FROM store WHERE storeId=?", new BeanHandler<Store>(Store.class), storeId);
	}
	
	//商家注册
	public void addUser(Store store) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "INSERT INTO store(storeId,storeName,password,address,email,telephone,registime)"+"VALUES(?,?,?,?,?,?,?)";
		qr.update(sql, store.getStoreId(),store.getStoreName(),store.getPassword(),store.getAddress(),store.getEmail(),store.getTelephone(),store.getRegistime());
	}
	//商家登录
	public Store findByUsernameAndPassword(String storeName, String password) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from store where storeName=? and password=?", new BeanHandler<Store>(Store.class), storeName,password);
	}
	//通过id查找商家
	public Store findUserById(String storeId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from store where storeId=?", new BeanHandler<Store>(Store.class), storeId);
	}
	//修改商家信息
	public void modifySUser(Store store) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update store set storeName=?, password=?, sendTime=?, sendCost=?, type=?, description=?, openTime=?, address=?,email=?,telephone=?,imgUri=? where storeId=?",store.getStoreName(),store.getPassword(),store.getSendTime(),store.getSendCost(),store.getType(),store.getDescription(),store.getOpenTime(),store.getAddress(),store.getEmail(),store.getTelephone(),store.getImgUri(),store.getStoreId());
		
	}

	@Override
	public List<Store> adminFindStores(StorePageInfo spf) throws SQLException {

		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		//limit查询的开始下标
		int storeIndex = (spf.getCurrentPage() - 1) * spf.getStoreNum();
		String sql = "SELECT * FROM store LIMIT ?,?";
		return (List<Store>) qr.query(sql, new BeanListHandler<Store>(Store.class), storeIndex, spf.getStoreNum());
	
	}

	@Override
	public void changeStoreState() throws SQLException {

		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update store set state=1");
		
	}
	
}




