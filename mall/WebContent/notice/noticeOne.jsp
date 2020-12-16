<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container">
	<h1>공지사항</h1>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>notice_title</th>
				<th>notice_content</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<%
				int noticeId = Integer.parseInt(request.getParameter("noticeId"));
				NoticeDao noticeDao = new NoticeDao();
				ArrayList<Notice> noticeList = noticeDao.selectNoticeOne(noticeId);

				for (Notice n : noticeList) {
			%>
			<tr>
				<td><%=n.getNoticeTitle()%></td>
				<td><%=n.getNoticeContent()%></td>
				<td><%=n.getNoticeDate()%></td>
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