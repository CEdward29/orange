package com.orange.dao;

import java.sql.SQLException;
import java.util.List;

import com.orange.domain.Food;
import com.orange.domain.Order;

public interface OrderDao {

	public void addOrder(Order order, String storeId) throws SQLException;
	
	public List<Order> findOrdersByUserId(String userId) throws SQLException;
}
