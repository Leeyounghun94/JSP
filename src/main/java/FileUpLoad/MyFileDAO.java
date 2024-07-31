package FileUpLoad;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyFileDAO extends DBConnPool{//DBConnPool에서 1, 2, 5단계 상속 받음.
	
	// JDBC 1단계 ~ 5단계 
	
	
	//입력 메서드
	public int insertFile(MyFileDTO myfileDTO) {
		int result = 0;
			String query = "insert into myfile (idx, name, title, cate, ofile, sfile) values (seq_board_num.nextval, ?, ?, ?, ?, ?)";
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, myfileDTO.getName());
				pstmt.setString(2, myfileDTO.getTitle());
				pstmt.setString(3, myfileDTO.getCate());
				pstmt.setString(4, myfileDTO.getOfile());
				pstmt.setString(5, myfileDTO.getSfile());	//3단계 완성
				
				result = pstmt.executeUpdate(); //4단계 정수로 리턴한다.
				
				
			} catch (SQLException e) {
				System.out.println("MyFileDAO.insertFile 메서드 오류");
				System.out.println("insert 쿼리문을 확인하세요");
				e.printStackTrace();
			}
			
		return result;
	}
	
	
	//출력 메서드
	public List<MyFileDTO> myFileList() {
		List<MyFileDTO> fileList = new Vector<MyFileDTO>(); //멀티 스레드용
		
		try {
			String query = "select * from myfile order by idx desc"; //모든 데이터를 찾아오면서 내림 정렬 한다.
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(); //쿼리문 실행 후 결과를 표로 받는다.
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO(); //빈 객체 생성
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				fileList.add(dto); // 리스트에 객체 삽입	
			}
			
		} catch (SQLException e) {
			System.out.println("MyFileDAO.myFileList 메서드 오류");
			System.out.println("select 쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return fileList;	//결론은 테이블에 있는 모든 값이 리스트의 객체로 리턴 된다.
		
	}
	
	
	//수정 메서드
	
	
	//삭제 메서드

}
