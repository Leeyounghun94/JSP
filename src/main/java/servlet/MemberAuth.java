package servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MemberShip.MemberDAO;
import MemberShip.MemberDTO;

	//외우는게 아닌 Spring 하기 전에 알고 갈 사항

//@WebServlet("/login.mbc") // http://localhost/board-jsp/login.mbc -> 주석 단 이유는 web.xml에 MemberAuth로 할려고
public class MemberAuth extends HttpServlet{
	
	// 서블릿을 사용한 로그인 처리 방법
	// DB에 있는 회원이면 방가방가 처리
	// DB에 없는 회원이면 귀하는 회원이 아님 처리
	// DB에 없지만 XML에 AdminID가 있으면 최고 관리자 임을 출력
	
	//필드
	
	MemberDAO dao; //회원용 JDBC
	
	
	
	@Override
	public void init() throws ServletException {
		// JDBC 1단계, 2단계 처리
		ServletContext application = this.getServletContext();	//톰켓에 있는 web.xml을 활용
		
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, url, id, pw);
		
		
	}
	
	@Override
	public void destroy() {
		// jdbc 5단계 담당
		dao.close();
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
	@Override
		public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// jsp에서 넘어온 id, pw를 처리한다.
		
		// DB에 있는 회원이면 방가방가 처리
		// DB에 없는 회원이면 귀하는 회원이 아님 처리
		// DB에 없지만 XML에 AdminID가 있으면 최고 관리자 임을 출력
		
		String admin_id = this.getInitParameter("admin_id");
		//web.xml 에 있는 id를 가져온다. // kkw
		
		String id = req.getParameter("id");	//jsp 폼에서 넘어온 값
		String pass = req.getParameter("pass");
		
		MemberDTO memberDTO = dao.getMemberDTO(id, pass); // dao 메서드 결과를 dto로 받음.
		
		
		String memberId = memberDTO.getId(); //찾아온 객체의 ID를 넣음
		
		if(memberId != null) {
			//있으면 ~ ?
			req.setAttribute("authMessage", memberDTO.getName() + "님, 방가방가");
			
		}else {// db에 없으면 ~ ?
			
			if(admin_id.equals(id)) {
				req.setAttribute("authMessage", admin_id + "관리자님 로그인 하셨습니다.");
				
			}else {
				req.setAttribute("authMessage", "귀하는 회원이 아닙니다. 가입하세요!");
			}
		}//if문 종료
		
		req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp);
		//처리 후 응답을 보낼 주소와 객체를 전달함.
		
		}
	
	

	
	// java - class에서 메서드를 호출할 수가 있다.(Servlet 메뉴가 없어져도 활성화)

}
