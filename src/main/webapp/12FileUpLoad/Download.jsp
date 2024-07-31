<%@page import="utills.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	try {
	String saveDirectory = application.getRealPath("/Uploads"); //가져올 폴더
	String saveFilename = request.getParameter("sName"); // 저장 파일명
	String originalFilename = request.getParameter("oName"); //원본 파일명
	
	//하드 디스크에 있는 파일을 찾아 와야 한다.
	File file = new File(saveDirectory, saveFilename); //경로와 파일명으로 객체 생성
	InputStream inputStream = new FileInputStream(file); //바이트 형식으로 객체 생성
	
	//윈도우용(ISO-8859-1), 리눅스용(UTF-8), 유닉스용(UTF-8)
	String client = request.getHeader("User-Agent"); //웹 브라우저 종류를 판단함.
	if(client.indexOf("WOW64") == -1 ) {
		originalFilename = new String(originalFilename.getBytes("utf-8"), "iso-8859-1");
		//리눅스, 유닉스(크롬 브라우저, 파이어폭스, 모질라)
	}else {
		originalFilename = new String(originalFilename.getBytes("ksc5601"), "iso-8859-1");
		//윈도우 용(ie = Internet Explorer)
	}
	
	
	//파일 다운로드용 응답 헤더 설정
	response.reset(); // 초기화를 걸어서 깨끗하게 만든다
	response.setContentType("application/octet-stream"); // 8비트씩 처리한다(즉, 1바이트)
	response.setHeader("Content-Disposition", "attachment; filename=\""+originalFilename+"\"");
	//응답 헤더에 파일명을 보냄
	response.setHeader("Content-Length", ""+file.length());
	//응답 헤더에 파일 크기를 보냄
	out.clear();//출력 스트림 초기화
	
	
	//출력 스트림에 파일 내용 출력
	OutputStream outputStream = response.getOutputStream(); //출력용 객체 응답헤더에 생성
	
	byte b[] = new byte[(int)file.length()]; //파일의 크기만큼 배열 생성
	int readBuffer = 0;
	while( (readBuffer = inputStream.read(b)) > 0 ) {
		outputStream.write(b, 0, readBuffer); //다운로드에서 내 하드에 저장.
	}
	
	inputStream.close();
	outputStream.close();
	} catch(FileNotFoundException e) {
		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
		
	} catch(Exception e) {
		JSFunction.alertBack("다운로드 중 예외 발생, 관리자를 호출하세요.", out);
	}




%>    
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Download.jsp : 파일 다운로드용 프로세서 </title></head>
<body>



</body>
</html>