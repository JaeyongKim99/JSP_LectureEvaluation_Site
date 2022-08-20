package evaluationProject;

public class LectureDTO {
	int lectureId; //강의 번호
	String lectureName; //강의명
	String professorName; // 교수명
	String lectureDivide; //강의 종류
	int avgGrade; //평균 학점
	int lectureCount; //강의 평가 개수
	public int getLectureId() {
		return lectureId;
	}
	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public String getLectureDivide() {
		return lectureDivide;
	}
	public void setLectureDivide(String lectureDivide) {
		this.lectureDivide = lectureDivide;
	}
	public int getAvgGrade() {
		return avgGrade;
	}
	public void setAvgGrade(int avgGrade) {
		this.avgGrade = avgGrade;
	}
	public int getLectureCount() {
		return lectureCount;
	}
	public void setLectureCount(int lectureCount) {
		this.lectureCount = lectureCount;
	}
	
}
