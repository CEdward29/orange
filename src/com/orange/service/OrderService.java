package com.orange.service;

import java.util.List;

import com.orange.domain.Food;
import com.orange.domain.Order;

public interface OrderService {

	public void addOrder(Order order ,String storeId);
	
	public List<Order> findOrdersByUserId(String userId);
	
}
