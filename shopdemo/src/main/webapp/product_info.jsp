<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
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
</style>


<!-- js获取购买的商品的信息--购买数量和购买商品的pid -->
<script type="text/javascript">
	function addCart() {
		var buyNum = $("#quantity").val();
		location.href = "${pageContext.request.contextPath}/product?method=addProductToCart&pid=${product.product_id}&buyNum="
				+ buyNum;
	}
</script>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- 商品详细信息 -->
	<div class="col-sm-8 col-md-8 col-lg-9" style="margin-left: 250px;">
		<div class="row">
			<div class="col-md-6">
				<div>
					<a class="thumbnails"> <img style="height: 430px"
						src="${product.product_image }" alt="图片加载失败" /></a>
				</div>
			</div>

			<div class="col-md-6 prodetail caption product-thumb">
				<h4>
					<a href="javascript:;">${product.product_name }</a>
				</h4>
				<span> <span> <span>￥</span>${product.product_price }
				</span>
				</span>
				<hr>
				<ul class="list-unstyled">
					<li><label>库存:</label> <span> 1000+</span></li>
				</ul>
				<hr>
				<p>${product.product_description }</p>
				<div>

					<div class="form-group">
						<label>购买数量</label> <input id="quantity" name="buyNum" min="1"
							value="1" type="number">
					</div>
					<div class="button-group">
						<div>
							<a href="javascript:;" onclick="addCart()"><span>添加到购物车</span></a>
						</div>
						<c:if test="${!empty currentPage }">
							<div>
								<a
									href="${pageContext.request.contextPath }/product?method=productList&cid=${cid}&currentPage=${currentPage}"><span>返回商品列表</span></a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>