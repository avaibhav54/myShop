package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.catDao;
import com.dao.userDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class addProduct
 */
@MultipartConfig
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		
		String title=request.getParameter("pName");
		String description=request.getParameter("pDescription");
		int price=Integer.parseInt(request.getParameter("pPrice"));
		int discount=Integer.parseInt(request.getParameter("pDiscount"));
		int quantity=Integer.parseInt(request.getParameter("pQuantity"));
		int cid=Integer.parseInt(request.getParameter("cId"));
		catDao cd=new catDao(FactoryProvider.getFactory());
		Category cat=cd.getCategoryById(cid);
		Part pic=request.getPart("pPic");
		Product pro=new Product( title, description, pic.getSubmittedFileName(), price, discount, quantity,cat);
		Session sess=  FactoryProvider.getFactory().openSession();
		Transaction tx=sess.beginTransaction();
sess.save(pro);
		tx.commit();
		sess.close();
		out.println("done");
		HttpSession se=request.getSession();
		se.setAttribute("message","Product Added Successfully");
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
