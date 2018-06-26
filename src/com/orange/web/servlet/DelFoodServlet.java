package com.orange.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.orange.exception.FoodException;
import com.orange.service.FoodService;
import com.orange.service.imp.FoodServiceImp;

/**
 * Servlet implementation class DelFoodServlet
 */
@WebServlet("/delFoodServlet")
public class DelFoodServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodId = request.getParameter("foodId");
		FoodServiceImp ds = new FoodServiceImp();
		try {
			ds.delFood(foodId);
			request.getRequestDispatcher("/store/food.jsp").forward(request, response);
		} catch (FoodException e) {
			e.printStackTrace();
			request.setAttribute("delfood_msg", e.getMessage());
			request.getRequestDispatcher("/store/food.jsp").forward(request, response);
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
