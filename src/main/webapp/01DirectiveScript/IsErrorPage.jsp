<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
     <!--  예외 처리용 페이지 이라는 것을 지시. -->
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>IsErrorPage.jsp : 예외통합처리</title></head><body>
<h2> 서비스중 일시적인 예외가 발생하였습니다.</h2>

<p>
오류명 : <%= exception.getClass().getName() %> <br>
오류메세지 : <%= exception.getMessage() %> <br>
관리자 연락처 : 010 - 2870 - 8188 <br>
오류 발생을 알려주시는 분께 사례를 하겠습니다. 감사합니다.

</p>
<!-- 페이지 예외발생 시 통합 처리용  -->


</body>
</html>