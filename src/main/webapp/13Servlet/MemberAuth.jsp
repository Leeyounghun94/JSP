<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>MemberAuth.jsp : 서블릿용 로그인 처리 </title></head>
<body>

	<h2> MVC 패턴으로 회원 인증하기 </h2>
	<p>
	<strong>${ authMessage }</strong>	<!-- req로 넘어온 값 처리. -->
	
	<br>	
	<a href="./MemberAuth?id=kkk&pass=1234">관리자 인증</a>	
	<br>	
	<a href="./MemberAuth?id=jjj&pass=jjjj">비회원 인증</a>	
	<br>	
	<a href="./MemberAuth?id=kkw&pass=1234">회원 인증</a>



</body>
</html>