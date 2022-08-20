package evaluationProject;

public class LikeyDTO {
	String userID; //유저 아이디
	int evaluationID;// 강의평가 아이디
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public LikeyDTO(){
		
	}
	public LikeyDTO(String userID, int evaluationID) {
		super();
		this.userID = userID;
		this.evaluationID = evaluationID;
	}
	
}
