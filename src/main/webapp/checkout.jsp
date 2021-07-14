
<%@page import="com.dao.userDao"%>
<%
User user=(User)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message","You are not logged in ");
	response.sendRedirect("login.jsp");
	return;
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/common.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center  mb-5">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center  mb-5">Your Details for order</h3>
						<form action="">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input value="<%=user.getuEmail() %>"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your Name</label> <input type="text"   value="<%=user.getuName() %>"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter Name">

							</div>	<div class="form-group">
								<label for="name">Your Contact</label> <input type="text"   value="<%=user.getuPhone() %>"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter Contact number">

							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your Shipping
									Address</label>
								<textarea placeholder="Enter your address" class="form-control" id="exampleFormControlTextarea1"
									rows="3"><%=user.getuAddress() %></textarea>
							</div>
							<div class="  text-center container">
							<button class="btn btn-outline-success">Order Now</button>
							
							<button class="btn btn-outline-primary">Continue Shopping</button>
							
							</div>
							
						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

	<%@include file="components/modal.jsp"%>

</body>
</html>