package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.inforDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		inforDAO dao = new inforDAO();
		String message = "登录失败";
		String user_name = request.getParameter("user_name");
		//使用request对象的getSession()获取session，如果session不存在则创建一个
		HttpSession session = request.getSession();
		
		int chara=Integer.valueOf(request.getParameter("character"));
		/*System.out.println(user_name);
		System.out.println(chara);
		System.out.println(request.getParameter("password"));*/
		int i = dao.queryLogin(user_name, request.getParameter("password"),chara);
		System.out.println(i);
		dao.close();
		if (i==1){
			//将数据存储到session中
			session.setAttribute("name", user_name);
			request.getRequestDispatcher("Admin/AIndex.jsp?username="+user_name).forward(request,response); 
		}
		else if(i==2){
			//将数据存储到session中
			session.setAttribute("name", user_name);
			request.getRequestDispatcher("Teacher/TIndex.jsp?username="+user_name).forward(request,response);
		}
		else if(i==3){
			//将数据存储到session中
			session.setAttribute("name", user_name);
			request.getRequestDispatcher("Student/SIndex.jsp?username="+user_name).forward(request,response);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();			
			//out.println("登录失败！");
			request.setAttribute("result", message); // 将提示信息保存在request对象中
			request.getRequestDispatcher("login.jsp?username="+user_name).forward(request,response);
		}
		
		
	}

}
