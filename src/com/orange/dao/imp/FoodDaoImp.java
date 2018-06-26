package com.orange.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.orange.dao.FoodDao;
import com.orange.domain.Food;
import com.orange.domain.Store;
import com.orange.utils.C3P0Util;

public class FoodDaoImp implements FoodDao {

	@Override
	public List<Food> findFoodByStoreId(String storeId) throws SQLException {

		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("SELECT * FROM food WHERE storeId=?", new BeanListHandler<Food>(Food.class), storeId);
		
	}

	@Override
	public Food findFoodByStoreIdAndFoodName(String storeId, String foodName) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("SELECT * FROM food WHERE storeId=?&&foodName=?", new BeanHandler<Food>(Food.class), storeId, foodName);
	}
	
	//通过id查找商品
	public Food findFoodById(String foodId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from food where foodId=?", new BeanHandler<Food>(Food.class), foodId);
	}
	
	//通过美食名称查找美食
	public Food findFoodByFoodname(String foodName,String storeId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from food where foodName=? and storeId=?", new BeanHandler<Food>(Food.class), foodName,storeId);
	}	
	
	//修改商品信息
	public void modifyFood(Food food) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update food set foodName=?, foodType=?, foodPrice=?, salesnum=?, foodUri=?, foodDescription=? where foodId=?",food.getFoodName(),food.getFoodType(),food.getFoodPrice(),food.getSalesNum(),food.getFoodUri(),food.getFoodDescription(),food.getFoodId());
		
	}
	
	//添加商品
	public void addFood(Food food) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "INSERT INTO food(foodId,foodName,foodType,foodPrice,salesnum,foodUri,foodDescription,storeId)"+"VALUES(?,?,?,?,?,?,?,?)";
		qr.update(sql, food.getFoodId(), food.getFoodName(),food.getFoodType(),food.getFoodPrice(),food.getSalesNum(),food.getFoodUri(),food.getFoodDescription(),food.getStoreId());
	}
	
	//删除商品
	public int delFood(String foodId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.update("delete from food where foodId=?", foodId);
	}
	
	//找到所有商品
	public List<Food> findAllfood(String storeId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("SELECT * FROM `food` where storeId=?", new BeanListHandler<Food>(Food.class),storeId);
	}

}




