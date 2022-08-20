package jsp.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jsp.member.model.MemberBean;

public class memberDAO {
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
	
	// 로그인 확인 메소드
	public int login(String userID, String userPw) {
		connect();
		String sql ="SELECT password from members where id = ?";	
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPw)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 로그인 실패(비밀번호 틀림)				}
				}
			}
			return -1; //아이디가 없음
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -2; //데이터베이스 오류
	}
	// 회원정보 갱신 메소드
	public boolean updateDB(MemberBean memberBean) {
		connect();
		String sql ="update members set nickname=?, password=?, email=?, classyear=? where id=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberBean.getNickname()); // 숫자 = 위 ? 몇번째에 들어가는지 1이면 1번째 ?
			pstmt.setString(2, memberBean.getPassword());
			pstmt.setString(3, memberBean.getEmail());
			pstmt.setString(4, memberBean.getClassyear());
			pstmt.setString(5, memberBean.getId()); // setString, setInt, setBlob 타입에 맞춰서
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
	
	// 특정 회원 삭제 메소드
	public boolean deleteDB(String id) {
		connect();
		
		String sql ="delete from members where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	// 신규 회원 추가 메소드
	public int insertDB(MemberBean memberBean) {
		connect();
				
		String sql ="insert into members values (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberBean.getNickname());
			pstmt.setString(2,memberBean.getId());
			pstmt.setString(3, memberBean.getPassword());
			pstmt.setString(4,memberBean.getEmail());
			pstmt.setString(5,memberBean.getClassyear());
			return pstmt.executeUpdate(); // 추가되는 회원의 수인 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return -1; //회원 가입 실패
	}

	// 특정 회원 정보 열람
	public MemberBean getDB(String id) {
		connect();
		String sql = "select * from members where id=?";
		MemberBean memberBean = new MemberBean();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			memberBean.setNickname(rs.getString("nickname"));
			memberBean.setId(rs.getString("id"));
			memberBean.setPassword(rs.getString("password"));
			memberBean.setEmail(rs.getString("email"));
			memberBean.setClassyear(rs.getString("classyear"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return memberBean;
	}
	
	// 전체 회원 출력 메소드
	public ArrayList<MemberBean> getDBList() {
		connect();
		ArrayList<MemberBean> datas = new ArrayList<MemberBean>();
		
		String sql = "select * from members order by id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberBean memberBean = new MemberBean();
				
				memberBean.setNickname(rs.getString("nickname"));
				memberBean.setId(rs.getString("id"));
				memberBean.setPassword(rs.getString("password"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setClassyear(rs.getString("classyear"));
				datas.add(memberBean);
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
	//id로 닉네임 구하는 메소드
	public String getNameDB(String id) {
		connect();
		String nickName = null;
		String sql = "select nickname from members where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			if(rs.next()) {
				nickName = rs.getString(1);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return nickName;
	}
}
