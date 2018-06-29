<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题库与考试系统</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public_style.css"> 
	<%
		if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
			out.println("<script >alert('" + request.getAttribute("result")
					+ "');</script>"); //页面显示提示信息    	
		}
		//查询所有文件信息
	%>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	  	<div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
		      	<a class="navbar-brand" href="#"><img alt="Brand" src="images/logo.png">题库与考试系统</a>
		    </div>
	  	</div><!-- /.container-fluid -->
	</nav>   
	<div class="container content">
		<div class="row form_center">
			<div class="col-md-6"></div>
			<div class="col-md-4 form_login">
				<form class="layui-form" action="login" method="post">
					<div class="login_title">
						<h3>用户登录</h3>
					</div>
					<!-- 输入用户名 -->
					<input type="text" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input user_input" name="user_name" />
					<!-- 输入密码 -->
					<input type="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input pwd_input" name="password" />
					<div class="layui-input-block">
						<li>
							<input type="text" id = "input" value="" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class=" layui-input verify_code_input" name="vcode" />
						</li>
						<li>
							<input type = "button" id="code" onclick="createCode()" class="layui-input-inline" />
							<input type = "text" id = "unsafe_vcode" name = "unsafe_vcode" hidden = "hidden" />
						</li>
					</div>
					<div class="layui-input-block">
					    <select name="character" lay-filter="aihao">
					        <option value="0">管理员</option>
					        <option value="1" selected="">教师</option>
					        <option value="2">学生</option>
					        <option value="3">其他</option>
					    </select>
					</div>
					<!--登录和注册按钮-->
					<button class="layui-btn" autocomplete="onclick" lay-submit="" lay-filter="">登 录</button>
				</form>
				<a href="register.jsp"><button class="layui-btn" autocomplete="onclick" lay-submit="" lay-filter="" style="background-color: #999999;margin-top: 5px;">注 册</button></a>
			</div>
			<div class="col-md-2"></div>
		</div>
		<!--底部内容 -->
		<div class="content-bottombar" style="margin-top: 220px;">
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
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/verify_code.js"></script>
	<script>
       layui.use('form', function(){
			  var form = layui.form
		});
    </script>
</body>
</html>