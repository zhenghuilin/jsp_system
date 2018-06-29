<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ page import="java.net.URLEncoder"%>
<%@ page import="db.inforDAO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题库与考试系统</title>
</head>
<body>
<div class="row">
	<div class="col-md-2">多选题</div>
	<div class="col-md-10"></div>
</div>
<hr>
<div class="row">
	<%
			inforDAO dao = new inforDAO();
		 	//int courseid=Integer.valueOf(session.getAttribute("course_id").toString());
			ArrayList<Map<String, String>> f = dao.queryMulQuestion();
			int i=0;
			for (Map<String, String> score : f) {	
				i++;
		%>
		<div class="col-md-12"><%=i%>、<%=score.get("question") %></div>
			<div class="col-md-6"><input type="checkbox" name="optionA"><%=score.get("optiona") %></div>
			<div class="col-md-6"><input type="checkbox" name="optionB"><%=score.get("optionb") %></div>
			<div class="col-md-6"><input type="checkbox" name="optionC"><%=score.get("optionc") %></div>
			<div class="col-md-6"><input type="checkbox" name="optionD"><%=score.get("optiond") %></div>
			<hr>
		<%
		/* System.out.println(score.get("question"));
		System.out.println(score.get("optionA"));
		System.out.println(score.get("optionB"));
		System.out.println(score.get("optionC"));
		System.out.println(score.get("optionD")); */
		}
		%>
</div>

</body>
</html>