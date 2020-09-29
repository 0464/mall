<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container">
	<table class="table table-bordered">
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
</body>
</html>