package com.entities;

import java.util.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int catId;
private String catTitle;
private String catDescription;
@OneToMany(mappedBy = "category")
private List<Product>products=new ArrayList<Product>();
public Category()
{
	super();
}
public Category(int catId, String catTitle, String catDescription) {
	super();
	this.catId = catId;
	this.catTitle = catTitle;
	this.catDescription = catDescription;
}
public Category(int catId, String catTitle, String catDescription, List<Product> products) {
	super();
	this.catId = catId;
	this.catTitle = catTitle;
	this.catDescription = catDescription;
	this.products = products;
}



public Category(String catTitle, String catDescription) {
	super();
	this.catTitle = catTitle;
	this.catDescription = catDescription;
}
public List<Product> getProducts() {
	return products;
}

public void setProducts(List<Product> products) {
	this.products = products;
}


public int getCatId() {
	return catId;
}
public void setCatId(int catId) {
	this.catId = catId;
}
public String getCatTitle() {
	return catTitle;
}
public void setCatTitle(String catTitle) {
	this.catTitle = catTitle;
}
public String getCatDescription() {
	return catDescription;
}
public void setCatDescription(String catDescription) {
	this.catDescription = catDescription;
}
@Override
public String toString() {
	return "Category [catId=" + catId + ", catTitle=" + catTitle + ", catDescription=" + catDescription + "]";
}

}
