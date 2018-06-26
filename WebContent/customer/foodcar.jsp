<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.orange.domain.OrderInfo" %>
<%@ page import="com.orange.domain.Store" %>
<%@ page import="com.orange.domain.Order" %>
<%@ page import="com.orange.domain.Food" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="zh">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单</title>
<link href="customer/css/indexshop.css" type="text/css" rel="stylesheet"> 
<link class="usemin" href="customer/css/foodcar1.css" rel="stylesheet">
<link class="usemin" href="customer/css/foodcar2.css" rel="stylesheet"> 
<script type="text/javascript" src="customer/js/index1.js"></script> 
</head>
<body>


<header class="site-topbar" id="topbar" role="banner"> 
   <div class="container"> 
     	<a id="logo"  title="橙子外卖" alt="橙子外卖" role="logo">
     		<h1 ><font color="black">orange</font></h1>
     		<i class="default-logo"></i> </a> 
 		<div id="topbar_search" class="topbar-search" role="search"> 
      		<form id="tsearch_form" class="tsearch-form clearfix" action="/search" method="get"> 
	       		<i class="icon-tsearch"></i> 
	       		<input id="tsearch_input" class="tsearch-input" name="kw" autocomplete="off" placeholder="搜索店内美食" type="text"> 
	       		<i id="ts_loading" class="icon-tloading hide"></i> 
	       		<a id="ts_clear" class="icon-tclear hide"></a> 
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
      		 <div id="topbar_cart" class="eleme_dropdown topbar-widget topbar-cart empty"> 
       			 <a class="e_toggle twidget-toggle"> <span id="tcart_total" class="tcart-total twidget-total">0</span> <i class="icon-tcart"></i> </a> 
       			<div class="e_dropdown twidget-dropdown"> 
        			<div id="tcart_loading" class="twidget-loading"></div> 
        			<div id="tcart_wrapper"></div> 
       			</div> 
      		</div> 
      		<div class="topbar-user-nav tnav-link"> 
       			<a rel="nofollow" href="login.jsp">登录</a> / 
       			<a rel="nofollow" href="register.jsp">注册</a> 
      		</div> 
		</nav> 
		
    </div> 
</header>

<div class="container">  
	<div class="cart-container cart-checkout" id="cart_wrap"> 
    	<header class="checkout-header"> 
     		<div class="group" id="restaurant" data-olpayment="1" data-geo="-614966279988955594" data-restaurant="178405"> 
      			<a title="${oi.store.storeName }" class="crst-logo" href="shop1.jsp" target="_blank"> 
      			<img class="crst-img" src="customer/images/${oi.store.imgUri }"> </a> 
      				<div class="crst-info"> 
       					<a title="${oi.store.storeName }" class="crst-name" href="shop1.jsp" target="_blank">${oi.store.storeName }</a>       
       					<p class="crst-flavor"><br>${oi.store.type }</p> 
      				</div> 
     		</div> 
     		<ol class="cart-flow"> 
				<li class="cflow-nav first">选择美食 </li>
			    <li class="cflow-nav second">订单信息 </li>
			    <li class="cflow-nav last">完成饿单 </li>
     		</ol> 
    	</header> 
    	<article class="cart-table" id="module_basket"> 
     		<header class="ctable-header group"> 
      			<h2 class="ctable-title">我的购物车</h2> 
      			<span class="ctable-categ">单价</span> 
      			<span class="ctable-categ">数量</span> 
      			<span class="ctable-categ">总计</span> 
     		</header> 
     		
     		
     		<% int i = 0; %>
     		<% String foodList = ""; %>
     		<c:forEach items="${oi.order.foodList }" var="f">
	     		<section class="cart-group cart_group" data-id="<%=i%>"> 
	      			<h3 class="cgroup-title ui_c1"><%=i + 1 %>号</h3> 
	      			<%i++; %>
	      			<ul class="cgroup-list">      
	       				<li class="cgroup-item s_food" data-id="13985256"> 
	        				<div class="cdish-name">${f.foodName } </div> 
	        				<div class="cdish-price symbol-rmb">${f.foodPrice }</div> 
	        				<div class="cdish-modify"> 
	         					<a class="cdish-action desc dec_btn">-</a>
	         						<input class="cdish-qty set_num" type="text" value="${f.count }">
	         							<a class="cdish-action incr inc_btn">+</a> 
	        				</div>        
	        				<div class="cdish-total symbol-rmb">${f.foodPrice * f.count }</div> 
	        					<div class="cdish-del"> 
	         						<a class="del del_btn">×</a> 
	        					</div> 
	        			</li>      
	      			</ul> 
	     		</section> 
	     	</c:forEach> 
	     	
	     	<%
	     		OrderInfo oi = (OrderInfo)request.getAttribute("oi");
	     		List<Food> fl = oi.getOrder().getFoodList();
	     		for(int j = 0; j < fl.size(); j++) {
	     			foodList += fl.get(j).getFoodName() + ":" + fl.get(j).getCount();
	     			if(j < fl.size() - 1) {
	     				foodList += "&";
	     			}
	     		}
	     	 %>
	     	
     	<footer class="ctable-footer group"> 
      		<div class="cart-note" id="module_note"> 
       			<div class="ctable-form group"> 
        			<i class="icon-note"></i> 
        			<input class="ctable-input" id="c_n_text" type="text" maxlength="50" placeholder="给餐厅留言"> 
       			</div>     
      		</div> 
      		<div class="float-r"> 
       			<div class="cart-summary basket_info"> 共${oi.order.totalNum }份美食　应付金额： <span class="symbol-rmb cart-cost" id="total_price_basket">${oi.order.totalPrice }</span> </div> 
      		</div> 
		</footer> 
    </article> 
    <form id="checkout_form" action="${pageContext.request.contextPath }/CreateOrderServlet" method="post"> 
    <div class="relative" id="module_addr"> 
		<div class="cart-module caddress-module group" id="module_address"> 
	    	<h3 class="cmodule-title"><i class="icon-cmodule address"></i>送达地址：</h3> 
	      	<div class="cmodule-content"> 
	       		<!-- <span class="cmodule-info current_addr" data-id="1939846"> 仲恺农业工程学院东沙街24号   345678912 </span>  -->
	       		<input id="sendAddress" type="text" value="" name="sendAddress">
	       		<!-- <span class="cmodule-edit" id="addr_edit">[修改]</span> --> 
	      	</div> 
	     </div> 
    </div> 
    <div class="cart-module cpayment-module group" id="module_payment"> 
     	<h3 class="cmodule-title"><i class="icon-cmodule payment"></i>支付方式：</h3> 
     	<div class="cmodule-content"> 
      		<div class="cart-payment"> 
       			<a class="cpayment-choice&#10;" id="offline_pay_btn" data-payonline="0"> 餐到付款 </a> 
       			<a class="cpayment-choice&#10;" id="online_pay_btn" data-payonline="1">在线支付</a> 
      		</div> 
      	<div class="activity-tip hide" id="activity_discount">在线支付立减<strong id="activity_discount_value">0</strong>元!</div> 
     	</div> 
    </div> 
   
    	    
    	<input type="hidden" value="${oi.store.storeId }" name="storeId">
    	<input type="hidden" value="<%=foodList %>" name="foodList">
    	<input type="hidden" value="${oi.order.totalNum }" name="totalNum">
    	<input type="hidden" value="${oi.order.totalPrice }" name="totalPrice">
    	<input type="submit"  class="ui-btn ui_submit btn-cart-checkout" id="confirm_order"  data-loading="正在提交…" value="确认下单">
    </form> 
	</div> 
</div>
<footer class="site-footer group" role="contentinfo"> 
    <div class="container"> 
    	<p class="sfooter-line"> <a class="sfooter-link">我要开店</a> | <a class="sfooter-link" href="contact.jsp">联系我们</a> | <a class="sfooter-link" >服务条款和协议</a>  | <a class="sfooter-link" >加入我们</a> </p> 
   	    <p class="sfooter-line">版权@orange工作室</p> 
   	</div> 
</footer>     
     

</body>
</html>