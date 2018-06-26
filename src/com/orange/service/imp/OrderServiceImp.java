package com.orange.service.imp;

import java.sql.SQLException;
import java.util.List;

import com.orange.dao.OrderDao;
import com.orange.dao.imp.OrderDaoImp;
import com.orange.domain.Order;
import com.orange.exception.OrderException;
import com.orange.service.OrderService;

public class OrderServiceImp implements OrderService {

	OrderDaoImp od = new OrderDaoImp();
	
	@Override
	public void addOrder(Order order, String storeId) {

		try {
			od.addOrder(order, storeId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Order> findOrdersByUserId(String userId) {
		try {
			return od.findOrdersByUserId(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Order> findOrderList1(String storeId) throws OrderException {
		try {
			return od.findOrderList1(storeId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new OrderException("没有待处理订单");
		}
	}

	public void send(String orderId) throws OrderException {
		try {
			od.send(orderId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new OrderException("送餐失败");
		}
	}

	public void acceptOrder(String orderId) throws OrderException {
		try {
			od.acceptOrder(orderId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new OrderException("修改订单状态失败");
		}
	}

	public Order findOrderById(String orderId) throws OrderException {
		try {
			return od.findOrderById(orderId);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new OrderException("订单查找失败！");
		}
	}

}







