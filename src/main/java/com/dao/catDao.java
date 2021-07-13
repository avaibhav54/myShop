package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Category;

public class catDao {

	private SessionFactory factory;

	public catDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public List<Category> getCategories()
	{
	Session sess=this.factory.openSession();
	Query q=sess.createQuery("from Category");
	List<Category>list=q.list();
	return list;
	
	}
	
	
	public Category getCategoryById(int cid)
	{
		Category cat=null;
try {
	

	Session sess=this.factory.openSession();
	cat=sess.get(Category.class, cid);
	sess.close();
	
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
return cat;
	}
}
