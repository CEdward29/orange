package com.orange.dao;

import java.sql.SQLException;
import java.util.List;

import com.orange.domain.Food;

public interface FoodDao {

	public List<Food> findFoodByStoreId(String storeId) throws SQLException;
	
	public Food findFoodByStoreIdAndFoodName(String storeId, String foodName) throws SQLException;
	
}
