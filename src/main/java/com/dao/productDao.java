package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.*;

public class productDao {

	private SessionFactory factory;

	public productDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public List<Product> getProducts()
	{
	Session sess=this.factory.openSession();
	Query q=sess.createQuery("from Product");
	List<Product>list=q.list();
	return list;
	
	}
	
	public List<Product>  getProductsById(int id)
	{
		Session sess=this.factory.openSession();
		Query q=sess.createQuery("from Product as p where p.category.catId=:ccid");
		q.setParameter("ccid",id);
		List<Product>list=q.list();
		return list;
	}
	public int getTotalProduct()
	{
		String query="from Product";
		Session session= this.factory.openSession();
		Query q=session.createQuery(query);
		List<Product>ls=q.list();
		return ls.size();
	}
}
