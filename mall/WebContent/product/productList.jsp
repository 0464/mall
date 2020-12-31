<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	CategoryDao categoryDao = new CategoryDao();
	// 전체 카테고리 이름 리스트
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	
	ProductDao productDao = new ProductDao();
	String categoryName = "all";
	// 카테고리 별 상품 리스트
	ArrayList<Product> productByCategoryList = productDao.selectProductByCategoryList(categoryName);
%>
<body>
	<!-- 상품 리스트 -->
	<div class="container"><br>
		<h1>상품 리스트</h1><hr>
		<%
			
		%>
		<!-- 상품 목록 -->
		<div style="text-align:center">
			<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryName=<%=categoryName %>" class="btn btn-outline-dark">전체 카테고리</a>
			<%
				for (Category c : categoryList) {
			%>
			<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryName=<%=c.getCategoryName()%>" class="btn btn-outline-dark"><%=c.getCategoryName()%></a>
			<%
				}
			%>
		</div><br>
		<table class="table table-bordered table-hovor">
			<%
				for (Product pbcl : productByCategoryList) {
			%>
				<tr>
					<td rowspan="3">
						<a href="<%=request.getContextPath()%>/product/productOne.jsp?<%=pbcl.getProductId()%>">
						<img width="100%" height="100%" src="<%=request.getContextPath()%>/image/<%=pbcl.getProductPic()%>">
						</a>
					</td>
					<td><a><%=pbcl.getProductName()%></a></td>
				</tr>
				<tr>
					<td><%=pbcl.getProductPrice()%></td>
				</tr>
				<tr>
					<td><%=pbcl.getProductSoldout()%></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>