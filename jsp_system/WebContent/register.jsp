<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题库与考试系统</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="layui/css/layui.css">
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/public_style.css">
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
				<form class="layui-form" action="register" method="post">
					<div class="login_title">
						<h3>用户注册</h3>
					</div>
					<!-- 输入姓名 -->
					<input type="text" name="user_name"  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input user_input">
					<!-- 输入密码 -->
					<input type="password" name="password"  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input pwd_input">
					<div class="layui-input-block">
						<li>
							<input type="text" id = "input" value="" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class=" layui-input verify_code_input" name="vcode">
						</li>
						<li>
							<input type = "button" id="code" onclick="createCode()" class="layui-input-inline" />
						</li>
					</div>
					<button class="layui-btn" onclick = "validate()" lay-submit="" lay-filter="" style="color: #fff;">提 交</button>
				</form>
				<a href="login.jsp" style="float: right;color: #8a8a8a;padding-top: 5px;">已有账号</a>
			</div>
			<div class="col-md-2"></div>
		</div>
		<!--底部内容 -->
		<div class="content-bottombar" style="margin-top: 232px;">
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
	<script src="layui/layui.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/verify_code.js"></script>
	<script>
       layui.use('form', function(){
			  var form = layui.form;
		});
</body>
</html>