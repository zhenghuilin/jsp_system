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
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flyPanels.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Scourse.css">
</head>
<body data-debug="true">
<%-- <%	Object user_name=session.getAttribute("user_name"); 
	session.setAttribute("user_name", user_name);  
%> --%>
	<div class="flypanels-container preload">
		<!-- 左侧菜单栏 -->
		<div class="offcanvas flypanels-left">
			<!-- <div id="topbar-title">
				题库与考试系统
			</div> -->
			<div class="panelcontent" data-panel="treemenu">
				<nav class="flypanels-treemenu" role="navigation">
					<ul>
						<li class="haschildren"><div><a href="${pageContext.request.contextPath}/Admin/AQuestionType.jsp" class="link"><i class="fa fa-gears leftbar-icon"></i>题库管理<span class="caret"></span></a></div>
						</li>
						<li class="haschildren"><div class="link"><a href="#" class="link"><i class="fa fa-bug leftbar-icon"></i>用户管理<span class="caret"></span></a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="${pageContext.request.contextPath}/Admin/ACharacter.jsp" class="link">角色管理</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Admin/AUserInfor.jsp" class="link">用户信息</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Admin/AUserCheck.jsp" class="link">用户审核</a></div></li>								
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="${pageContext.request.contextPath}/Admin/AInfor.jsp" class="link"><i class="fa fa-wrench leftbar-icon"></i>个人信息<span class="caret"></span></a></div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		
		<div class="flypanels-main">
			<!-- 导航栏 -->
			<div class="flypanels-topbar">
				<a class="flypanels-button-left icon-menu" data-panel="treemenu" href="#"><i class="fa fa-bars"></i></a>
				<div id="topbar-title">
					题库与考试系统
				</div>
				<!-- 	<a class="flypanels-button-right icon-menu" data-panel="search" href="#"><i class="fa fa-search"></i></a> -->
				<div class=" flypanels-topbar-news">
					</i>
						欢迎：<%=session.getAttribute("name")%>
					<a href="${pageContext.request.contextPath}/login.jsp"><i class="fa fa-sign-out"></i>
					退出</a>
				</div>
			</div>
			<div class="row">
				<div class="empty-div col-md-6"></div>
			</div>
			<div class="flypanels-content">
			<!-- <div class="row"> -->				
				<div class="container">
  					<h3>试题类型</h3>
  					<table class="total-table">
					    <thead>
					        <tr class="task">
					           <th>试题类型编号</th>
							   <th>试题类型名称</th>
							   <th>操作</th>
					        </tr>
					    </thead>
					    <tbody>
						    <%
								inforDAO dao = new inforDAO();
								ArrayList<Map<String, String>> files = dao.queryQuestionTypeAll();
								int i=0;
								for (Map<String, String> file : files) {	
							%>
					        <tr>
					            <td><%=file.get("question_type_id")%></td>
					            <td><%=file.get("question_type_name")%></td>
					            <td>
					            	<a href="AQTypeWatch.jsp?question_type_id=<%=file.get("question_type_id")%>">查看</a>
						            <a href="${pageContext.request.contextPath}/AQTypeUpdate?question_type_id=<%=file.get("question_type_id")%>">修改 </a>
						            <a href="${pageContext.request.contextPath}/AQTypeDelete?question_type_id=<%=file.get("question_type_id")%>"> 删除</a>
					            </td>
					        </tr>
					        <%
							}
							%>
					    </tbody> 		    
					</table>
					
					<form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath}/AddQType" method="post">
						<div class="input-group" style="margin-top:30px;">
							<span class="input-group-addon">试题类型名称</span>
							<input type="text" name="question_type_name" class="form-control" placeholder="请输入需要添加的试题类型名称">
						</div>
						<button class="layui-btn" lay-submit="" style="margin:10px 0 0 1045px;">确认添加</button>
					</form>

					<!--底部内容 -->
					<div class="content-bottombar" style="margin-top:280px;">
						<!-- <div class="row"> -->
							<div class="bottom-link-parent">
								<a href="#" class="bottom-link">帮助</a>
								<a href="#" class="bottom-link">隐私</a>
								<a href="#" class="bottom-link">条款</a>
							</div>
						<div class="row">
							<div class="bottom-link-parent">copyright@2018 Shineonu体验技术部出品</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- flypanels-content  -->
	</div>
	
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/kitUtils.js"></script>
	<script src="${pageContext.request.contextPath}/dist/jquery.flypanels.js"></script>
	<script src="${pageContext.request.contextPath}/js/fastclick.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.flypanels-container').flyPanels({
				treeMenu: {
					init: true
				},
				search: {
					init: true,
					saveQueryCookie: true
				}
			});
			FastClick.attach(document.body);
		});
	</script>
</body>
</html>