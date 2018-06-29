package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.userInfor;
import db.inforDAO;


/**
 * Servlet implementation class AQTypeUpdate
 */
@WebServlet("/AQTypeUpdate")
public class AQTypeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AQTypeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("11111111:");
		request.setCharacterEncoding("UTF-8");
		int question_type_id=Integer.valueOf(request.getParameter("question_type_id"));
		System.out.println("question_type_id:"+question_type_id);
		inforDAO dao=new inforDAO();
		userInfor user=null;
		user=dao.queryQuestionType(question_type_id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("Admin/AQTypeUpdate.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
