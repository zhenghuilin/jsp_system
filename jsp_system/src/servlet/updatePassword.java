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
 * Servlet implementation class updatePassword
 */
@WebServlet("/updatePassword")
public class updatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePassword() {
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
		int i=0;
		inforDAO dao = new inforDAO();
		String message = "修改密码成功，请使用新密码登录！";
		HttpSession session = request.getSession();
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String new_password2 = request.getParameter("new_password2");
		String user_name=session.getAttribute("name").toString();
		i=dao.queryUserPwd(user_name, old_password);
		int m=i;
		if(i>0&&new_password.equals(new_password2)&&new_password!=null&&new_password!=""){
			i = dao.updatePassword(user_name, new_password);
			System.out.println(i);
			dao.close();
			if (i>0){
				response.setContentType("text/html;charset=UTF-8");
				request.setAttribute("result", message); // 将提示信息保存在request对象
				request.getRequestDispatcher("login.jsp?username="+user_name).forward(request,response); 
			}
			else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();			
				//out.println("修改密码失败！");
				message="插入数据库失败！";
				request.setAttribute("result", message); // 将提示信息保存在request对象
				if(m==1)
					request.getRequestDispatcher("Admin/AInfor.jsp").forward(request,response);
				else if(m==10)
					request.getRequestDispatcher("Teacher/TInfor.jsp").forward(request,response);
				else
					request.getRequestDispatcher("Student/Sinfor.jsp").forward(request,response);
				
			}
		}
		//System.out.println(new_password);
		//System.out.println(user_name);
		else{
			response.setContentType("text/html;charset=UTF-8");
			message="输入密码有误！";
			PrintWriter out = response.getWriter();			
			request.setAttribute("result", message); // 将提示信息保存在request对象
			
			if(m==1)
				request.getRequestDispatcher("Admin/AInfor.jsp").forward(request,response);
			else if(m==10)
				request.getRequestDispatcher("Teacher/TInfor.jsp").forward(request,response);
			else
				request.getRequestDispatcher("Student/Sinfor.jsp").forward(request,response);
		}
	}

}
