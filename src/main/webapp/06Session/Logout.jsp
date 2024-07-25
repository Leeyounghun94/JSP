<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>LogOut.jsp</title>
</head>
<body>

<%
//방법 1 : 회원인증정보 삭제(세션에 저장된 아이디와 이름 제거)
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//방법 2 : 모든 속성을 한꺼번에 제거.
session.invalidate(); // 세션 자체를 무효화 시킨다.

//속성 삭제 후 페이지 이동
response.sendRedirect("LoginForm.jsp");

%> 


</body>
</html>