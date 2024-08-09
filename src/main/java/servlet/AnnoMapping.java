package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException; //서블릿 예외처리
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;	
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AnnoMapping
 */
@WebServlet("/AnnoMapping")	// http://localhost:포트번호/컨텍스트루트/AnnoMapping 이라는 주소가 생김
// 위 주소로 들어오면 AnnoMapping 클래스가 응답을 한다.
public class AnnoMapping extends HttpServlet {	// extends HttpServlet 서블릿을 상속 받아 활용(do.get 등 메서드)
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnoMapping() {
        super();
        // 기본 생성자로 부모인 httpServlet 클래스를 생성한다. super()
        // 생략 시 자동으로 만들어진다.
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// 초기화를 담당하는 메서드
		// JDBC인 경우 1단계, 2단계를 적용하면 좋다.
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// Tomcat 종료 시 담당
		// JDBC인 경우 5단계 적용하면 좋다.
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청이 들어온 모든 메서드의 응답을 담당
		// JDBC인 경우 3, 4단계 적용하면 좋다.
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청이 GET 메서드에 대한 응답을 담당
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청이 POST 메서드에 대한 응답을 담당
		doGet(request, response);
	}

}
