package com.orange.web.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.orange.domain.Food;

import com.orange.service.FoodService;
import com.orange.service.imp.FoodServiceImp;

/**
 * Servlet implementation class ModifyFoodServlet
 */
@WebServlet("/modifyFoodServlet")
public class ModifyFoodServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Food food = new Food();
		try {
			
			BeanUtils.populate(food, request.getParameterMap());
			
			FoodServiceImp ds = new FoodServiceImp();
			ds.modifyFood(food);
			response.sendRedirect(request.getContextPath()+"/store/modifyfoodsucc.jsp");
		} catch (Exception e) {
			response.getWriter().write(e.getMessage());
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
