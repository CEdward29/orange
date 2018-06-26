package com.orange.web.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.orange.domain.Store;
import com.orange.exception.StoreException;
import com.orange.service.StoreService;
import com.orange.service.imp.StoreServiceImp;
import com.orange.utils.DateUtil;
import com.orange.utils.UUIDUtil;


@WebServlet("/sregisterServlet")
public class S_RegisterServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//获取表单数据
		Store store = new Store();
		try {
			BeanUtils.populate(store, request.getParameterMap());
			//调用业务逻辑
			StoreServiceImp usi =  new StoreServiceImp();
			store.setStoreId(UUIDUtil.getUUID());
			store.setRegistime(DateUtil.returnDate());
			store.setState(0);
			usi.regist(store);
			//分发转向
			request.getSession().setAttribute("store", store);
			request.getRequestDispatcher("/store/registsuccess.jsp").forward(request, response);
		}catch(StoreException e) {
			request.setAttribute("store_msg", e.getMessage());
			request.getRequestDispatcher("/store/store_registe.jsp").forward(request, response);
			return;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}


}
