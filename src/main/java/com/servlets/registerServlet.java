package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class registerServlet
 */
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
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
		
		
		String name=request.getParameter("name");
		String mail=request.getParameter("mail");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		User user=new User(name, password, mail, phone, "default.jpg", address,"normal");
		
		Session sess=  FactoryProvider.getFactory().openSession();
		Transaction tx=sess.beginTransaction();
		int uid=(Integer) sess.save(user);
		tx.commit();
		sess.close();
		out.println("done");

		
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
