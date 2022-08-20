package evaluationProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jsp.member.model.MemberBean;

public class EvaluationDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;

	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/project8?useUnicode=true&characterEncoding=utf-8";

	// DB연결 메서드
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

	// 강의평가 등록 메소드
	public int write(EvaluationDTO evaluationDTO) {
		connect();
		String sql = "INSERT INTO evaluation VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		// 기본적으로 evaluationId 값은 자동으로 하나씩 늘어나서 값을 넣어줄 필요가 없다.
		// 추천수는 0부터 시작이기때문에 0을 넣어준다.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, evaluationDTO.getUserId());
			pstmt.setString(2, evaluationDTO.getUserNick());
			pstmt.setString(3, evaluationDTO.getLectureName());
			pstmt.setString(4, evaluationDTO.getProfessorName());
			pstmt.setInt(5, evaluationDTO.getLectureYear());
			pstmt.setString(6, evaluationDTO.getSemesterDivide());
			pstmt.setString(7, evaluationDTO.getLectureDivide());
			pstmt.setString(8, evaluationDTO.getEvaluationContent());
			pstmt.setInt(9, evaluationDTO.getSatisfactionRating());
			pstmt.setInt(10, evaluationDTO.getDifficultyScore());
			pstmt.setInt(11, evaluationDTO.getVolumeScore());

			return pstmt.executeUpdate();
			// 정상적으로 등록이 되면 하나가 등록이 되었기때문에 1 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -2; // 데이터베이스 오류
	}

	// 전체 강의평가 출력 메소드
	public ArrayList<EvaluationDTO> getDBList() {
		connect();
		ArrayList<EvaluationDTO> datas = new ArrayList<EvaluationDTO>();

		String sql = "select * from evaluation order by evaluationId desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				EvaluationDTO evaluationDTO = new EvaluationDTO();

				evaluationDTO.setEvaluationId(rs.getInt("evaluationId"));
				evaluationDTO.setUserId(rs.getString("userId"));
				evaluationDTO.setUserNick(rs.getString("userNick"));
				evaluationDTO.setLectureName(rs.getString("lectureName"));
				evaluationDTO.setProfessorName(rs.getString("professorName"));
				evaluationDTO.setLectureYear(rs.getInt("lectureYear"));
				evaluationDTO.setSemesterDivide(rs.getString("semesterDivide"));
				evaluationDTO.setLectureDivide(rs.getString("lectureDivide"));
				evaluationDTO.setEvaluationContent(rs.getString("evaluationContent"));
				evaluationDTO.setSatisfactionRating(rs.getInt("satisfactionRating"));
				evaluationDTO.setDifficultyScore(rs.getInt("difficultyScore"));
				evaluationDTO.setVolumeScore(rs.getInt("volumeScore"));
				evaluationDTO.setLikeCount(rs.getInt("likeCount"));
				datas.add(evaluationDTO);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

	// 특정 강의평가 출력 메소드
	public EvaluationDTO getDB(String id) {
		connect();
		String sql = "select * from evaluation where evaluationId=?";
		EvaluationDTO evaluationDTO = new EvaluationDTO();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			evaluationDTO.setEvaluationId(rs.getInt("evaluationId"));
			evaluationDTO.setUserId(rs.getString("userId"));
			evaluationDTO.setUserNick(rs.getString("userNick"));
			evaluationDTO.setLectureName(rs.getString("lectureName"));
			evaluationDTO.setProfessorName(rs.getString("professorName"));
			evaluationDTO.setLectureYear(rs.getInt("lectureYear"));
			evaluationDTO.setSemesterDivide(rs.getString("semesterDivide"));
			evaluationDTO.setLectureDivide(rs.getString("lectureDivide"));
			evaluationDTO.setEvaluationContent(rs.getString("evaluationContent"));
			evaluationDTO.setSatisfactionRating(rs.getInt("satisfactionRating"));
			evaluationDTO.setDifficultyScore(rs.getInt("difficultyScore"));
			evaluationDTO.setVolumeScore(rs.getInt("volumeScore"));
			evaluationDTO.setLikeCount(rs.getInt("likeCount"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return evaluationDTO;
	}

	// 강의평가정보 갱신 메소드
	public boolean updateDB(EvaluationDTO evaluationDTO) {
		connect();
		String sql = "update evaluation set lectureName=?, professorName=?, lectureYear=?, semesterDivide=?, lectureDivide=?, evaluationContent=?, satisfactionRating=?, , difficultyScore=?, volumeScore=? where evaluationId=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, evaluationDTO.getLectureName());
			pstmt.setString(2, evaluationDTO.getProfessorName());
			pstmt.setInt(3, evaluationDTO.getLectureYear());
			pstmt.setString(4, evaluationDTO.getSemesterDivide());
			pstmt.setString(5, evaluationDTO.getLectureDivide());
			pstmt.setString(6, evaluationDTO.getEvaluationContent());
			pstmt.setInt(7, evaluationDTO.getSatisfactionRating());
			pstmt.setInt(8, evaluationDTO.getDifficultyScore());
			pstmt.setInt(9, evaluationDTO.getVolumeScore());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 특정 강의평가 삭제 메소드
	public boolean deleteDB(int id) {
		connect();

		String sql = "delete from evaluation where evaluationId=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 특정 강의평가 출력 메소드
	public EvaluationDTO searchDB(String searchText) {
		connect();
		String sql = "select * from evaluation where evaluationId=?";
		EvaluationDTO evaluationDTO = new EvaluationDTO();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			ResultSet rs = pstmt.executeQuery();
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			evaluationDTO.setEvaluationId(rs.getInt("evaluationId"));
			evaluationDTO.setUserId(rs.getString("userId"));
			evaluationDTO.setUserNick(rs.getString("userNick"));
			evaluationDTO.setLectureName(rs.getString("lectureName"));
			evaluationDTO.setProfessorName(rs.getString("professorName"));
			evaluationDTO.setLectureYear(rs.getInt("lectureYear"));
			evaluationDTO.setSemesterDivide(rs.getString("semesterDivide"));
			evaluationDTO.setLectureDivide(rs.getString("lectureDivide"));
			evaluationDTO.setEvaluationContent(rs.getString("evaluationContent"));
			evaluationDTO.setSatisfactionRating(rs.getInt("satisfactionRating"));
			evaluationDTO.setDifficultyScore(rs.getInt("difficultyScore"));
			evaluationDTO.setVolumeScore(rs.getInt("volumeScore"));
			evaluationDTO.setLikeCount(rs.getInt("likeCount"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return evaluationDTO;
	}

	// 만족도 평균 구하는 메소드
	public int getSrCount(String lectureName) {
		connect();
		int count = 0;

		try {
			pstmt = conn.prepareStatement("select avg(satisfactionRating) from evaluation where lectureName = ?");
			pstmt.setString(1, lectureName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}

	// 어려움 평균 구하는 메소드
	public int getDsCount(String lectureName) {
		connect();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select avg(difficultyScore) from evaluation where lectureName = ?");
			pstmt.setString(1, lectureName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}

	// 학습량 평균 구하는 메소드
	public int getVsCount(String lectureName) {
		connect();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select avg(volumeScore) from evaluation where lectureName = ?");
			pstmt.setString(1, lectureName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}

	// 강의평가 갯수 구하기
	public int getevaluationCount(String lectureName) {
		connect();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from evaluation where lectureName = ?");
			pstmt.setString(1, lectureName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}

	// 강의 명으로 강의평가들을 찾는 메소드(강의명과 정렬방식을 받음)
	public ArrayList<EvaluationDTO> getlist(String lectureName, String order) {
		connect();
		ArrayList<EvaluationDTO> datas = new ArrayList<EvaluationDTO>();
		String sql = null;
		if ("latest".equals(order)) {
			sql = "select * from evaluation where lectureName=? order by evaluationId desc;";
		} else if ("like".equals(order)) {
			sql = "select * from evaluation where lectureName=? order by likeCount desc";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lectureName);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				EvaluationDTO evaluationDTO = new EvaluationDTO();
				evaluationDTO.setEvaluationId(rs.getInt("evaluationId"));
				evaluationDTO.setUserId(rs.getString("userId"));
				evaluationDTO.setUserNick(rs.getString("userNick"));
				evaluationDTO.setLectureName(rs.getString("lectureName"));
				evaluationDTO.setProfessorName(rs.getString("professorName"));
				evaluationDTO.setLectureYear(rs.getInt("lectureYear"));
				evaluationDTO.setSemesterDivide(rs.getString("semesterDivide"));
				evaluationDTO.setLectureDivide(rs.getString("lectureDivide"));
				evaluationDTO.setEvaluationContent(rs.getString("evaluationContent"));
				evaluationDTO.setSatisfactionRating(rs.getInt("satisfactionRating"));
				evaluationDTO.setDifficultyScore(rs.getInt("difficultyScore"));
				evaluationDTO.setVolumeScore(rs.getInt("volumeScore"));
				evaluationDTO.setLikeCount(rs.getInt("likeCount"));
				datas.add(evaluationDTO);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

	// 추천이 눌리면 추천수 추가해주는 메소드
	public int like(String evaluationId) {
		connect();

		String sql = "update evaluation set likeCount = likeCount + 1 where evaluationId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationId));
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -1;// 데이터베이스 오류
	}

	// 추천이 중복으로 눌리면 추천수 삭제해주는 메소드
	public int likeDelete(String evaluationId) {
		connect();

		String sql = "update evaluation set likeCount = likeCount - 1 where evaluationId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationId));
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -1;// 데이터베이스 오류
	}

	// 강의평가 아이디를 받아서 특정 컬럼데이터를 반환하는 메소드
	public String getEvaluationUserID(int evaluationId, String kinds) {
		connect();
		String result = null;
		String sql = null;
		if ("작성자아이디".equals(kinds)) {
			sql = "select userId from evaluation where evaluationId = ?;";
		} else if ("강의이름".equals(kinds)) {
			sql = "select lectureName from evaluation where evaluationId = ?;";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, evaluationId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}

	// 강의 명으로 강의평가들을 찾는 메소드(강의명과 정렬방식을 받음)
	public ArrayList<EvaluationDTO> getMyEvaluation(String userId) {
		connect();
		ArrayList<EvaluationDTO> datas = new ArrayList<EvaluationDTO>();
		String sql = "select * from evaluation where userId=? order by evaluationId desc;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				EvaluationDTO evaluationDTO = new EvaluationDTO();
				evaluationDTO.setEvaluationId(rs.getInt("evaluationId"));
				evaluationDTO.setUserId(rs.getString("userId"));
				evaluationDTO.setUserNick(rs.getString("userNick"));
				evaluationDTO.setLectureName(rs.getString("lectureName"));
				evaluationDTO.setProfessorName(rs.getString("professorName"));
				evaluationDTO.setLectureYear(rs.getInt("lectureYear"));
				evaluationDTO.setSemesterDivide(rs.getString("semesterDivide"));
				evaluationDTO.setLectureDivide(rs.getString("lectureDivide"));
				evaluationDTO.setEvaluationContent(rs.getString("evaluationContent"));
				evaluationDTO.setSatisfactionRating(rs.getInt("satisfactionRating"));
				evaluationDTO.setDifficultyScore(rs.getInt("difficultyScore"));
				evaluationDTO.setVolumeScore(rs.getInt("volumeScore"));
				evaluationDTO.setLikeCount(rs.getInt("likeCount"));
				datas.add(evaluationDTO);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
}
