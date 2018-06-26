<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="zh">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>店铺列表</title>
<link href="customer/css/index.css" type="text/css" rel="stylesheet">
<link href="customer/css/index2.css" type="text/css" rel="stylesheet" />
<script src="customer/js/index.js"></script>
<script type="text/javascript" src="js/index1.js"></script>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<style type="text/css">

</style>
<script src="jquery/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var username = $("#un").val();
		//alert(username);
		if(username != "") {
			var logout = "<a href='${pageContext.request.contextPath }/LogoutServlet' style='color: blue'>注销</a>";
			$("#userInfo").html("hi," + username + " " + logout);	
		}
		
		
	});
	
</script>

</head>

<body>
	<input id="un" type="hidden" value="${sessionScope.user.username }"></input>
	<div>
		<header id="topbar" role="banner">
		<div class="container clearfix">
			<a id="logo" href="index.jsp" title="橙子外卖" alt="橙子外卖" role="logo">
				<h1>
					<font color="black">orange</font>
				</h1> <i class="default-logo"></i>
			</a>
			<div id="topbar_search" class="topbar-search" role="search">
				<form id="tsearch_form" class="tsearch-form clearfix"
					action="/search" method="get">
					<i class="icon-tsearch"></i> <input id="tsearch_input"
						class="tsearch-input" name="kw" autocomplete="off"
						placeholder="搜索餐厅，美食…" type="text"> <i id="ts_loading"
						class="icon-tloading hide"></i> <a id="ts_clear"
						class="icon-tclear hide"></a>
				</form>
				<div id="tsearch_autocomplete" class="tsearch-autocomplete"></div>
			</div>
			<nav class="topbar-nav" role="navigation">
			<ul class="topbar-site-nav">
				<li><a class="tnav-link" rel="nofollow" href="index.jsp">首页</a></li>
				<li><a class="tnav-link" rel="nofollow" href="order.jsp">我的订单</a></li>
				<li><a class="tnav-link" rel="nofollow" href="" target="_blank">加盟合作</a></li>
				<li><a class="tnav-link" rel="nofollow" href="">我的客服</a></li>
			</ul>
			<div id="topbar_cart"
				class="eleme_dropdown topbar-widget topbar-cart empty">
				<a class="e_toggle twidget-toggle"> <span id="tcart_total"
					class="tcart-total twidget-total">0</span> <i class="icon-tcart"></i>
				</a>
				<div class="e_dropdown twidget-dropdown">
					<div id="tcart_loading" class="twidget-loading"></div>
					<div id="tcart_wrapper"></div>
				</div>
			</div>
			<div id="userInfo" class="topbar-user-nav tnav-link">
				<a rel="nofollow" href="customer/login.jsp">登录</a> / <a rel="nofollow"
					href="customer/register.jsp">注册</a>
			</div>
			</nav>
		</div>
		</header>

		<div class="container">
			<div id="promotion-banner" class="promotion-banner" style="height: 202px;">
				<div class="layui-carousel" id="test10">
					<div carousel-item="">
						<div>
							<img src="customer/images/lunbo1.jpg">
						</div>
						<div>
							<img src="customer/images/lunbo2.jpg">
						</div>
						<div>
							<img src="customer/images/lunbo3.jpg">
						</div>
						<div>
							<img src="customer/images/lunbo4.jpg">
						</div>
						<div>
							<img src="customer/images/lunbo5.jpg">
						</div>
					</div>
				</div>
			</div>

			<div class="row promoted-restaurants restaurants-row">
				<div class="span12 row-wrapper">
					<div class="row">
						<div class="span12">
							<table class="restaurant-list-table">
								<tbody>
									<c:forEach items="${spf.stores }" var="s">
										<tr>
											<div class="restaurant-block">
												<div class="line-one">
													<div class="logo-wrapper">
														<div class="logo">
															<img class="restaurant-logo" alt="${s.storeName }"
																src="customer/images/${s.imgUri }">
														</div>
														<div title="" class="deliver-time-wrapper busy tooltip_on"
															data-toggle="tooltip" data-original-title="餐厅送餐时间超过45分钟">${s.sendTime }分钟
														</div>
													</div>
													<div class="info">
														<div class="name">
															<a class="restaurant-link" href="${pageContext.request.contextPath }/ShowFoodInfoServlet?storeId=${s.storeId }"
																target="_blank">${s.storeName }</a>
														</div>
														<div class="flavors">
															&nbsp;&nbsp;起送：￥${s.sendAtLeast }</br>&nbsp;&nbsp;配送费：￥${s.sendCost }
														</div>
													</div>
												</div>
											</div>
										</tr>
										<hr style="height: 1px; border: none; border-top: 2px double #ff8000;" />

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="layui/layui.js" charset="utf-8"></script>
		<script>
			layui.use([ 'carousel', 'form' ],
					function() {
						var carousel = layui.carousel, form = layui.form;

						//常规轮播
						carousel.render({
							elem : '#test1',
							arrow : 'always'
						});

						//改变下时间间隔、动画类型、高度
						carousel.render({
							elem : '#test2',
							interval : 100,
							anim : 'fade',
							height : '120px'
						});

						//设定各种参数
						var ins3 = carousel.render({
							elem : '#test3'
						});
						//图片轮播
						carousel.render({
							elem : '#test10',
							width : '950px',
							height : '200px',
							interval : 1500
						});

						//事件
						carousel.on('change(test4)', function(res) {
							console.log(res)
						});

						var $ = layui.$, active = {
							set : function(othis) {
								var THIS = 'layui-bg-normal', key = othis
										.data('key'), options = {};

								othis.css('background-color', '#5FB878')
										.siblings().removeAttr('style');
								options[key] = othis.data('value');
								ins3.reload(options);
							}
						};

						//监听开关
						form.on('switch(autoplay)', function() {
							ins3.reload({
								autoplay : this.checked
							});
						});

						$('.demoSet').on('keyup', function() {
							var value = this.value, options = {};
							if (!/^\d+$/.test(value))
								return;

							options[this.name] = value;
							ins3.reload(options);
						});

						//其它示例
						$('.demoTest .layui-btn').on('click', function() {
							var othis = $(this), type = othis.data('type');
							active[type] ? active[type].call(this, othis) : '';
						});
					});
		</script>
		<table align="center">
			<tr>
				<td><a style="color: blue"
				href="${pageContext.request.contextPath  }/ShowStoreInfoServlet?currentPage=${spf.currentPage==1?1:spf.currentPage-1}">&lt;&lt;上一页</a>
				<td>第${spf.currentPage }页/共${spf.totalPage }页
				<td><a style="color: blue"
				href="${pageContext.request.contextPath  }/ShowStoreInfoServlet?currentPage=${spf.currentPage==spf.totalPage?spf.totalPage:spf.currentPage+1}">下一页&gt;&gt;</a>
			</tr>
		</table>
		<footer class="site-footer group" role="contentinfo">
		<div class="container">
			<p class="sfooter-line">
				<a class="sfooter-link">我要开店</a> | <a class="sfooter-link"
					href="contact.jsp">联系我们</a> | <a class="sfooter-link">服务条款和协议</a>
				| <a class="sfooter-link">加入我们</a>
			</p>
			<p class="sfooter-line">版权@orange工作室</p>
		</div>
		</footer>

	</div>

	<script src="js/index3.js"></script>

</body>
</html>