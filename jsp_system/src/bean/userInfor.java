package bean;

public class userInfor {
	//用户表
	private int user_id;
	private String user_name;	
	private String password;
	private String photo;
	private int character;
	private int user_status;
	private String class_name;	
	private int ischeck;
	//教学班表
	private int teach_id;
	private String teach_name;
	private int course_id;
	//考试任务表
	private int task_id;
	private String task_name;
	private int task_time;
	private String begin_time;
	private String end_time;
	private int paper_id;
	//学生考试成绩表
	private int score_id;
	private int re_single;
	private int re_multiply;
	private int re_total;
	private String input_time;
	//学生选课表
	private int stu_course_id;
	//试题类型表
	private int question_type_id;
	private String question_type_name;
	//题库表
	private int question_id;
	private int know_id;
	private String question;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String answer;
	//试卷内容（试题）表
	private int paper_content_id;
	//试卷信息
	private String create_time;
	private String paper_status;
	//知识点表
	private String know_name;
	//课程表
	private String course_name;
	private String course_infor;
	//角色类型表
	private String character_name;
	
	//用户表
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return user_name;
	}
	public void setUsername(String user_name) {
		this.user_name = user_name;
	}
	public String getPasssword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setSex(String photo) {
		this.photo = photo;
	}
	public int getCharacter() {
		return character;
	}
	public void setCharacter(int character) {
		this.character = character;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setDegree(int user_status) {
		this.user_status = user_status;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIntro(int ischeck) {
		this.ischeck = ischeck;
	}
	
	//教学班表
	public int getTeach_id() {
		return teach_id;
	}
	public void setTeach_id(int teach_id) {
		this.teach_id = teach_id;
	}
	public String getTeachname() {
		return teach_name;
	}
	public void setTeach_name(String teach_name) {
		this.teach_name = teach_name;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	
	//考试任务表
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public int getTask_time() {
		return task_time;
	}
	public void setTask_time(int task_time) {
		this.task_time = task_time;
	}
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getPaper_id() {
		return paper_id;
	}
	public void setPaper_id(int paper_id) {
		this.paper_id = paper_id;
	}
	
	//学生考试成绩表
	public int getScore_id() {
		return score_id;
	}
	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}
	public int getRe_single() {
		return re_single;
	}
	public void setRe_single(int re_single) {
		this.re_single = re_single;
	}
	public int getRe_multiply() {
		return re_multiply;
	}
	public void setRe_multiply(int re_multiply) {
		this.re_multiply = re_multiply;
	}
	public int getRe_total() {
		return re_total;
	}
	public void setRe_total(int re_total) {
		this.re_total = re_total;
	}
	public String getInput_time() {
		return input_time;
	}
	public void setInput_time(String input_time) {
		this.input_time = input_time;
	}
	
	//学生选课表
	public int getStu_course_id() {
		return stu_course_id;
	}
	public void setStu_course_id(int stu_course_id) {
		this.stu_course_id = stu_course_id;
	}
	
	//试题类型
	public int getQuestion_type_id() {
		return question_type_id;
	}
	public void setQuestion_type_id(int question_type_id) {
		this.question_type_id = question_type_id;
	}
	public String getQuestion_type_name() {
		return question_type_name;
	}
	public void setQuestion_type_name(String question_type_name) {
		this.question_type_name = question_type_name;
	}
	
	//题库表
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public int getKnow_id() {
		return know_id;
	}
	public void setKnow_id(int know_id) {
		this.know_id = know_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	//试卷内容表
	public int getPpaer_content_id() {
		return paper_content_id;
	}
	public void setPaper_content_id(int paper_content_id) {
		this.paper_content_id = paper_content_id;
	}
	//试卷信息
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getPaper_status() {
		return paper_status;
	}
	public void setPaper_status(String paper_status) {
		this.paper_status = paper_status;
	}
	//知识点表
	public String getKnow_name() {
		return know_name;
	}
	public void setKnow_name(String know_name) {
		this.know_name = know_name;
	}
	//课程表
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_infor() {
		return course_infor;
	}
	public void setCourse_infor(String course_infor) {
		this.course_infor = course_infor;
	}
	//角色类型表
	public String getCharacter_name() {
		return character_name;
	}
	public void setCharacter_name(String character_name) {
		this.character_name = character_name;
	}
}
