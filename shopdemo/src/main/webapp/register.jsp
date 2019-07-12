<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<!-- 引入表单校验jquery插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}

.error{
	color:red
}
</style>
<!-- 页面加载完毕之后 -->
<script type="text/javascript">
	
	//自定义校验规则
	$.validator.addMethod(
		//规则的名称
		"checkUsername",
		//校验的函数
		function(value,element,params){
			//定义一个标志
			var flag = false;
			//value:输入的内容
			//element:被校验的元素对象
			//params：规则对应的参数值
			//目的：对输入的username进行ajax校验
			$.ajax({
				"async":false,
				"url":"${pageContext.request.contextPath}/checkUsername",
				"data":{"username":value},
				"type":"POST",
				"dataType":"json",
				"success":function(data){
					flag = data.isExist;
				}
			});
			//返回false代表该校验器不通过
			return !flag;
		}
	);


	$(function(){
		$("#myform").validate({
			rules:{
				"username":{
					"required":true,
					"checkUsername":true
				},
				"password":{
					"required":true,
					"rangelength":[6,12]
				},
				"repassword":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"#password"
				},
				"sex":{
					"required":true
				},
				"telphone":{
					"required":true,
					"rangelength":[11,11]
				}
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"checkUsername":"用户名已存在"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"repassword":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
				"telphone":{
					"required":"电话号码不能为空",
					"rangelength":"电话号码长度11位"
				}
			}
		});
	});

</script>

</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>

	<div>
		<form action="${pageContext.request.contextPath}/user?method=register" method="post" id="myform">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="username" id="username"
						placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="password" id="password"
						placeholder="请输入密码">
				</div>
			</div>

			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="repassword" id="repassword"
						placeholder="请输入确认密码">
				</div>
			</div>

			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">电话</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="telphone"
						placeholder="请输入电话">
				</div>
			</div>

			<div>
				<label for="lastname" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					男<input type="radio" name="sex" value="男" id="sex1"> 女<input
						type="radio" name="sex" value="女" id="sex2">
				</div>
			</div>

			<div>
				<div class="col-sm-10">
					<button type="submit" class="btn btn-default">注册</button>
				</div>
			</div>



		</form>
	</div>
</body>
</html>