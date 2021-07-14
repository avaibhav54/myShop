
<%@page import="com.dao.productDao"%>
<%@page import="com.dao.userDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.catDao"%>
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getuType().equals("normal")) {

		session.setAttribute("message", "You don't have access to this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/common.jsp"%>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="container   admin">
	<div class="container-fluid">
	<%@include file="components/messagesuccess.jsp" %>
	</div>
		<div class="row   mt-3">
<%
userDao ud=new userDao(FactoryProvider.getFactory());
catDao cd=new catDao(FactoryProvider.getFactory());
productDao pd=new productDao(FactoryProvider.getFactory());
%>
			<!-- first column show users -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body  text-center">
					<div class="container">
					<img style="max-width:115px" class="  rounded-circle img-fluid"     alt="" src="img/programmer.png">
					</div>
					<h1><%=ud.getTotalUser() %></h1>
						<h1>Users</h1>

					</div>
				</div>
			</div>
			
			<!-- Second column -->
			
			<div class="col-md-4">

				<div class="card   ">
					<div class="card-body  text-center" >
					<div class="container">
					<img style="max-width:115px" class="img-fluid"     alt="" src="img/list.png">
					</div>
					<h1><%=cd.getTotalCategories() %></h1>
						<h1>Categories</h1>

					</div>
				</div>
				</div>
				
				<!-- third column -->
				
				<div class="col-md-4">

					<div class="card   ">
						<div class="card-body  text-center">
						<div class="container">
					<img style="max-width:115px" class="img-fluid"     alt="" src="img/delivery-box.png">
					</div>
					<h1><%=pd.getTotalProduct() %></h1>
						
							<h1>Products</h1>

						</div>
					</div>
				</div>

			</div>
			
					<div class="row   mt-3">

			<!-- first column show users -->
			<div class="col-md-6">
				<div class="card   "  data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body  text-center">
					<div class="container">
					<img style="max-width:115px" class="  rounded-circle img-fluid"     alt="" src="img/plus.png">
					</div>
						<h1>Add Category</h1>

					</div>
				</div>
			</div>
			
			<!-- Second column -->
			
			<div class="col-md-6">

				<div class="card"   data-toggle="modal"  data-target="#add-product-modal">
					<div class="card-body  text-center" >
					<div class="container">
					<img style="max-width:115px" class="img-fluid"     alt="" src="img/plus.png">
					</div>
						<h1>Add Product</h1>

					</div>
				</div>
				</div>
		

			</div>
			
			</div>
			
			
			<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header   custoom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="addCategory">
        <div class="form-group">
        <input required  type="text"   class="form-control"  name="cTitle"  placeholder="Enter Category Title">
        
        </div>
        <div class="form-group">
        <textarea class="form-control"    style="height:250px;"" name="cDescription" placeholder="Enter description" rows="" cols=""></textarea>
        </div>
        <div class="container  text-center  ">
        <button class="btn btn-outline-success  custoom-bg   text-white">Add Category</button>
        </div>
        </form>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>



<!-- add product modal -->


<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header   custoom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="addProduct"   method="post" enctype='multipart/form-data'>
        <div class="form-group">
        <input required  type="text"   class="form-control"  name="pName"  placeholder="Enter Product Name">
        </div>
        
        <div class="form-group">
        <textarea class="form-control"    style="height:250px;"" name="pDescription" placeholder="Enter description" rows="" cols=""></textarea>
        </div>
        
          <div class="form-group">
        <input required  type="number"   class="form-control"  name="pPrice"  placeholder="Enter Product Price">
        </div>
          <div class="form-group">
        <input required  type="number"   class="form-control"  name="pQuantity"  placeholder="Enter Product Quantity">
        </div>
          <div class="form-group">
        <input required  type="number"   class="form-control"  name="pDiscount"  placeholder="Enter Product Discount  (in Percentage)" >
        </div>
        
        <div class="form-group">
                  <%
          List<Category> list=cd.getCategories();
          
          %>
        
        <select  name="cId"   class="form-control"   id="">
        <option  selected  disabled>Select Category</option>
        <% 
        for(Category ct:list)
        {
        	%>
        	
        	<option value="<%=ct.getCatId() %>"><%=ct.getCatTitle() %></option>
        	<% 
        	
        	        }
        %>
        
                </select>
        </div>
          <div class="form-group">
          

          
          <label>Select Product Picture</label>
        <input   type="file"   class="form-control"  name="pPic">
        
        </div>
        
        
        <div class="container  text-center  ">
        <button class="btn btn-outline-success  custoom-bg   text-white">Add Product</button>
        </div>
        </form>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>

	<%@include file="components/modal.jsp"%>
</body>
</html>