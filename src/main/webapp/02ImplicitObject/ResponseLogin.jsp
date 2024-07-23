<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>ResponseLogin.jsp : 로그인 정보를 파악합니다.</title>
</head>
<body>

<%

	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	if (id.equalsIgnoreCase("kkw") && pw.equalsIgnoreCase("1234")) {
		// 아이디와 패스워드가 맞으면 ?
		response.sendRedirect("./ResponseWelcom.jsp"); // 성공 시 이동하는 페이지ResponseWelcom.jsp <필수 항목>
				
	}else {
		// 아이디와 패스워드가 다르면?
		request.getRequestDispatcher("./ResponseMain.jsp?loginErr=1").forward(request, response);
		// 실패한 메세지를 가지고 돌아가야 함!! 그래서 .forward(request, response) 가지고 돌아가야함. <필수 항목>
	}

%>












</body>
</html>