<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
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
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
	// 추천 카테고리 이미지 리스트(4개)
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
%>
<body>
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
		</div>

		<div style="text-align:center">
			<!-- 전체카테고리3 / 이미지 배너9 -->
			<div class="row">
				<div class="col-sm-3" style="width:100%">
					<!-- 전체카테고리 --><hr>
					<ul class="nav flex-column">
						<%
							for (Category c : categoryList1) {
						%>
						<li class="nav-item">
						<a class="nav-link btn btn-outline-dark" href=""><%=c.getCategoryName()%></a><hr>
						</li>
						<%
							}
						%>
					</ul>
				</div>
				<div class="col-sm-9">
					<img style="width:100%" src="<%=request.getContextPath()%>/images/b1.png">
				</div>
			</div>
		</div>
		<%
			Calendar today = Calendar.getInstance(); // 날짜
		%>
		<!-- 카테고리별 추천상품 --><hr>
		<div style="text-align:center;">
			<h3>
				오늘의 추천 상품<span class="badge badge-primary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%></span>
			</h3>
		</div>
		<!-- 추천 카테고리 이미지 링크 -->
		<div style="text-align:center">
			<%
				for (Category c : categoryList2) {
			%>
			<a href="" style="text-align:center; vertical-align:middle">
			<img src="<%=request.getContextPath()%>/images/<%=c.getCategoryPic()%>" class="rounded-circle" width="250" height="250">
			</a>
			<%
				}
			%>
		</div><hr><br>
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductList();
		%>
		<!-- 상품 목록 -->
		<div style="text-align:center">
			<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryName=all" class="btn btn-outline-dark">전체 카테고리</a>
		</div><br>
		<div>
		<table>
			<tr>
				<%
					int i = 0;
					for (Product p : productList) {
						i++;
				%>
				<td style="text-align:center; width:400px">
					<div class="card">
						<img class="card-img-top" src="/mall/images/<%=p.getProductPic() %>">
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
		</div><hr>
		<!-- 최근 공지 -->
		<%
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table table-bordered table-hover">
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
							<td style="width:150px;"><%=n.getNoticeId() %></td>
							<td><a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle() %></a></td>
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