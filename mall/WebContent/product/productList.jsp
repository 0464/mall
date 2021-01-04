<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	CategoryDao categoryDao = new CategoryDao();
	// 전체 카테고리 이름 리스트
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	
	ProductDao productDao = new ProductDao();
	String categoryName = request.getParameter("categoryName");
	if(categoryName.equals("all")){
		categoryName = "all";
	}
	// 카테고리 별 상품 리스트
	ArrayList<Product> productByCategoryList = productDao.selectProductByCategoryList(categoryName);
%>
<body>
	<!-- 상품 리스트 -->
	<div class="container">
		<div>
			<!-- 로그인/회원가입 메뉴바 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<%
				if(session.getAttribute("loginMemberEmail") == null) {
			%>
				<!-- 로그아웃 상태 -->
				<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Goodee Shop</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/signup.jsp">회원가입</a></li>
				</ul>
				<%
				} else {
				%>
				<!-- 로그인 상태 -->
				<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Goodee Shop</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link disabled"><%=session.getAttribute("loginMemberName")%>님 반갑습니다.</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/memberInfo.jsp?loginMemberEmail=<%=session.getAttribute("loginMemberEmail")%>"><i class='fas fa-user-alt' style='font-size:22px'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/orders/myOrdersList.jsp?loginMemberEmail=<%=session.getAttribute("loginMemberEmail")%>"><i class='fas fa-shopping-cart' style='font-size:22px'></i></a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/logoutAction.jsp">로그아웃</a></li>
				</ul>
			</nav>
			<%
				}
			%>
		</div><br>
		<h1 style="text-align:center">상품 리스트</h1><hr>
		<!-- 상품 목록 -->
		<div style="text-align:center">
			<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryName=all" class="btn btn-outline-dark">전체 카테고리</a>
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
					String soldout = "판매중";
					if (pbcl.getProductSoldout().equals("Y")) {
						soldout = "품절";
					}
			%>
				<tr>
					<td rowspan="3">
						<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=pbcl.getProductId()%>">
						<img width="100%" height="100%" src="/mall/images/<%=pbcl.getProductPic() %>">
						</a>
					</td>
					<td><a><%=pbcl.getProductName()%></a></td>
				</tr>
				<tr>
					<td><%=pbcl.getProductPrice()%></td>
				</tr>
				<tr>
					<td><%=soldout%></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>