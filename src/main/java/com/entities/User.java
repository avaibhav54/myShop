package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int userId;
private String uName;
private String uPassword;
private String uEmail;
private String uPhone;
private String uPic;
@Column(length = 1500)
private String uAddress;
private String uType;

public String getuType() {
	return uType;
}
public void setuType(String uType) {
	this.uType = uType;
}
public User(int userId, String uName, String uPassword, String uEmail, String uPhone, String uPic, String uAddress) {
	super();
	this.userId = userId;
	this.uName = uName;
	this.uPassword = uPassword;
	this.uEmail = uEmail;
	this.uPhone = uPhone;
	this.uPic = uPic;
	this.uAddress = uAddress;
}
public User(String uName, String uPassword, String uEmail, String uPhone, String uPic, String uAddress,String uType) {
	super();
	this.uName = uName;
	this.uPassword = uPassword;
	this.uEmail = uEmail;
	this.uPhone = uPhone;
	this.uPic = uPic;
	this.uAddress = uAddress;
	this.uType=uType;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getuName() {
	return uName;
}
public void setuName(String uName) {
	this.uName = uName;
}
public String getuPassword() {
	return uPassword;
}
public void setuPassword(String uPassword) {
	this.uPassword = uPassword;
}
public String getuEmail() {
	return uEmail;
}
public void setuEmail(String uEmail) {
	this.uEmail = uEmail;
}
public String getuPhone() {
	return uPhone;
}
public void setuPhone(String uPhone) {
	this.uPhone = uPhone;
}
public String getuPic() {
	return uPic;
}
public void setuPic(String uPic) {
	this.uPic = uPic;
}
public String getuAddress() {
	return uAddress;
}
public void setuAddress(String uAddress) {
	this.uAddress = uAddress;
}
public User() {
	super();
}

}
