<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	//로그인 중임에도 이 파일을 접근했을때 ....
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}	
	
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");

	Member paramMember = new Member();
	MemberDao memberDao = new MemberDao();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	
	String loginMemberEmail = memberDao.login(paramMember);
	if(loginMemberEmail == null) {
		System.out.println("loginMemberEmail == null");
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	} else {
		session.setAttribute("loginMemberEmail", loginMemberEmail);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>