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
</head>
<body class="container">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>member_email</th>
				<th>member_name</th>
				<th>member_date</th>
			</tr>
		</thead>
		<tbody>
			<%
				request.setCharacterEncoding("UTF-8");
				String memberEmail = request.getParameter("loginMemberEmail");
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> myList = memberDao.memberMyList(memberEmail);

				for (Member m : myList) {
			%>
			<tr>
				<td><%=m.getMemberEmail()%></td>
				<td><%=m.getMemberName()%></td>
				<td><%=m.getMemberDate()%></td>
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