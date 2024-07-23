<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>SessionMain.jsp : 세션 영역 유지 확인</title>
</head>
<body>
	<%
	ArrayList<String> arraylist = new ArrayList();
	arraylist.add("엠비씨");
	arraylist.add("아카데미");
	arraylist.add("컴퓨터");
	arraylist.add("교육센터");
	
	session.setAttribute("lists", arraylist); // 리스트 컬렉션으로 객체를 세션에다가 저장.
	
	%>

	<h2> 세션 영역에 리스트 저장 완료 </h2>

	<a href="SessionLocation.jsp">SessionLocation.jsp로 이동</a>

</body>
</html>