<%@page import="utills.CookieManager"%>
<%@page import="utills.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String save_check = request.getParameter("save_check");
    
    if("kkw".equals(user_id) && "1234".equals(user_pw)) { //id와 pw가 같으면
    	if(save_check !=null && save_check.equals("Y")) {
    		//아이디 저장하기 체크이면 !!
    		CookieManager.makeCookie(response, "loginID", user_id, 86400);
    		//쿠키 생성(24시간 동안 유지(86400))
    	}else{
    		//아이디 저장하기가 체크가 아니면 !!
    		CookieManager.deleteCookie(response, "loginID");
    	}
    	
    	JSFunction.alertLocation("로그인 성공!", "IdSaveMain.jsp", out);
    
    }else {
    	//아이디와 패스워드가 다르면
    	JSFunction.alertBack("로그인 실패-ID와 PW가 다릅니다.", out);
    }
 
    %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>IdSaveProcess.jsp : 로그인 처리 (성공과 실패 + 쿠키 + Alert)</title>
</head>
<body>

</body>
</html>