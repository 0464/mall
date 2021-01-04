<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productOne</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<body>
<%
	// productId 불러오기
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
	String soldout = "판매중";
	if (product.getProductSoldout().equals("Y")) {
		soldout = "품절";
	}
	String hidden = "";
	if (soldout.equals("품절")) {
		hidden = "hidden";
	}
%>
<!-- 상세보기 -->
<div class="container"><br>
	<h1>상품 상세보기</h1><hr>
	<table class="table table-hovor table-bordered">
		<tr>
			<td style="width:250px">product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
		<tr>
			<td>product_pic</td>
			<td><img src="/mall/images/<%=product.getProductPic() %>"></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td><%=soldout %></td>
		</tr>
	</table><hr>
	<form <%=hidden %> method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
		<div class="form-group">
			<input type="hidden" value="<%=product.getProductId() %>" name="productId">
			<input type="hidden" value="<%=product.getProductPrice() %>" name="productPrice">
			<label>수량 : </label>
			<select class="form-control" name="ordersAmount">
			<%
				for(int i=1; i<11; i++) {
			%>
				<option value="<%=i%>"><%=i%></option>
			<%
				}
			%>
			</select>
		</div>
		<div class="form-froup">
			<label>배송주소 : </label>
			<input class="form-control" type="text" name="ordersAddr">
		</div><br>
		<div class="form-group">
			<button class="btn btn-outline-dark" type="submit">주문</button>
		</div>
	</form>
	<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/product/productList.jsp?categoryName=all'">목록으로</button>
	<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
</div>
</body>
</html>