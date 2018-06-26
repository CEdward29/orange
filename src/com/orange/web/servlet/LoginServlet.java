package com.orange.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.orange.domain.User;
import com.orange.exception.UserException;
import com.orange.service.UserService;
import com.orange.service.imp.UserServiceImp;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		System.out.println(user.getUsername());
		UserService us = new UserServiceImp();
		User u = null;
		try {
			u = us.login(user);
			//System.out.println(111);
		} catch (UserException e) {
			e.printStackTrace();
		}
		if(u == null) { 
			System.out.println("登录失败");
		}
		//存入cookie
		//System.out.println(u);
		if(u.getRole() == 1) {
			
			Cookie cookie = new Cookie("userId", u.getUserId());
			response.addCookie(cookie);
		
			request.getSession(true).setAttribute("user", u);
			request.getRequestDispatcher("/ShowStoreInfoServlet").forward(request, response);
		} else {
			
			Cookie cookie = new Cookie("adminId", u.getUserId());
			response.addCookie(cookie);
			
			request.getSession(true).setAttribute("admin", u);
			request.getRequestDispatcher("governor/g_index.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
