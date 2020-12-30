<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container"><br>
	<h1>회원 정보</h1><hr>
	<%
		request.setCharacterEncoding("UTF-8");
		String memberEmail = request.getParameter("loginMemberEmail");
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> myList = memberDao.memberMyList(memberEmail);
	
		for (Member m : myList) {
	%>
	<div class="form-group">
		<label>member_email</label>
		<input class="form-control" type="text" name="memberEmail" id="memberEmail" value="<%=m.getMemberEmail()%>" readonly="readonly">
	</div>
	<div class="form-group">
		<label>member_name</label>
		<input class="form-control" type="text" name="memberName" id="memberName" value="<%=m.getMemberName()%>" readonly="readonly">
	</div>
	<div class="form-group">
		<label>member_date</label>
		<input class="form-control" type="text" name="memberDate" id="memberDate" value="<%=m.getMemberDate()%>" readonly="readonly">
	</div>
	<%
		}
	%>
	<form method="post" action="/mall/index.jsp">
		<button class="btn btn-outline-dark" type="submit">돌아가기</button>
	</form>
</body>
</html>