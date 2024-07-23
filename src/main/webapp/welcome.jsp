<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!--@ 지시어 : jsp 시그니쳐 필수  -->
    
<%! /* ! 선언부 : 변수 선언, 메서드 선언 */
String str1 = "JSP";
String str2 = "안녕하세요 ~ !!";// 필드 처럼 변수 선언


%><!-- 여기 안에는 자바 영역 -->   
 
<!DOCTYPE html> <!-- html5 시작  -->
<html> <!-- 태그(html 문서시작점) -->
<head> <!-- head 시작( (문서 각종 설정 정보)  -->
<meta charset="UTF-8"> <!-- 문서에 메타 정보  -->
<title>Hello JSP</title><!-- 브라우저 제목 -->
</head><!-- HEAD 종료 -->
<body><!-- 본문 -> 브라우저의 안쪽 페이지 내용  -->

<h2> 처음 만들어 보는 <%= str1 %></h2><!-- = 표현식 : 변수 내용 출력(단, 계산은 X) h태그는 제목 태그로 글자 크기가 1(큼) ~ 6(작음) -->
<p><!-- 문단 태그 println 같은 기능 -->

<% /* 스크립틀릿 : 원시적인 JAVA 코드  */
out.println(str2 + str1 + "입니다. 지금 부터 시작합시다.");// system 을 안쓰는 이유는 콘솔이 아니니까
%>


</p>
</body>
</html> <!-- 태그(html 문서 끝) -->