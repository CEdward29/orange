package com.orange.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.service.StoreService;
import com.orange.service.imp.StoreServiceImp;

/**
 * Servlet implementation class ChangeStoreStateServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ChangeStoreStateServlet" })
public class ChangeStoreStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStoreStateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String storeId = request.getParameter("storeId");
		
		StoreService ss = new StoreServiceImp();
		ss.getThroughStore();
		
		request.getRequestDispatcher("ShowBackStageStoreInfo").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
