<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrdersList</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container">
	<h1>주문 목록</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>orders_state</th>
				<th>orders_date</th>
			</tr>
		</thead>
		<tbody>
			<%
				request.setCharacterEncoding("UTF-8");
				String memberEmail = request.getParameter("loginMemberEmail");
				OrdersDao ordersDao = new OrdersDao();
				ArrayList<OrdersAndProduct> ordersList = ordersDao.selectOrdersList(memberEmail);

				for (OrdersAndProduct oap : ordersList) {
			%>
			<tr>
				<td><%=oap.orders.getOrdersId()%></td>
				<td><%=oap.product.getProductName()%></td>
				<td><%=oap.orders.getOrdersAmount()%></td>
				<td><%=oap.orders.getOrdersPrice()%></td>
				<td><%=oap.orders.getMemberEmail()%></td>
				<td><%=oap.orders.getOrdersAddr()%></td>
				<td><%=oap.orders.getOrdersState()%></td>
				<td><%=oap.orders.getOrdersDate()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<form method="post" action="/mall/index.jsp">
		<button class="btn btn-outline-dark" type="submit">돌아가기</button>
	</form>
</body>
</html>