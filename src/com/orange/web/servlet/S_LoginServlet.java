package com.orange.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.domain.Store;
import com.orange.exception.StoreException;
import com.orange.service.StoreService;
import com.orange.service.imp.StoreServiceImp;

/**
 * Servlet implementation class S_LoginServlet
 */
@WebServlet("/sloginServlet")
public class S_LoginServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取表单数据
		String storeName = request.getParameter("storeName");
		String password = request.getParameter("password");
		
		StoreServiceImp us = new StoreServiceImp();
		Store store = null;
		try {
			//调用业务逻辑
			store = us.login(storeName,password);
			//存入cookie
		} catch (StoreException e) {
			e.printStackTrace();
			request.setAttribute("store_msg", e.getMessage());
			request.getRequestDispatcher("/store/store_login.jsp").forward(request, response);
		}

		if(store.getState() == 1) {
			Cookie cookie = new Cookie("storeId", store.getStoreId());
			response.addCookie(cookie);
			request.getSession().setAttribute("store", store);
			
			//分发转向
			request.getRequestDispatcher("/store/index.jsp").forward(request, response);
		} else {
			request.setAttribute("state", "用户未激活，暂时无法登录");
			request.getRequestDispatcher("/store/store_login.jsp").forward(request, response);
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
