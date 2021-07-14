<%@page import="com.helper.helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.catDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.productDao"%>
<%@page import="com.helper.FactoryProvider"%>
<html>
<head>


<%@include file="components/common.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>


	<div class="row  ">
		<%
		
		String ca=request.getParameter("category");
		List<Product> list=null;
		productDao p = new productDao(FactoryProvider.getFactory());
		if(ca==null || ca.trim().equals("all"))
		{
	
		 list = p.getProducts();
		}
		else
		{
			%>
			<script type="text/javascript">
			console.log(ca);
			$('ca').addClass('custoom-bg text-white');
			</script>
			<%
			int id=Integer.parseInt(ca);
			list=p.getProductsById(id);
		}
		catDao cd = new catDao(FactoryProvider.getFactory());
		List<Category> list2 = cd.getCategories();
		%>
		<div class="col-md-2 ">
			<div class="list-group  mt-4">
 <a id="all"   href="index.jsp?category=all" class="list-group-item list-group-item-action custoom-bg text-white">
    All Categories
  </a>
				<%
				for (Category cat : list2) {
				%>

			  <a id="<%=cat.getCatId() %>"   href="index.jsp?category=<%=cat.getCatId() %>" class="list-group-item list-group-item-action"><%=cat.getCatTitle() %></a>
			
			<%
			}
			%>
		</div>
		</div>

		<div class="col-md-10">
			<div class="row mt-4">
				<div class="col-md-12">
				<div class="card-columns">
						<%
						for (Product pro : list) {
						%>
							<div class="card    product-card"  >
						<div class="container text-center">
							 <img style="max-height:200px; max-width:100%; width:auto;" class="card-img-top  m-2" src="img/products/<%=pro.getpPhoto() %>" alt="Card image cap">
							
						</div>
						<div class="card-body">
							<h5 class="card-title"><%=pro.getpName() %></h5>
							<p class="card-text">
							<%=helper.get10Words(pro.getpDesc()) %>
							</p>
								<%
							int op=pro.getpPrice();
							int dp=pro.getpDiscount();
							int diff=op-(dp*op)/100;
							%>
							</div>
							<div class="card-footer  text-center">
							<button class="btn  custoom-bg text-white"    onclick="add_to_cart(<%=pro.getpId() %>,<%=diff %>,'<%=pro.getpName() %>')" >Add To Cart</button>
						
							<button class="btn  btn-outline-primary">&#8377;<%=diff %>/-  <span class="text-secondary"   style="font-size:10px;"><%=pro.getpPrice()%>/-<%=pro.getpDiscount() %>% off</span></button>
							
							</div>
							</div>

						<%
						}
						
						if(list.size()==0)
						{
						%>
						<h1>No product in this category</h1>
						<%
						}
						%>
					</div>
				</div>
			</div>

		</div>

	</div>


<%@include file="components/modal.jsp" %>
<script type="text/javascript">


</script>
</body>
</html>
