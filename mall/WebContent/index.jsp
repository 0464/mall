<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
	// 전체 카테고리 이름 리스트
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	// 추천 카테고리 이미지 리스트(4개)
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
%>
<body>
	<div class="container">
		<div>
			<!-- 최상단 검색바 -->
			<div class="row">
				<div class="col" style="text-align:left;">Goodee Shop</div>
				<div class="col" style="text-align:center;">
					<form class="btn">
						<input type="text">
						<button type="submit">검색</button>
					</form>
				</div>
				<div class="col" style="text-align:right;">
					<i class='fas fa-user-alt' style='font-size: 30px'></i>
					<i class='fas fa-shopping-cart' style='font-size: 30px'></i>
				</div>
			</div>
		</div>

		<div>
			<!-- 로그인/회원가입 메뉴바 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<%
				if(session.getAttribute("loginMemberEmail") == null) {
			%>
				<!-- 로그아웃 상태 -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/signup.jsp">회원가입</a></li>
				</ul>
				<%
				} else {
				%>
				<!-- 로그인 상태 -->
				<ul class="navbar-nav">
					<li class="nav-item"><div class="nav-link"><%=session.getAttribute("loginMemberEmail")%>님 반갑습니다.</div></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/logoutAction.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="">회원정보</a></li>
				</ul>
			</nav>
			<%
				}
			%>
		</div>

		<div>
			<!-- 전체카테고리3 / 이미지 배너9 -->
			<div class="row">
				<div class="col-sm-3">
					<!-- 전체카테고리 -->
					<div class="btn-group-vertical">
						<%
							for (Category c : categoryList1) {
						%>
						<a href="" class="btn btn-outline-dark" style="width:250px;"><%=c.getCategoryName()%></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-9">
					<img src="<%=request.getContextPath()%>/images/b1.png">
				</div>
			</div>
		</div>

		<!-- 추천 카테고리 이미지 링크 -->
		<div style="text-align:center">
			<%
				for (Category c : categoryList2) {
			%>
			<a href="" style="text-align:center; vertical-align:middle"> <img
				src="<%=request.getContextPath()%>/images/<%=c.getCategoryPic()%>"
				class="rounded-circle" width="250" height="250">
			</a>
			<%
				}
			%>
		</div><br>
		<%
			Calendar today = Calendar.getInstance(); // 날짜
		%>
		<!-- 카테고리별 추천상품 -->
		<div style="text-align:center;">
			<h3 style="text-align:center; vertical-align:middle">
				오늘의 추천 상품<span class="badge badge-primary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%></span>
			</h3>
			<div style="font-align:center">
				<%
					for (Category c : categoryList1) {
				%>
				<a href="" class="btn"><%=c.getCategoryName()%></a>
				<%
					}
				%>
			</div>
		</div>
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductList();
		%>
		<!-- 상품 목록 6 -->
		<div>
		<table>
			<tr>
				<%
					int i = 0;
					for (Product p : productList) {
						i++;
				%>
				<td style="text-align:center;">
					<div class="card" style="width:350px;">
						<img class="card-img-top" src="/mall-admin/image/<%=p.getProductPic() %>">
						<div class="card-body">
							<h4 class="card-title">
							<a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId() %>" ><%=p.getProductName() %></a>
							</h4>
							<p class="card-text"><%=p.getProductPrice() %></p>
						</div>
					</div>
				</td>
				<%
						if(i%3==0) {
				%>
							</tr><tr>
				<%	
						}
					}
				%>
			</tr>
		</table>
		</div>
		<!-- 최근 공지 -->
		<%
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(Notice n : noticeList) {
				%>
						<tr>
							<td style="width:200px;"><%=n.getNoticeId() %></td>
							<td style="width:800px;"><a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle() %></a></td>
						</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>