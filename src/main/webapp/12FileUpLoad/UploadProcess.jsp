<%@page import="FileUpLoad.MyFileDAO"%>
<%@page import="FileUpLoad.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> <!-- 임포트가 걸리는데 이것은 cos.jar -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* method="post" enctype="multipart/form-data 처리
	 처리 필요요소 4가지 cos.jar : request, 저장경로, 단일파일크기, 인코딩 방식 */
	 
	try {
	//1단계 : cos.jar 연결 
	String saveDirectory = application.getRealPath("/Uploads"); // 저장할 디렉토리 http://192.168.111.101:80/board-jsp/Uploads
	int maxPostSize = 1024 * 1024 * 100 ; // 파일 최대 크기(100MB) = KB * MB * GB
	String encoding = "UTF-8";
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	System.out.println("saveDirectory : " + saveDirectory);
	System.out.println("maxPostSize : " + maxPostSize);
	
	
	//2단계 : ofile, sfile 결정
	// 2. 새로운 파일명 생성
	String fileName = mr.getFilesystemName("attachedFile");  // 현재 파일 이름
	System.out.println("fileName : " + fileName);

    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
	System.out.println("ext : " + ext);

    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    System.out.println("now : " + now);
    String newFileName = now + ext;  // 새로운 파일 이름("업로드일시.확장자")
    System.out.println("newFileName : " + newFileName);


    // 3. 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName); //separator: /
    System.out.println("oldFile : " + oldFile);
    File newFile = new File(saveDirectory + File.separator + newFileName);
    System.out.println("newFile : " + newFile);
    oldFile.renameTo(newFile);
	
    
    // 4. FileUpLoadMain에서 넘어온 폼 값 처리 name="fileForm"
    String name = mr.getParameter("name");
    String title = mr.getParameter("title");
    String[] cateArray = mr.getParameterValues("cate");
    StringBuffer cateBuf = new StringBuffer();// String에 append 가능
    if (cateArray == null) {
        cateBuf.append("선택 없음");
    }
    else {
        for (String s : cateArray) {
            cateBuf.append(s + ", ");
        }// 사진, 과제, 워드, 음원, 이런식으로 만들겠다.
    }
    
    // 5. DTO에 4번 값 넣기
    MyFileDTO dto = new MyFileDTO();
    dto.setName(name);
    dto.setTitle(title);
    dto.setCate(cateBuf.toString());
    dto.setOfile(fileName);
    dto.setSfile(newFileName);
    
    // 6. DAO 통해 데이터베이스에 반영
    MyFileDAO dao = new MyFileDAO();
    dao.insertFile(dto);
    dao.close();
    
    // 7. 파일 목록 JSP로 리디섹션
    response.sendRedirect("FileList.jsp");// 성공하면 되돌아감
	
	} catch (Exception e) {
		System.out.println("UploadProcess.jsp 예외 발생");
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
    request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}

%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>UploadProcess.jsp : cos.jar를 활용하여 파일 처리 하고 DAO로 연결한다.</title></head>
<body>



</body>
</html>