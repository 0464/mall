<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>signup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<form method="post" action="" id="signupForm">
			<table class="table table-bordered">
				<tr>
					<td>member_email</td>
					<td><input type="text" name="memberEmail" id="memberEmail"></td>
				</tr>
				<tr>
					<td>member_pw</td>
					<td><input type="password" name="memberPw" id="memberPw"></td>
				</tr>
				<tr>
					<td>member_name</td>
					<td><input type="text" name="memberName" id="memberName"></td>
				</tr>
			</table>
			<button type="button" id="btn">회원가입</button>
		</form>
	</div>
</body>
</html>