package com.orange.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.domain.Food;
import com.orange.domain.Order;
import com.orange.domain.OrderInfo;
import com.orange.domain.Store;
import com.orange.service.FoodService;
import com.orange.service.StoreService;
import com.orange.service.imp.FoodServiceImp;
import com.orange.service.imp.StoreServiceImp;

import javafx.util.Pair;

/**
 * Servlet implementation class ShowFoodCartInfoServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ShowFoodCartInfoServlet" })
public class ShowFoodCartInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFoodCartInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取表单数据
		String storeId = request.getParameter("storeId");
		//System.out.println(storeId);
		String[] tfoodNames = request.getParameterValues("foodName");
		List<String> foodNames = Arrays.asList(tfoodNames);
		//System.out.println(foodNames);
		String[] tfoodCount = request.getParameterValues("foodCount");
		List<String> foodCount = Arrays.asList(tfoodCount);
		//System.out.println(foodCount);
		
		//封装订单商品信息
		List<Food> foodList = new ArrayList();
		//List<String> nos = new ArrayList();
	 	FoodService fs = new FoodServiceImp();
	 	StoreService ss = new StoreServiceImp();
	 	Food food;
		for(int i = 0; i < foodNames.size(); i++) {
			food = new Food();
			food.setFoodName(foodNames.get(i));
			food = fs.findFoodByStoreIdAndFoodName(storeId, food.getFoodName());
			food.setCount(Integer.parseInt(foodCount.get(i)));
			foodList.add(food);
			//nos.add(i + "");//顺带初始化nos
		}
		
		//输出foodList
		/*for(int i = 0; i < foodList.size(); i++) {
			System.out.println(foodList.get(i).toString());
		}*/
		
		Order order = new Order();
		double totalPrice = 0;
		int totalNum = 0;
		for(int i = 0; i < foodList.size(); i++) {
			totalPrice += foodList.get(i).getFoodPrice() * foodList.get(i).getCount();
			totalNum += foodList.get(i).getCount();
		}
		order.setTotalPrice(totalPrice);
		order.setTotalNum(totalNum);
		order.setFoodList(foodList);
		
		Store store = ss.findStoreByStoreId(storeId);
		
		OrderInfo oi = new OrderInfo();
		//oi.setNos(nos);
		oi.setOrder(order);
		oi.setStore(store);
		
		
		//System.out.println(oi.getOrder().toString());
		
		
		//分发转向
		request.setAttribute("oi", oi);
		request.getRequestDispatcher("customer/foodcar.jsp").forward(request, response);
		
		//System.out.println(foodInfo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
