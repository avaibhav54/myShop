package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.dao.userDao;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		response.setContentType("text/html");
		try {
		PrintWriter out=response.getWriter();
			
			
			String mail=request.getParameter("mail");
			
			String password=request.getParameter("password");
	
			 userDao d=new userDao(FactoryProvider.getFactory());
			 User user=d.getUserByEmail(mail, password);
			 
			 HttpSession session=request.getSession();
		if(user==null)
		{
			session.setAttribute("message","Invalid email or Password!!");
			response.sendRedirect("login.jsp");
			return;
		}
		else
		{
			
			//admin.jsp
			//normal.jsp
			
			session.setAttribute("current-user",user);
			if(user.getuType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			else
			{
				response.sendRedirect("normal.jsp");
			}
			
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
