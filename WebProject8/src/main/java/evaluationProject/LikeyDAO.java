package evaluationProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikeyDAO {
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
	//추천 추가
	public int like(String userID, String evaluationID) {
		connect();
		
		String sql ="insert into likey values (?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2,evaluationID);
			System.out.println(pstmt);
			return pstmt.executeUpdate(); // 추가되는 DB의 수인 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return -1; //추천 중복
	}
	
	// 추천 삭제
	public int delete(String userID, String evaluationID) {
		connect();
		
		String sql ="delete from likey where userID=? and evaluationID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2,evaluationID);
			return pstmt.executeUpdate(); // 추가되는 DB의 수인 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return -1; //추천 중복
	}
}
