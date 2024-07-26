<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 여부 확인 -->
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content"); // Write.jsp에서 넘어온 값
	
	BoardDTO boardDTO = new BoardDTO(); // 빈 객체 생성.
	boardDTO.setTitle(title);
	boardDTO.setContent(content);
	boardDTO.setId(session.getAttribute("UserId").toString()); // 세션영역에 있는 값은 객체이기 때문에 toString으로 문자로 바꿔서 입력해야 한다.
	// 객체의 제목, 내용, 작성자가 보관 완료
	
	// 3, 4단계 적용
	BoardDAO boardDAO = new BoardDAO(application); // 1, 2단계
	int result = boardDAO.insertWrite(boardDTO);	// 3, 4단계
	
	boardDAO.close(); // 5단계
	
	if(result == 1) {
		// insert 결과값이 1이면 성공
		response.sendRedirect("List.jsp"); // 성공 하면 리스트.jsp 로 간다.
	}else {
		//실패
		JSFunction.alertBack("글 저장 실패, 뒤로 갑니다", out);
	}
	


%>