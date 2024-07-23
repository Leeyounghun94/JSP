<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>SessionLocation.jsp : 세션값 확인하기. </title>
</head>
<body>
	<%
	
		ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
		
	
		for(String str : lists) {
			out.print(str + "<br>");
		}
	
	
	%>




</body>
</html>