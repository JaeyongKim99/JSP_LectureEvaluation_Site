package evaluationProject;

public class EvaluationDTO {
	int evaluationId; //강의평가번호
	String userId; //유저아이디 - 자기가 쓴 강의 평가 게시물 삭제 가능하게 하기 위함
	String userNick; //유저닉네임 - 결과 칸에서 유저닉네임을 확인하기 위해 선언
	String lectureName; //강의이름
	String professorName; //교수명
	int lectureYear; //수강년도
	String semesterDivide; //학기
	String lectureDivide; //강의 구분(교양인지 전공인지)
	String evaluationContent; //내용
	int satisfactionRating; //만족도
	int difficultyScore; //난이도
	int volumeScore; //학습량
	int likeCount; //추천수
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(int evaluationId) {
		this.evaluationId = evaluationId;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
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
	public int getLectureYear() {
		return lectureYear;
	}
	public void setLectureYear(int lectureYear) {
		this.lectureYear = lectureYear;
	}
	public String getSemesterDivide() {
		return semesterDivide;
	}
	public void setSemesterDivide(String semesterDivide) {
		this.semesterDivide = semesterDivide;
	}
	public String getLectureDivide() {
		return lectureDivide;
	}
	public void setLectureDivide(String lectureDivide) {
		this.lectureDivide = lectureDivide;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public int getSatisfactionRating() {
		return satisfactionRating;
	}
	public void setSatisfactionRating(int satisfactionRating) {
		this.satisfactionRating = satisfactionRating;
	}
	public int getDifficultyScore() {
		return difficultyScore;
	}
	public void setDifficultyScore(int difficultyScore) {
		this.difficultyScore = difficultyScore;
	}
	public int getVolumeScore() {
		return volumeScore;
	}
	public void setVolumeScore(int volumeScore) {
		this.volumeScore = volumeScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
