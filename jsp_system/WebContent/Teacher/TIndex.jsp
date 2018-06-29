<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- browser-sync start --server --files "." -->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=yes" />
	<title>题库与考试系统</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flyPanels.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public_style.css">
</head>
<body data-debug="true">
<%	String user_name=request.getParameter("user_name");
	session.setAttribute("user_name", user_name);  
%>
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
  					<div id="container" style="height: 500px"></div>

					<!--底部内容 -->
					<div class="content-bottombar" style="margin-top:80px;">
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
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
	<script type="text/javascript">
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		/*app.title = '坐标轴刻度与标签对齐';*/

		option = {
			title: {
		        text: '最近7次考试平均成绩情况表'
		    },
		    color: ['#3398DB'],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['One', 'Twe', 'Three', 'Four', 'Five', 'Six', 'Seven'],
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'考试成绩',
		            type:'bar',
		            barWidth: '60%',
		            data:[80, 82, 80, 94, 90, 89,70]
		        }
		    ]
		};
		;
		if (option && typeof option === "object") {
		    myChart.setOption(option, true);
		}
       </script>
</body>
</html>