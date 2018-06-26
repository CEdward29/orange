package com.orange.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orange.domain.Order;
import com.orange.domain.OrderInfo;
import com.orange.domain.OrderPageInfo;
import com.orange.domain.Store;
import com.orange.domain.User;
import com.orange.service.FoodService;
import com.orange.service.OrderService;
import com.orange.service.StoreService;
import com.orange.service.UserService;
import com.orange.service.imp.FoodServiceImp;
import com.orange.service.imp.OrderServiceImp;
import com.orange.service.imp.StoreServiceImp;
import com.orange.service.imp.UserServiceImp;
import com.orange.utils.CookieUtils;

/**
 * Servlet implementation class ShowOrderInfoServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ShowOrderInfoServlet" })
public class ShowOrderInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowOrderInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获得该用户的所有订单
		HttpSession session = request.getSession(true);
		User user = (User)(session.getAttribute("user"));
		OrderService os = new OrderServiceImp();
		if(user == null) {
			String userId = CookieUtils.getCookieFromCookies(request.getCookies(), "userId").getValue();
			UserService us = new UserServiceImp();
			user = us.findUserByUserId(userId);
			session.setAttribute("user", user);
		}
		List<Order> orders = os.findOrdersByUserId(user.getUserId());
		
		/*for(int i = 0; i < orders.size(); i++) {
			fs.findFoodByStoreIdAndFoodName(orders.get(i).ge, foodName)
		}*/
		
		//封装该用户的所有订单信息
		StoreService ss = new StoreServiceImp();
		OrderInfo oi = null;
		OrderPageInfo opi = new OrderPageInfo();
		List<OrderInfo> orderInfos = new ArrayList<>();
		
		//System.out.println(orders.get(0));
		for(int i = 0; i < orders.size(); i++) {
			oi = new OrderInfo();
			oi.setOrder(orders.get(i));
			Store store = ss.findStoreByStoreId(orders.get(i).getStoreId());
			//System.out.println(store);
			oi.setStore(store);
			orderInfos.add(oi);
			//opi.getOrderInfos().get(i).setOrder(orders.get(i));
			//store = ss.findStoreByStoreId(orders.get(i).getUserId());
			//opi.getOrderInfos().get(i).setStore(store);
		}
		opi.setOrderInfos(orderInfos);
		
		/*OrderInfo oi = new OrderInfo();
		oi.setOrder(order);
		oi.setStore(store);*/
		//System.out.println(opi.getOrderInfos().get(0).getStore());
		
		request.setAttribute("opi", opi);
		request.getRequestDispatcher("/customer/customerGet.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
