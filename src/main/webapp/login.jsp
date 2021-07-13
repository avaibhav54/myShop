<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<%@include file="components/common.jsp" %>

</head>
<body>

<%@include file="navbar.jsp" %>

	<div class="row  mt-5">
		<div class="col-md-4  offset-md-4 ">
		<div class="card">
		
			<div class="card-header  custoom-bg  text-white text-center">	
			<span class="fa fa-user-plus fa-3x  center">
							
							</span>
							
		<h3 class=" my-3">Login Here!!</h3>
							</div>
		<div class="card-body   px-5"  >
<%@include file="components/message.jsp" %>
			<form id="reg-form" action="login"  method="post">
			
				<div class="form-group">
					<label for="email">User Email</label> <input name="mail" type="email"
						class="form-control" id="email" aria-describedby="emailHelp"
						placeholder="Enter  here">
				</div>
				<div class="form-group">
					<label for="password">User Password</label> <input name="password"  type="password"
						class="form-control" id="password" aria-describedby="emailHelp"
						placeholder="Enter  here">
				</div>
					
					<a href="register.jsp"  class="text-center d-block mb-2">Go To Signup</a>			
				<div class="container   text-center">
				<button type="submit"  id="submit-btn" class="btn btn-primary  custoom-bg">Submit</button>
				<button type="reset"  id="submit-btn" class="btn btn-primary  custoom-bg">Reset</button>
			
				</div>
			</form>
		</div>
		</div>
		</div>
	</div>
	
	

</body>
</html>