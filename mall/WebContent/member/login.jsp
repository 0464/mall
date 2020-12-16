<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberEmail").val().length<1) { // form validation checking
				alert("이메일 확인");
				return;
			} else if ($("#memberPw").val().length<1) {
				alert("pw 확인");
				return;
			}
			$("#loginForm").submit();
		});
	});
</script>
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
	<h1>로그인</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp" id="loginForm">
		
		<div class="form-group">
			<label>member_email</label>
			<input class="form-control" type="text" name="memberEmail" id="memberEmail">
			<label>member_pw</label>
			<input class="form-control" type="password" name="memberPw" id="memberPw">
		</div>
		<button class="btn btn-outline-dark" type="button" id="btn">로그인</button>
		<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
	</form>
</div>
</body>
</html>