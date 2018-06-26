package com.orange.utils;

import java.util.ArrayList;
import java.util.List;

import com.orange.domain.Food;

public class FoodUtil {

	public static List<Food> returnFoodList(String fl) {
		
		List<Food> foodList = new ArrayList<>();
		Food food = null;
		String[] tfl = fl.split("&");
		for(int i = 0; i < tfl.length; i++) {
			//System.out.println(tfl[i]);
			String[] tfl2 = tfl[i].split(":");
			food = new Food();
			food.setFoodName(tfl2[0]);
			food.setCount(Integer.parseInt(tfl2[1]));
			foodList.add(food);
		}
		return foodList;
		
	}
	
	//public static List<Food> returnFoodList(List<Food> foodList) {
		
		
		
}
	
