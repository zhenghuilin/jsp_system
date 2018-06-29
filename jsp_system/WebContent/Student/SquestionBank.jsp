<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题库与考试系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flyPanels.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public_style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SquestionBank.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/kitUtils.js"></script>
	<script src="${pageContext.request.contextPath}/dist/jquery.flypanels.js"></script>
	<script src="${pageContext.request.contextPath}/js/fastclick.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
	<script type="text/javascript">
		function resize(iframeHeight){
			if(iframeHeight<600)
				iframeHeight=600;
			$("#iframe").height(iframeHeight);
			$("#leftBody").css("height",iframeHeight); 
		}
		function loadSrc(url){
			$.cookie('nowUrl', url, { expires: 1 }); 
			$("#iframe").attr("src",url+".jsp");
		}
        $(document).ready(function() {
			nowUrl=$.cookie('nowUrl');
			if(nowUrl==""||nowUrl==null){
				loadSrc("SingleOption");
			}else{
				loadSrc(nowUrl);
			}
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
						<li class="haschildren"><div><a href="Scourse.jsp" class="link"><i class="fa fa-gears leftbar-icon"></i>所学课程<span class="caret"></span></a></div>
						</li>
						<li class="haschildren"><div class="link"><a href="#" class="link"><i class="fa fa-bug leftbar-icon"></i>关于考试<span class="caret"></span></a> <a href="#" class="expand"><i class="fa icon"></i></a></div>
							<ul>
								<li><div><a href="Sexamtask.jsp" class="link">考试任务</a></div></li>
								<li><div><a href="Sexamscore.jsp" class="link">考试成绩</a></div></li>
							</ul>
						</li>
						<li class="haschildren"><div class="link"><a href="Sinfor.jsp" class="link"><i class="fa fa-wrench leftbar-icon"></i>个人信息<span class="caret"></span></a></div>
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
					<div id="mainBody">
						<div id="leftBody">
							<ul>
								<li class="li1" onclick="loadSrc('SingleOption')">单选题</li>
								<li class="li1" onclick="loadSrc('MulOption')">多选题</li>
								<li class="li1">
									<a href="Scourse.jsp">返回课程列表</a>
								</li>
							</ul>
						</div>
						<div id="rightBody">
							<iframe src="" frameborder="0" width="1155" id="iframe"  height="550"></iframe>
							<!--底部内容 -->
							<div class="content-bottombar">
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
			</div>
		</div>
		<!-- flypanels-content  -->
	</div>
</body>
</html>