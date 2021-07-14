package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.User;

public class userDao {
private SessionFactory factory;

public userDao(SessionFactory factory) {
	super();
	this.factory = factory;
}
//get user by email and password

public User getUserByEmail(String mail,String password)
{
	User user=null;
	try {
		String query = "from User where uEmail=:e and  uPassword=: p";
		Session session= this.factory.openSession();
		Query q=session.createQuery(query);
		q.setParameter("e",mail);
		q.setParameter("p",password);
		user=(User) q.uniqueResult();
		session.close();
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return user;
}

public int getTotalUser()
{
	String query="from User";
	Session session= this.factory.openSession();
	Query q=session.createQuery(query);
	List<User>ls=q.list();
	return ls.size();
}
}
