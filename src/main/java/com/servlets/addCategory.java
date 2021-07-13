package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Category;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class addCategory
 */
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		
		String title=request.getParameter("cTitle");
		String description=request.getParameter("cDescription");
		Category cat=new Category(title, description);

		Session sess=  FactoryProvider.getFactory().openSession();
		Transaction tx=sess.beginTransaction();
sess.save(cat);
		tx.commit();
		sess.close();
		out.println("done");
		HttpSession se=request.getSession();
		se.setAttribute("message","Category Added Successfully");
		response.sendRedirect("admin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
