<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>signup</title>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form>
			<table class="table table-bordered">
				<tr>
					<td>member_email</td>
					<td><input type="text" name="memberEmail"></td>
				</tr>
				<tr>
					<td>member_pw</td>
					<td><input type="password" name="memberPw"></td>
				</tr>
				<tr>
					<td>member_name</td>
					<td><input type="text" name="memberName"></td>
				</tr>
			</table>
			<button type="submit">회원가입</button>
		</form>
	</div>
</body>
</html>