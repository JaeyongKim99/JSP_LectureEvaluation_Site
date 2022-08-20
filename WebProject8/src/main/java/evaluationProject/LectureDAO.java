package evaluationProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jsp.member.model.MemberBean;

public class LectureDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
    
	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/project8?useUnicode=true&characterEncoding=utf-8"; 
	
	// DB연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"root","3548");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 강의정보 갱신 메소드
		public boolean updateDB(LectureDTO lectureDTO) {
			connect();
			String sql ="update class set lectureName=?, professorName=?, lectureDivide=? where lectureId=?";		
			 
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, lectureDTO.getLectureName()); // 숫자 = 위 ? 몇번째에 들어가는지 1이면 1번째 ?
				pstmt.setString(2, lectureDTO.getProfessorName());
				pstmt.setString(3, lectureDTO.getLectureDivide());
				pstmt.setInt(4, lectureDTO.getLectureId()); // setString, setInt, setBlob 타입에 맞춰서
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		
		// 특정 강의 삭제 메소드
		public boolean deleteDB(int id) {
			connect();
			
			String sql ="delete from class where lectureId=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		
		// 신규 강의 추가 메소드
		public int insert(LectureDTO lectureDTO) {
			connect();
					
			String sql ="insert into class values (NULL, ?, ?, ?, 0, 0)";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,lectureDTO.getLectureName());
				pstmt.setString(2,lectureDTO.getProfessorName());
				pstmt.setString(3, lectureDTO.getLectureDivide());
				return pstmt.executeUpdate(); // 추가되는 강의의 수인 1 반환
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return -1; //강의 입력 실패
		}
		
		// 전체 강의 출력 메소드
		public ArrayList<LectureDTO> getDBList() {
			connect();
			ArrayList<LectureDTO> datas = new ArrayList<LectureDTO>();
			
			String sql = "select * from class order by lectureId desc";
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					LectureDTO lectureDTO = new LectureDTO();
					
					lectureDTO.setLectureId(rs.getInt("lectureId"));
					lectureDTO.setLectureName(rs.getString("lectureName"));
					lectureDTO.setProfessorName(rs.getString("professorName"));
					lectureDTO.setLectureDivide(rs.getString("lectureDivide"));
					lectureDTO.setAvgGrade(rs.getInt("avgGrade"));
					lectureDTO.setLectureCount(rs.getInt("lectureCount"));
					datas.add(lectureDTO);
				}
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return datas;
		}
		
		// 특정 강의 정보 열람
		public LectureDTO getLectureNameDB(String id) {
			connect();
			String sql = "select * from class where lectureId=?";
			LectureDTO lectureDTO = new LectureDTO();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				ResultSet rs = pstmt.executeQuery();
				// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
				rs.next();
				lectureDTO.setLectureId(rs.getInt("lectureId"));
				lectureDTO.setLectureName(rs.getString("lectureName"));
				lectureDTO.setProfessorName(rs.getString("professorName"));
				lectureDTO.setLectureDivide(rs.getString("lectureDivide"));
				lectureDTO.setAvgGrade(rs.getInt("avgGrade"));
				lectureDTO.setLectureCount(rs.getInt("lectureCount"));
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return lectureDTO;
		}
		
		//검색 메소드
		public ArrayList<LectureDTO> getlist(String keyWord){
			connect();
			
			ArrayList<LectureDTO> datas = new ArrayList<LectureDTO>();
			String sql = "select * from class where professorName like ? OR lectureName like ? order by lectureId desc";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%" + keyWord + "%");
				pstmt.setString(2,"%" + keyWord + "%");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					LectureDTO lectureDTO = new LectureDTO();
					lectureDTO.setLectureId(rs.getInt("lectureId"));
					lectureDTO.setLectureName(rs.getString("lectureName"));
					lectureDTO.setProfessorName(rs.getString("professorName"));
					lectureDTO.setLectureDivide(rs.getString("lectureDivide"));
					lectureDTO.setAvgGrade(rs.getInt("avgGrade"));
					lectureDTO.setLectureCount(rs.getInt("lectureCount"));
					datas.add(lectureDTO);
				}
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return datas;
		}
		
		//강의 평가 개수 구하기 
		public int getListCount(String keyWord){
			connect();
	        int count = 0;
	        
	        try{
	            pstmt = conn.prepareStatement("select count(lectureCount) from class");
	            ResultSet rs = pstmt.executeQuery();
	            
	            if(rs.next()){
	                count = rs.getInt(1);
	            }
	        }catch (SQLException e) {
				e.printStackTrace();
			}finally{
	        	disconnect();
	        }
	        
	        return count;
	    }

		// 평균 평점 삽입
		public int updateAvgGrade(int avgGrade, String lectureName) {
			connect();
			String sql ="update class set avgGrade = ? where lectureId IN (select lectureId from (select lectureId from class where lectureName = ?) tmp)";	
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, avgGrade); 
				pstmt.setString(2, lectureName);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return -1;
		}
		
		// 강의평가 개수 삽입
		public int updateEvalationCount(int evaluationCount, String lectureName) {
			connect();
			String sql ="update class set lectureCount = ? where lectureId IN (select lectureId from (select lectureId from class where lectureName = ?) tmp)";	
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, evaluationCount); 
				pstmt.setString(2, lectureName);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return -1;
		}
		
		//강의이름을 받으면 강의 아이디를 출력해주는 메소드
		public String getlectureNameToId(String lectureName){
			connect();
	        String lectureId = null;
	        String sql = "select lectureId from class where lectureName = ?";
	        try{
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, lectureName);
	            ResultSet rs = pstmt.executeQuery();
	            
	            if(rs.next()){
	            	lectureId = rs.getString(1);
	            }
	        }catch (SQLException e) {
				e.printStackTrace();
			}finally{
	        	disconnect();
	        }
	        
	        return lectureId;
	    }
}
