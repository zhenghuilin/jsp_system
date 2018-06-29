package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import bean.userInfor;
public class inforDAO {
	DBConnection dbc;
	public inforDAO() {
		dbc = new DBConnection();
		dbc.createConnection();
	}
	//注册时的插入数据库
	public int insertNewUser(String user_name, String password, int character, int user_status,int ischeck) {
		int i = 0;
		String sql = "insert into user(user_name,`password`,`character`,user_status,ischeck)"
				+ " values('"
				+ user_name
				+ "','"
				+ password
				+ "','"
				+ character
				+ "',"
				+ user_status
				+ ",'"
				+ ischeck
				+ "')";
		System.out.println(sql);
		i = dbc.update(sql);
		return i;
	}
	//登录查询
	public int queryLogin(String user_name,String password,int character) {
		int i=0;
		String sql = "select user_name,`password`,`character` from user where user_name='" + user_name + "'";

		System.out.println(sql);

		ResultSet rs = dbc.queryForRS(sql);
		if (rs != null) {
			try {
				if (rs.next()) {
					/*System.out.println(rs.getString("user_name"));
					System.out.println(rs.getString("password"));
					System.out.println(rs.getInt("character"));*/
					if(user_name.equals(rs.getString("user_name"))&&password.equals(rs.getString("password"))&&character==rs.getInt("character"))
					{
						if(character==0)
							i++;
						else if(character==1)
							i=i+2;
						else if(character==2)
							i=i+3;
						else 
							i=0;
					}
					System.out.println("i=:"+i);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;	
	}
	//显示学生选课信息
	public ArrayList<Map<String,String>> queryTcourse(String user_name) {
		int i=0;
		String sql = "SELECT course_id,course_name,course_infor FROM course WHERE user_name='" + user_name + "'";

		System.out.println(sql);

		ArrayList<Map<String,String>> list=dbc.queryForList(sql);
		
		return list;
	}
	//显示学生选课信息
	public ArrayList<Map<String,String>> queryStuScourse(String user_name) {
		int i=0;
		String sql = "SELECT course.course_id,course.course_name,course.user_name  "
				+ " FROM `user` JOIN stu_course ON `user`.class_name = stu_course.class_name "
				+ "JOIN course ON stu_course.course_id=course.course_id "
				+ "where `user`.user_name='" + user_name + "'";

		System.out.println(sql);

		ArrayList<Map<String,String>> list=dbc.queryForList(sql);
		
		return list;
	}
	//显示学生考试任务信息
	public ArrayList<Map<String,String>> queryStuTask(String user_name) {
		int i=0;
		String sql = "SELECT course.course_name,course.user_name,stu_course.class_name,task.begin_time "
				+ "FROM task JOIN paper ON task.paper_id = paper.paper_id "
				+ "JOIN course ON paper.course_id = course.course_id "
				+ "JOIN stu_course ON course.course_id = stu_course.course_id "
				+ "JOIN `user` ON stu_course.class_name = `user`.class_name  "
				+ "WHERE `user`.user_name ='" + user_name + "'";

		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		
		return list1;
	}
	//显示学生考试成绩
	public ArrayList<Map<String,String>> queryStuScore(String user_name) {
		int i=0;
		String sql = "SELECT course.course_name,course.user_name,task.task_name,stu_score.re_total,stu_score.input_time	"
				+ "FROM stu_score	"
				+ "JOIN task ON stu_score.task_id = task.task_id	"
				+ "JOIN paper ON task.paper_id=paper.paper_id	"
				+ "JOIN course ON paper.course_id = course.course_id	"
				+ "join stu_course on course.course_id=stu_course.course_id	"
				+ "join `user` on stu_course.class_name=`user`.class_name "
				+ "WHERE	`user`.user_name ='" + user_name + "' and `user`.user_id=stu_score.user_id";

		System.out.println(sql);

		ArrayList<Map<String,String>> list=dbc.queryForList(sql);
		
		return list;
	}
	//查询用户密码
	public int queryUserPwd(String user_name,String password) {
		int i=0;
		String sql = "select user_name,`password`,`character` from user where user_name='" + user_name + "'";
		System.out.println(sql);

		ResultSet rs = dbc.queryForRS(sql);
		if (rs != null) {
			try {
				if (rs.next()) {
					if(user_name.equals(rs.getString("user_name"))&&password.equals(rs.getString("password"))&&rs.getInt("character")==0)
					{
						i=1;
					}
					else if(user_name.equals(rs.getString("user_name"))&&password.equals(rs.getString("password"))&&rs.getInt("character")==1)
					{
						i=10;
					}
					else if(user_name.equals(rs.getString("user_name"))&&password.equals(rs.getString("password"))&&rs.getInt("character")==2)
					{
						i=20;
					}
					System.out.println("i=:"+i);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;	
	}
	//修改密码
	public int updatePassword(String user_name, String password) {
		int i=0;
		String sql = "update user set password='" + password + "' where user_name='" + user_name + "'";
		System.out.println(sql);
		i = dbc.update(sql);
		return i;
	}
	//查询试题类型
	public ArrayList<Map<String,String>> queryQuestionTypeAll() {
		int i=0;
		String sql = "select question_type_id,`question_type_name` from question_type ";
		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		
		return list1;
	}
	//查询试题类型其中之一
	public userInfor queryQuestionType(int question_type_id) {
		userInfor info = null;

		String sql = "select * from question_type where question_type_id='" + question_type_id + "'";

		System.out.println(sql);

		ResultSet rs = dbc.queryForRS(sql);

		if (rs != null) {
			try {
				if (rs.next()) {
					info = new userInfor();
					info.setQuestion_type_id(rs.getInt("question_type_id"));
					info.setQuestion_type_name(rs.getString("question_type_name"));
				}
			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
		return info;
	}
	//更新试题类型
	public int updateAQType(int question_type_id, String question_type_name) {
		String sql = "update question_type set question_type_name='" + question_type_name + "' where question_type_id='" + question_type_id + "'";
		
		System.out.println(sql);

		int i = dbc.update(sql);
		return i;
	}
	//删除某试题类型
	public int deleteByQTypeID(int question_type_id) {

		String sql = "delete from question_type where question_type_id='" + question_type_id + "'";
		int i = dbc.update(sql);
		return i;
	}
	//添加试题类型
	public int insertNewType(String question_type_name) {
		int i = 0;
		String sql = "insert into question_type(question_type_name)"
				+ " values('"+ question_type_name+ "')";
		System.out.println(sql);
		i = dbc.update(sql);
		return i;
	}
	
	//查询角色类型
	public ArrayList<Map<String,String>> queryCharacterAll() {
		int i=0;
		String sql = "select `character`,`character_name` from `character` ";
		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		
		return list1;
	}
	//查询所有用户
	public ArrayList<Map<String,String>> queryUserAll() {
		int i=0;
		String sql = "select `user`.`user_id`,`user`.password,`user`.`user_name`,`character`.`character_name` from `user` join `character` on `user`.`character`=`character`.`character` ";
		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		
		return list1;
	}
	//查询所有未审核用户
	public ArrayList<Map<String,String>> queryNoCheckUser() {
		int i=0;
		String sql = "select `user`.`user_id`,`user`.password,`user`.`user_name`,`character`.`character_name` "
				+ "from `user` join `character` "
				+ "on `user`.`character`=`character`.`character` "
				+ "where ischeck=0 ";
		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		System.out.println(list1);
		return list1;
	}
	//查询某老师的教学班
	public ArrayList<Map<String,String>> queryTeachClass(String user_name) {
		int i=0;
		String sql = "select course.course_name,stu_course.class_name "
				+ "from course join stu_course "
				+ "on course.course_id=stu_course.course_id "
				+ "where course.user_name='" + user_name + "'";

		System.out.println(sql);

		ArrayList<Map<String,String>> list=dbc.queryForList(sql);
		
		return list;
	}
	//查询某老师试卷列表
	public ArrayList<Map<String,String>> queryPaperList(String user_name) {
		int i=0;
		String sql = "select paper.create_time, paper.paper_status, course.course_name "
				+ "from paper join course "
				+ "on paper.course_id=course.course_id "
				+ "where course.user_name='" + user_name + "'";

		System.out.println(sql);

		ArrayList<Map<String,String>> list=dbc.queryForList(sql);
		
		return list;
	}
	//查询单选题题目
	public ArrayList<Map<String,String>> querySingleQuestion() {
		int i=0;
		String sql = "SELECT question,optionA,optionB,optionC,optionD "
				+ "FROM question_bank "
				+ "WHERE question_type_id=1";

		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		System.out.println(list1);
		return list1;
	}
	//查询单选题题目
	public ArrayList<Map<String,String>> queryMulQuestion() {
		int i=0;
		String sql = "SELECT question,optionA,optionB,optionC,optionD "
				+ "FROM question_bank "
				+ "WHERE question_type_id=2";

		System.out.println(sql);

		ArrayList<Map<String,String>> list1=dbc.queryForList(sql);
		System.out.println(list1);
		return list1;
	}
	//关闭数据库连接
	public void close() {
		dbc.close();
	}
	
}
