package com.orange.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.domain.Food;
import com.orange.domain.Store;
import com.orange.service.FoodService;
import com.orange.service.StoreService;
import com.orange.service.imp.FoodServiceImp;
import com.orange.service.imp.StoreServiceImp;

/**
 * Servlet implementation class ShowFoodInfoServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ShowFoodInfoServlet" })
public class ShowFoodInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFoodInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取参数
		String storeId = request.getParameter("storeId");
		//调用业务逻辑
		StoreService ss = new StoreServiceImp();
		FoodService fs = new FoodServiceImp();
		Store store = ss.findStoreByStoreId(storeId);
		List<Food> food = fs.findFoodByStoreId(storeId);
		store.setFood(food);
		
		//分发转向
		request.setAttribute("store", store);
		request.getRequestDispatcher("customer/shop1.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
