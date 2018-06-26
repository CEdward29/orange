package com.orange.web.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.orange.domain.Food;
import com.orange.domain.Order;
import com.orange.domain.User;
import com.orange.service.OrderService;
import com.orange.service.UserService;
import com.orange.service.imp.OrderServiceImp;
import com.orange.service.imp.UserServiceImp;
import com.orange.utils.CookieUtils;
import com.orange.utils.DateUtil;
import com.orange.utils.UUIDUtil;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/CreateOrderServlet" })
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取表单数据
		String storeId = request.getParameter("storeId");
		String fl = request.getParameter("foodList");
		String totalNum = request.getParameter("totalNum");
		String totalPrice = request.getParameter("totalPrice");
		String sendAddress = request.getParameter("sendAddress");
		//System.out.println(sendAddress);
		System.out.println(fl);
		
		//解析fl
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
		
		Order order = new Order();
		order.setFoodList(foodList);
		order.setTotalNum(Integer.parseInt(totalNum));
		order.setTotalPrice(Double.parseDouble(totalPrice));
		order.setOrderId(UUIDUtil.getUUID());
		order.setOrderState("已支付");
		order.setSendAddress(sendAddress);
		order.setOrderDate(DateUtil.returnDate());
		HttpSession session = request.getSession(true);
		User user = (User)(session.getAttribute("user"));
		if(user == null) {
			String userId = CookieUtils.getCookieFromCookies(request.getCookies(), "userId").getValue();
			UserService us = new UserServiceImp();
			user = us.findUserByUserId(userId);
			session.setAttribute("user", user);
		}
		order.setUserId(user.getUserId());
		
		//调用逻辑业务
		OrderService os = new OrderServiceImp();
		os.addOrder(order, storeId);
		
		//分发转向
		request.setAttribute("storeId", storeId);
		request.getRequestDispatcher("/customer/ordersuccess.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
