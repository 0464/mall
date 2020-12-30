<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container"><br>
	<h1>공지사항</h1><hr>
	<%
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeOne(noticeId);

		for (Notice n : noticeList) {
	%>
	<div class="form-group">
		<label>notice_title</label>
		<input class="form-control" type="text" name="noticeTitle" id="noticeTitle" value="<%=n.getNoticeTitle()%>" readonly="readonly">
	</div>
	<div class="form-group">
		<label>notice_content</label>
		<textarea class="form-control" cols="5" rows="10" name="noticeContent" id="noticeContent" readonly="readonly"><%=n.getNoticeContent()%></textarea>
	</div>
	<div class="form-group">
		<label>notice_date</label>
		<input class="form-control" type="text" name="noticeDate" id="noticeDate" value="<%=n.getNoticeDate()%>" readonly="readonly">
	</div>
	<%
		}
	%>
	<form method="post" action="/mall/index.jsp">
		<button class="btn btn-outline-dark" type="submit">돌아가기</button>
	</form>
</body>
</html>