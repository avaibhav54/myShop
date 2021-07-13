<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<%@include file="components/common.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="row  mt-5">
		<div class="col-md-4  offset-md-4 ">
		<div class="card">
		<div class="card-body   px-5"  >
	<div class="text-center">	
			<span class="fa fa-user-plus fa-3x  center">
							
							</span>
							</div>
		<h3 class="text-center my-3">Signup Here!!</h3>
			<form id="reg-form" action="registerServlet"  method="post">
				<div class="form-group">
					<label for="name">User Name</label> <input name="name" type="text"
						class="form-control" id="name" aria-describedby="emailHelp"
						placeholder="Enter  here">
				</div>
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
				<div class="form-group">
					<label for="phone">User Phone</label> <input name="phone" type="number"
						class="form-control" id="phone" aria-describedby="emailHelp"
						placeholder="Enter  here">
				</div>
				
								<div class="form-group"  >
							<label for="address">User Address</label>
								<textarea name="address" placeholder ="	Enter  your Address" class="form-control"   style="height:200px;" ></textarea>
					<div  id="loader"  style="display:none;" "class="container  text-center">
								<span class="fa fa-refresh   fa-spin  fa-4x">
								
								</span>
								<h1>please wait</h1>
								<p id="msg"></p>
								</div>
								
				<div class="container   text-center">
				<button id="submit-btn" class="btn btn-outline-success">Register</button>
				<button class="btn btn-outline-warning">Reset</button>
				
				</div>
			</form>
		</div>
		</div>
		</div>
	</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			console.log("page is ready");
			
			$("#reg-form").on('submit',function(event){
				
				event.preventDefault();
			//	var f=$(this).serialize();
			let f=new FormData(this);
				console.log(f);
				$("#submit-btn").hide();
				$("#loader").show();
				
				
var ty="registerServlet";
				$.ajax({
					url :ty,
					data:f,
					type:'POST',
					success:  function(data,textStatus,jqXHR){
						console.log(data);
						console.log("success.......................");
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()==='done')
						{
							swal("Successfully Registered!", "!", "success").then((value)=>
							{
								window.location="login.jsp"
							});
						
						}
					else
						{
						swal(data);

						}
					},
				error:     function(jqXHR,textStatus,errorThrown){
					console.log(data);
					console.log("error.......................");
					$("#submit-btn").show();
					$("#loader").hide();
					swal("error!!!!", "!", "fail");

				},
				processData:false,
				contentType:false,
				})
			})
		})
	</script>
</body>
</html>