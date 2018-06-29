<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >

<%@page import="bean.userInfor" %>

<%
	Object o=request.getAttribute("user");
	userInfor user=null;
	if(o!=null){
		user=(userInfor)o;
		int question_type_id=user.getQuestion_type_id();
		String question_type_name=user.getQuestion_type_name();
%>
	<table style="margin-left:auto;margin-right:auto;">	
		<form id="form1" name="form1" method="post" action="AQTypeUpdate2">
		    <tr>
			    <td class="subtitle">试题类型编号：</td>
			    <td><%=user.getQuestion_type_id() %><input name="question_type_id" type="hidden" id="username" value="<%=user.getQuestion_type_id() %>"/></td>
			</tr>
			<tr>
			    <td class="subtitle">试题类型名称：</td>
			    <td><input name="question_type_name" type="text" value="<%=user.getQuestion_type_name() %>"/></td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="submit" name="Submit" value="提交" />
				    <input type="reset" name="Submit2" value="重置" />
			    </td>
			</tr>
		</form>
	</table>
<%		
	}
%>

</body>
</html>