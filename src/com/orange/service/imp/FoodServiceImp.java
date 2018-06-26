package com.orange.service.imp;

import java.sql.SQLException;
import java.util.List;

import com.orange.dao.FoodDao;
import com.orange.dao.imp.FoodDaoImp;
import com.orange.domain.Food;
import com.orange.exception.FoodException;
import com.orange.service.FoodService;

public class FoodServiceImp implements FoodService {

	FoodDao fd = new FoodDaoImp();
	FoodDaoImp dd = new FoodDaoImp();
	
	@Override
	public List<Food> findFoodByStoreId(String storeId) {
		
		try {
			return fd.findFoodByStoreId(storeId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Food findFoodByStoreIdAndFoodName(String storeId, String foodName) {
		
		try {
			Food food = fd.findFoodByStoreIdAndFoodName(storeId, foodName);
			//System.out.println(food);
			return food;
		} catch (SQLException e) {
			System.out.println("查询出错");
			e.printStackTrace();
		}
		
		return null;
	}

	public Food findFoodById(String foodId) throws FoodException {
		try {
			return dd.findFoodById(foodId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("通过id查找商品失败！");
		}
	}

	

	public Food findFoodByFoodname(String foodName, String storeId) throws FoodException {
		try {
			return dd.findFoodByFoodname(foodName,storeId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("通过名称查找商品失败！");

		}
	}

	
	

	public void modifyFood(Food food) throws FoodException {
		try {
			dd.modifyFood(food);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("商品信息修改失败！");
		}
	}

	public void addFood(Food food) throws FoodException {
		try {
			dd.addFood(food);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("商品添加失败！");
		}
	}

	public int delFood(String foodId) throws FoodException {
		try {
			return dd.delFood(foodId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("商品删除失败！");
		}
	}

	public List<Food> findAllfood(String storeId) throws FoodException {
		try {
			return dd.findAllfood(storeId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FoodException("美食查找失败！");
		}
	}
	
}
