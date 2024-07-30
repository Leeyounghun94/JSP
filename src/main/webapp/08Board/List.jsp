<%@page import="utills.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO boardDAO = new BoardDAO(application);//1단계, 2단계 완료
//검색 조건에 대한 변수 선언 -> MAP<String, Object>
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null) {//검색어가 있으면 ?
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

//1단계
int totalCount = boardDAO.selectCount(param); // 검색 조건을 파라미터로 dao로 넘어가고 게시물 수를 int로 받음.

	// 전체 페이지 수 계산
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	//현재 페이지에 보여줄 리스트 개수 10
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	//한 화면에 보여줄 블럭수 5
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);
	//총 페이지 수 =  11  <- 올림  <- 10.5  <- (105	/ 10)		-> 3단계
	
	//현재 페이지용코드
	int pageNum = 1; // 무조건 처음 페이지는 1
	String pageTemp = request.getParameter("pageNum"); // List.jsp?pageNum=1
	if(pageTemp != null && !pageTemp.equals("")) {//url로 넘어온 값이 있으면
		pageNum = Integer.parseInt(pageTemp);	//요청 받은 페이지로 적용
	}	
		
	
	//목록에 출력할 게시물 범위 계산
	int start = (pageNum - 1) * pageSize + 1; //첫 게시물 번호(11)
	// 11 = (2 - 1 ) * 10 + 1
	int end = pageNum * pageSize ; 	//마지막 게시물 번호 (20)
	// 20 = 2 * 10
	
	param.put("start", start);	//map을 통해 검색 조건과 같은 타입으로 전달이 된다.
	param.put("end", end);	//map을 통해 검색 조건과 같은 타입으로 전달이 된다.	
	//param -> searchField, searchWord, start, end 가 전달 된다.
		
	List<BoardDTO> boardLists = boardDAO.selectList(param);//검색 조건을 파라미터로 dao로 넘어가고 결과는 list로 받음.
	boardDAO.close(); //5단계 종료
	
%>

<!DOCTYPE html><html><head><meta charset="UTF-8"><title>List.jsp : BoardDTO와 BoardDAO 활용한 리스트 출력 + 검색 </title>
</head>
<body>

		<jsp:include page="../Common/Link.jsp"/> <!-- 상단 메뉴용(반복) --> 
		<!-- 검색폼 -->
		
		
		<h2 align="center"> 회원제 게시판 - 목록 보기(List.jsp) </h2>
		
		<form method="get">
			<table border="1" width="90%">
				<tr> <!-- 1줄 -->
					<td align="center">	<!--  1칸 : 가운데 정렬  -->
						<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="id">ID</option>
						</select> <!-- 검색 필드 설정  -->
						
						<input type="text" name="searchWord" /> <!-- 검색 단어 -->
						<input type="submit" value="검색하기"/>	<!-- 버튼 -->
				</tr>
			</table>			
		</form>
		<!-- boardList method 활용 -->
		<table border="1" width="90%">
			<tr> <!-- 제목 1줄 -->
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
			</tr>	<!-- 제목행 끝! -->
		
		<!-- 목록 -->
		<%
		
		if(boardLists.isEmpty()) {// DAO에서 리스트로 나온 값이 비었을 때
		
		%>
		
		<tr>
			<td colspan="5" align="center"> 등록된 게시물이 없습니다. </td>
		
		</tr>
	
	<%
		}else {	//등록된 게시물이 있으면?
			
			int virtualNum = 0; // 가상 번호 생성(화면 출력용)
			
			int countNum = 0; // 페이징 처리 처리용으로 개선
			
			for (BoardDTO dto : boardLists) { // boardLists dao에서 받은 결과 리스트
				
				//virtualNum = totalCount-- ; // 게시물의 총 개수 (돌때 - - - - - - 번호가 하나씩 줄어듦)
				
				virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++ ) ;
				// 105 			105		-	(((1 - 1)	*	10)		+	1 > 2 >3 > 4)
				// 104
				// 103
	%>
		<tr>
			<td><%= virtualNum %></td>
			<td align="left">
			<a href="View.jsp?num=<%=dto.getNum() %> "><%= dto.getTitle() %></a></td> 	<!-- ?num=2 request.getParameter("num") -->	
			<td><%= dto.getId() %></td>
			<td><%= dto.getVisitcount() %></td>
			<td><%= dto.getPostdate() %></td>
			
		</tr>
	<% 		
			} //for문 종료
				
		}//if문 종료
	%>
		</table> <!-- 리스트 테이블 종료 -->
		
		<!-- 글쓰기 -->
		
	<table border="1" width="90%">
		<tr align="center">
			<!-- 페이징 처리 -->
			<td>
				<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
						<!-- 					105			10		5			6			List.jsp?pageNum=5 -->
					<!-- [첫 페이지] [이전 블록] 6  7  8  9  10 [다음 블록] [마지막 페이지] -->
			
			</td>
			<!-- 글쓰기 버튼 -->
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>




</body>
</html>