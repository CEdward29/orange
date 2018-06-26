package com.orange.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orange.domain.StorePageInfo;
import com.orange.service.StoreService;
import com.orange.service.imp.StoreServiceImp;

/**
 * Servlet implementation class ShowStoreInfo
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ShowStoreInfoServlet" })
public class ShowStoreInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowStoreInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//调用业务逻辑
		StorePageInfo spf = new StorePageInfo();
		StoreService ss = new StoreServiceImp();
		String cp = request.getParameter("currentPage");
		int currentPage = 1;
		if(cp != null) {
			currentPage = Integer.parseInt(cp);
		}
		spf.setCurrentPage(currentPage);
		spf.setStoreNum(3);
		spf.setTotalStore(ss.countStores());
		int totalPage = (int) Math.ceil((double)spf.getTotalStore() / (double)spf.getStoreNum());
		spf.setTotalPage(totalPage);
		spf.setStores(ss.findStores(spf));
		
		//分发转向
		request.setAttribute("spf", spf);
		request.getRequestDispatcher("customer/index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
