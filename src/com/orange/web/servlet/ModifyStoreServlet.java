package com.orange.web.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.orange.domain.Store;

import com.orange.service.StoreService;
import com.orange.service.imp.StoreServiceImp;

/**
 * Servlet implementation class ModifySUserServlet
 */
@WebServlet("/modifySUserServlet")
public class ModifyStoreServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取表单数据
		Store store = new Store();
			
			try {
				BeanUtils.populate(store, request.getParameterMap());
				//调用业务逻辑
				StoreServiceImp sus = new StoreServiceImp();
				sus.modifySUser(store);
				
				//分发转向
				request.getSession().invalidate();//相当于注销
				response.sendRedirect(request.getContextPath()+"/store/modifysuccess.jsp");
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
