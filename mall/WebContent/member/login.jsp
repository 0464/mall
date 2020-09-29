<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<body>
<%
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<div class="container">
	<h1>�α���</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp">
		<table class="table table-bordered">
			<tr>
				<td>member_email</td>
				<td><input type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
		</table>
		<button type="submit">�α���</button>
	</form>
</div>
</body>
</html>