package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.inforDAO;

/**
 * Servlet implementation class AQTypeUpdate2
 */
@WebServlet("/AQTypeUpdate2")
public class AQTypeUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AQTypeUpdate2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		inforDAO dao=new inforDAO();
		int question_type_id=Integer.valueOf(request.getParameter("question_type_id"));
		int i = dao.updateAQType(question_type_id, request.getParameter("question_type_name"));
		System.out.println("i="+i);
		dao.close();
		if (i > 0) {
			request.getRequestDispatcher("Admin/AQTypeWatch.jsp?question_type_id="+question_type_id).forward(request,
					response);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();			
			out.println("sdg"+question_type_id);
		}
	}

}
