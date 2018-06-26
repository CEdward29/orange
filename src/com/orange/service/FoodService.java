package com.orange.service;

import java.util.List;

import com.orange.domain.Food;

public interface FoodService {

	public List<Food> findFoodByStoreId(String storeId);
	
	public Food findFoodByStoreIdAndFoodName(String storeId, String foodName);
	
}
