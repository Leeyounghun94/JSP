<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>ExeQuery.jsp</title>
</head>
<body>

	<h2> 회원 목록 조회 테스트(executeQuery() 사용)</h2>


	<%
	JDBConnect jdbc = new JDBConnect(); //DB에 연결.
	
		
	String sql = "select id, pass, name, regidate FROM member";
	Statement stmt = jdbc.connection.createStatement(); // 쿼리문 생성.
	
	ResultSet rs = stmt.executeQuery(sql); // 쿼리문 수행
	
	 while ( rs.next()) {
		 String id = rs.getString(1);
		 String pass = rs.getString(2);
		 String name = rs.getString(3);
		 Date regiDate = rs.getDate("regidate");
		 
		 out.println(String.format("%s %s %s %s", id, pass, name, regiDate) + "<br/>");
	 } //ResultSet에 있는 데이터를 한줄 씩 가져와서 출력하고 줄 바꿈
	jdbc.close();
	%>
	
</body>
</html>