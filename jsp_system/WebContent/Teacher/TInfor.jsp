<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题库与考试系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flyPanels.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public_style.css">
	<%
		if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
			out.println("<script >alert('" + request.getAttribute("result")
					+ "');</script>"); //页面显示提示信息    	
		}
	%>
</head>
<body data-debug="true">
<%-- <%	Object user_name=session.getAttribute("user_name"); 
	session.setAttribute("user_name", user_name);  
%> --%>
	<div class="flypanels-container preload">
		<!-- 左侧菜单栏 -->
		<div class="offcanvas flypanels-left">
			<div class="panelcontent" data-panel="treemenu">
				<nav class="flypanels-treemenu" role="navigation">
					<ul>
						<li class="haschildren"><div><a href="#" class="link"><i class="fa fa-gears leftbar-icon"></i>题库管理</a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TNewBank.jsp" class="link">新建题库</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TQuestionManage.jsp" class="link">试题维护</a></div></li>
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="#" class="link"><i class="fa fa-bug leftbar-icon"></i>课程管理</a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TCourseInfor.jsp" class="link">课程信息</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TClassInfor.jsp" class="link">教学班信息</a></div></li>
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="#" class="link"><i class="fa fa-bug leftbar-icon"></i>试卷管理</a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TNewPaper.jsp" class="link">创建试卷</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TPaperList.jsp" class="link">试卷列表</a></div></li>
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="#" class="link"><i class="fa fa-bug leftbar-icon"></i>考试管理</a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TNewTest.jsp" class="link">创建考试</a></div></li>
								<li><div><a href="${pageContext.request.contextPath}/Teacher/TTestSituation.jsp" class="link">考试情况</a></div></li>
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="${pageContext.request.contextPath}/Teacher/TInfor.jsp" class="link"><i class="fa fa-wrench leftbar-icon"></i>个人信息</a></div>
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
						<%-- <%String getName=request.getParameter("user_name"); %> --%>
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
					<form class="layui-form" action="${pageContext.request.contextPath}/updatePassword" method="post">
	  					<h3>修改密码</h3>
						<div class="row" style="margin-top: 30px;">
							<div class="col-md-3"></div>
		  					<div class="col-md-6">
			  					<div class="layui-form-item">
								    <label class="layui-form-label">旧密码</label>
								    <div class="layui-input-block">
								      	<input type="password" name="old_password" lay-verify="title" autocomplete="off" placeholder="请输入旧密码" class="layui-input">
								    </div>
								</div>
								<div class="layui-form-item">
								    <label class="layui-form-label">新密码</label>
								    <div class="layui-input-block">
								      	<input type="password" id="new_password" name="new_password" lay-verify="title" autocomplete="off" placeholder="请输入新密码" class="layui-input">
								    </div>
								</div>
								<div class="layui-form-item">
								    <label class="layui-form-label">新密码</label>
								    <div class="layui-input-block">
								      	<input type="password" name="new_password2" lay-verify="title" autocomplete="off" placeholder="请再次输入新密码" class="layui-input">
								    </div>
								</div>
								<div class="layui-form-item">
								    <div class="layui-input-block">
								    	<button class="layui-btn" lay-submit="" lay-filter="demo1" name="confirm">确认修改</button>
								      	<button type="reset" class="layui-btn layui-btn-primary" name="reset">重置</button>
								    </div>
								</div>
							</div>
							<div class="col-md-3"></div>
						</div>
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
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
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