<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>头部显示</title>
</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">

<script src="js/jquery-1.11.3.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<body>

	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<c:if test="${empty loginUser }">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/login.jsp">登录</a>
			</div>
		
		</c:if>
		<c:if test="${not empty loginUser }">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/exit.jsp"><span>${loginUser.user_name }</span></a>
			</div>
		</c:if>
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/register.jsp">注册</a>
		</div>
		
		<div>
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/cart.jsp">购物车</a></li>
				<li><a href="${pageContext.request.contextPath }/product?method=myOrder">我的订单</a></li>				
				<li><a href="${pageContext.request.contextPath }/index.jsp">回到首页</a></li>
			</ul>
		</div>
		
	</nav>

	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<div>
			<ul class="nav navbar-nav" id="categoryUl">
				
			</ul>
		</div>
	</nav>



</body>

<script type="text/javascript">
			//header.jsp加载完毕后 去服务器端获得所有的category数据
			$(function(){
				var content = "";
				$.post(
					"${pageContext.request.contextPath}/product?method=categoryList",
					function(data){
						//[{"cid":"xxx","cname":"xxxx"},{},{}]
						//动态创建<li><a href="#">${category.cname }</a></li>
						for(var i=0;i<data.length;i++){
							content+="<li><a href='${pageContext.request.contextPath}/product?method=productList&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
						}
						
						//将拼接好的li放置到ul中
						$("#categoryUl").html(content);
					},
					"json"
				);
			});
		</script>
</html>