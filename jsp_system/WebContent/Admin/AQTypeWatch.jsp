<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.userInfor"%>
<%@ page import="db.inforDAO"%>
<%
	//String username = (String) request.getAttribute("username");
	int question_type_id = Integer.valueOf(request.getParameter("question_type_id"));
	inforDAO dao = new inforDAO();
	userInfor info = dao.queryQuestionType(question_type_id);
	dao.close();

	if (info != null) {
%>
试题编号:
<%=info.getQuestion_type_id()%><br>
试题类型名:
<%=info.getQuestion_type_name()%><br>

<%
	} else {
		out.println("未查询到任何数据, question_type_id=" + question_type_id);
	}
%>

<br>
<a href="${pageContext.request.contextPath}/Admin/AQuestionType.jsp">查看全部</a>
