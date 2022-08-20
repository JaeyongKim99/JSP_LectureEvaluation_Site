package noticeProject;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jsp.member.model.MemberBean;
import noticeProject.NoticeDTO;

public class NoticeDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;

	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/project8?useUnicode=true&characterEncoding=utf-8";

	// DB 연결 메소드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "3548");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 공지사항 수정 가져오기
	public NoticeDTO getDB(String id) {
		connect();
		String sql = "select * from notice where no=?";
		NoticeDTO noticeDTO = new NoticeDTO();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			noticeDTO.setNo(rs.getInt("no"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setDate(rs.getDate("date"));
			noticeDTO.setContents(rs.getString("contents"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return noticeDTO;
	}

	// 공지사항 글작성
	public int noticeDB(NoticeDTO noticeDTO) {
		connect();
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String sql = "insert into notice values(null, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeDTO.getTitle());
			pstmt.setTimestamp(2, date);
			pstmt.setString(3, noticeDTO.getContents());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -1;
	}

	// 공지사항 전체 출력
	public ArrayList<NoticeDTO> getDBList() {
		connect();
		ArrayList<NoticeDTO> datas = new ArrayList<NoticeDTO>();

		String sql = "select * from notice order by no desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeDTO noticeDTO = new NoticeDTO();

				noticeDTO.setNo(rs.getInt("no"));
				noticeDTO.setTitle(rs.getString("title"));
				noticeDTO.setDate(rs.getDate("date"));
				noticeDTO.setContents(rs.getString("contents"));
				datas.add(noticeDTO);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

	// 공지사항 수정
	public boolean noticeupDB(NoticeDTO noticeDTO) {
		connect();
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String sql = "update notice set title=?, date=? , contents=? where no=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeDTO.getTitle());
			pstmt.setTimestamp(2, date);
			pstmt.setString(3, noticeDTO.getContents());
			pstmt.setInt(4, noticeDTO.getNo()); // setString, setInt, setBlob 타입에 맞춰서
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 공지사항 삭제
	public boolean noticedelDB(int no) {
		connect();
		String sql = "delete from notice where no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	
}
