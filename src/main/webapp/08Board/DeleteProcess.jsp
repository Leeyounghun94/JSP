<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num");	//삭제할 번호
	
	BoardDTO boardDTO = new BoardDTO(); //빈 객체 생성
	BoardDAO boardDAO = new BoardDAO(application);	//1,2단계	
	boardDTO = boardDAO.selectView(num);	// 번호로 객체를 가져와 DTO에 넣는다.
	
	String sessionId = session.getAttribute("UserId").toString(); //로그인 이름 가져왓
	
	int delResult = 0; //삭제 성공 여부 판단 : 성공=1, 실패=0
	
	if(sessionId.equals(boardDTO.getId())) {// 로그인한 사용자 이름 일치
		//작성자 본인이면 삭제
		boardDTO.setNum(num);
		delResult = boardDAO.deletePost(boardDTO); // 객체를 넣어서 삭제하고 int로 받음 -> 3,4단계
		boardDAO.close(); // 5단계
		
		if(delResult == 1) {//삭제 성공
			JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
			
		}else {//삭제 실패
			JSFunction.alertBack("삭제 실패, 뒤로 갑니다.", out);
			return;
		}
		
		}else {	//본인이 아니면 삭제가 안됨.
			JSFunction.alertBack("본인만 삭제가 가능합니다, 뒤로 갑니다.", out);
		return;
		
	}
%>
