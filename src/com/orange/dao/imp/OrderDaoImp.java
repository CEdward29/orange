package com.orange.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.orange.dao.OrderDao;
import com.orange.domain.Food;
import com.orange.domain.Order;
import com.orange.service.FoodService;
import com.orange.service.imp.FoodServiceImp;
import com.orange.utils.C3P0Util;
import com.orange.utils.FoodUtil;

public class OrderDaoImp implements OrderDao {

	@Override
	public void addOrder(Order order, String storeId) throws SQLException {

		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		
		//组装foodList信息
		List<Food> fl = order.getFoodList();
		String foodList = "";
		for(int i = 0; i < fl.size(); i++) {
			foodList += fl.get(i).getFoodName() + ":" + fl.get(i).getCount();
 			if(i < fl.size() - 1) {
 				foodList += "&";
 			}
		}
		
		qr.update("INSERT INTO oorder(orderId,storeId,foodList, totalNum, totalPrice, orderState,userId,orderDate,sendAddress) VALUES(?,?,?,?,?,?,?,?,?);",order.getOrderId(), storeId, foodList, order.getTotalNum(),order.getTotalPrice(),order.getOrderState(), order.getUserId(), order.getOrderDate(), order.getSendAddress());
		
	}

	@Override
	public List<Order> findOrdersByUserId(String userId) throws SQLException {
		
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		//获取到某个用户的全部订单食物列表
		List<Object[]> flStrList = qr.query("SELECT foodList FROM oorder WHERE userId=? ORDER BY orderDate DESC", new ArrayListHandler(), userId);
		//获取除某个用户的全部订单食物列表外的所有信息
		List<Order> orderList = qr.query("SELECT orderId,storeId,userId,totalNum,totalPrice,orderState,orderDate,sendAddress FROM oorder WHERE userId=? ORDER BY orderDate DESC", new BeanListHandler<Order>(Order.class), userId);
		
		//处理用户的全部订单食物列表添加到各个order里
		FoodService fs = new FoodServiceImp();
		for(int i = 0; i < flStrList.size(); i++) {
			String tfl = (String) flStrList.get(i)[0];
			List<Food> fl = FoodUtil.returnFoodList(tfl);//一个订单的商品信息
			String storeId = orderList.get(i).getStoreId();//得到每个订单的storeId
			//更新一个订单里面的所有商品信息
			Food food = null;
			for(int j = 0; j < fl.size(); j++) {
				int count = fl.get(j).getCount();
				food = fs.findFoodByStoreIdAndFoodName(storeId, fl.get(j).getFoodName());
				food.setCount(count);
				fl.set(j, food);
			}
			orderList.get(i).setFoodList(fl);
		}
		return orderList;
	}
	
	//通过商家名称找到订单状态为1(已提交)的所有订单
	public List<Order> findOrderList1(String storeId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String state = "已支付";
		List<Object[]> flStrList = qr.query("SELECT foodList FROM oorder WHERE storeId=?&&orderState=? ORDER BY orderDate DESC", new ArrayListHandler(), storeId, state);
		List<Order> orderList = qr.query("SELECT orderId,storeId,userId,totalNum,totalPrice,orderState,orderDate,sendAddress FROM oorder WHERE storeId=?&&orderState=? ORDER BY orderDate DESC", new BeanListHandler<Order>(Order.class), storeId, state);
		//处理用户的全部订单食物列表添加到各个order里
		FoodService fs = new FoodServiceImp();
		for(int i = 0; i < flStrList.size(); i++) {
			String tfl = (String) flStrList.get(i)[0];
			List<Food> fl = FoodUtil.returnFoodList(tfl);//一个订单的商品信息
			String storeId2 = orderList.get(i).getStoreId();//得到每个订单的storeId
			//更新一个订单里面的所有商品信息
			Food food = null;
			for(int j = 0; j < fl.size(); j++) {
				int count = fl.get(j).getCount();
				food = fs.findFoodByStoreIdAndFoodName(storeId2, fl.get(j).getFoodName());
				food.setCount(count);
				fl.set(j, food);
			}
			orderList.get(i).setFoodList(fl);
		}
		return orderList;		
		
		//return qr.query("SELECT * FROM oorder where storeId=? and orderState='已支付'", new BeanListHandler<Order>(Order.class),storeId);
	}	
	
	//通过订单ID找到订单并把订单状态设置为3，表示已送餐
	public void send(String orderId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update oorder set orderState='已送餐' where orderId=?", orderId);
	}
	
	//通过订单ID查找订单并把订单状态设置为2，表示已接单
	public void acceptOrder(String orderId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update oorder set orderState='已接单' where orderId=?", orderId);
	}
	
	//通过订单ID查找订单
	public Order findOrderById(String orderId) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		
		String flStr = (String)qr.query("SELECT foodList FROM oorder WHERE orderId=? ORDER BY orderDate DESC", new ScalarHandler(1), orderId);
		Order order = qr.query("SELECT orderId,storeId,userId,totalNum,totalPrice,orderState,orderDate,sendAddress FROM oorder WHERE orderId=? ORDER BY orderDate DESC", new BeanHandler<Order>(Order.class), orderId);
		//System.out.println(flStr.toString());
		List<Food> foodList = FoodUtil.returnFoodList(flStr.toString());
		order.setFoodList(foodList);
		return order;
		//return qr.query("select * from oorder where orderId=?", new BeanHandler<Order>(Order.class), orderId);
	}
	
}



