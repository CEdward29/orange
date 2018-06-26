package com.orange.web.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orange.domain.Food;
import com.orange.exception.FoodException;
import com.orange.service.FoodService;
import com.orange.service.imp.FoodServiceImp;
import com.orange.domain.Store;


/**
 * Servlet implementation class FindFoodByManyConditionServlet
 */
@WebServlet("/findFoodByManyConditionServlet")
public class FindFoodByManyConditionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//获取表单数据
		String foodName = request.getParameter("foodName");
		HttpSession session = request.getSession();
		Store store = (Store)session.getAttribute("store");
		String storeId = store.getStoreId();
		
		FoodServiceImp ds = new FoodServiceImp();
		try {
			Food food = ds.findFoodByFoodname(foodName,storeId);
			request.setAttribute("food", food);
			request.getRequestDispatcher("/store/food_list.jsp").forward(request, response);
		} catch (FoodException e) {
			e.printStackTrace();
			request.setAttribute("food_msg", e.getMessage());
			request.getRequestDispatcher("/store/food_list.jsp").forward(request, response);
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
