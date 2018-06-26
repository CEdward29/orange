package com.orange.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.domain.Order;
import com.orange.exception.OrderException;
import com.orange.service.OrderService;
import com.orange.service.imp.OrderServiceImp;

/**
 * Servlet implementation class FindOrderByIdServlet
 */
@WebServlet("/findOrderByIdServlet")
public class FindOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId = request.getParameter("orderId");
		OrderServiceImp os = new  OrderServiceImp();
		try {
			Order order = os.findOrderById(orderId);
			request.setAttribute("order", order);
			request.getRequestDispatcher("/store/order.jsp").forward(request, response);
		} catch (OrderException e) {
			request.setAttribute("order_msg", e.getMessage());
			request.getRequestDispatcher("/store/order.jsp").forward(request, response);
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
