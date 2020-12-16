<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>signup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberEmail").val() == "") { // form validation checking
				alert("이메일 확인");
				return;
			} else if ($("#memberPw").val() == "") {
				alert("pw 확인");
				return;
			} else if ($("#memberName").val() == "") {
				alert("이름 확인");
				return;
			}
			$("#signupForm").submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp" id="signupForm">
			<div class="form-group">
				<label>member_email</label>
				<input class="form-control" type="text" name="memberEmail" id="memberEmail">
				<label>member_pw</label>
				<input class="form-control" type="password" name="memberPw" id="memberPw">
				<label>member_name</label>
				<input class="form-control" type="text" name="memberName" id="memberName">
			</div>
			<button class="btn btn-outline-dark" type="button" id="btn">회원가입</button>
			<button class="btn btn-outline-dark" type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
		</form>
	</div>
</body>
</html>