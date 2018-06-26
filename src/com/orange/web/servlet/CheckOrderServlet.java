package com.orange.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orange.dao.imp.StoreDaoImp;
import com.orange.domain.Order;
import com.orange.domain.Store;
import com.orange.exception.OrderException;
import com.orange.service.OrderService;
import com.orange.service.imp.OrderServiceImp;
import com.orange.utils.CookieUtils;

/**
 * Servlet implementation class CheckOrderServlet
 */
@WebServlet("/checkOrderServlet")
public class CheckOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Store store = (Store)session.getAttribute("store");
		if(store == null) {
			String storeId = CookieUtils.getCookieFromCookies(request.getCookies(), "storeId").getValue();
			StoreDaoImp sd = new StoreDaoImp();
			try {
				store = sd.findStoreByStoreId(storeId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("store", store);
		}
		
		String storeId = store.getStoreId();
		OrderServiceImp os = new OrderServiceImp();
		try {
			List<Order> orderList1 = os.findOrderList1(storeId);//通过商家名称查找订单状态为1的所有订单
			request.setAttribute("orderList1", orderList1);
			request.getRequestDispatcher("/store/order_store.jsp").forward(request, response);
		} catch (OrderException e) {
			e.printStackTrace();
			request.setAttribute("orderList1_msg", e.getMessage());
			request.getRequestDispatcher("/store/order_store.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
