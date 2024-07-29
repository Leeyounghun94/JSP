<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String num = request.getParameter("num"); //제목을 클릭했을 때 넘어오는 번호
BoardDAO boardDAO = new BoardDAO(application); //1, 2단계 
boardDAO.updateVisitCount(num); //조회수 증가 3, 4단계
BoardDTO boardDTO = boardDAO.selectView(num); //번호를 이용해서 객체가 넘어온다.
boardDAO.close(); //5단계
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp : 제목 클릭 시 상세보기 페이지</title>
</head>
<body>

	<jsp:include page="../Common/Link.jsp" />
	<!-- 메뉴 출력용 -->

	<h2>회원제 게시판 - 상세 보기 페이지</h2>
	
	<script type="text/javascript"> /* 삭제 판단 */
		function deletePost() {// 하단의 삭제 버튼 클릭 시 동작
			var confirmd = confirm("정말로 삭제하시겠습니까 ?"); //Yes, NO를 누를수 있음(Yes(true), NO(false)
			
			if(confirmd) {// confirm 창에서 true
				var form = document.writeFrm;	// 밑에 있는 form객체(writeFrm)를 변수에 넣음
				form.method = "post";
				form.action = "DeleteProcess.jsp";
				form.submit();
			}
			
	}
	
	</script>
	
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<!-- hidden 처리 : 다른 페이지로 전달할 수 있는 값 -->
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%=boardDTO.getNum()%></td>
				<td>작성자</td>
				<td><%=boardDTO.getName()%></td>
			</tr>

			<tr>
				<td>작성일</td>
				<td><%=boardDTO.getPostdate()%></td>
				<td>조회수</td>
				<td><%=boardDTO.getVisitcount()%></td>
			</tr>

			<tr>
				<td>제목</td>
				<td colspan="3"><%=boardDTO.getTitle()%></td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%=boardDTO.getContent().replace("\r\n", "<br>")%>
					<!-- 엔터 처리 --></td>
			</tr>

			<tr>

				<td colspan="4" align="center">
					<!-- 수정, 삭제 버튼은 로그인 상태 + 작성자 일치 --> 
					<%
 						if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(boardDTO.getId())) {
 					%>
					<button type="button"
						onclick="location.href='Edit.jsp?num=<%=boardDTO.getNum()%>';">
						수정</button>

					<button type="button" onclick="deletePost();">삭제</button> 
					<%
 						} // 여기까지 if 괄호(닫음)
 					%>

					<button type="button" onclick="location.href='List.jsp';">
						목록</button>
				</td>
				<!-- 수정, 삭제, 리스트 버튼 -->
			</tr>

		</table>

	</form>

</body>
</html>