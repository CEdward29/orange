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
<title>顾客收货</title>
<link href="customer/css/indexshop.css" type="text/css" rel="stylesheet">
<link href="customer/css/index.css" rel="stylesheet" type="text/css">  
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
       			<a rel="nofollow" href="customer/login.jsp">登录</a> / 
       			<a rel="nofollow" href="customer/register.jsp">注册</a> 
      		</div> 
		</nav> 		
    </div> 
</header>

<div class="container">     
    <div class="wash-paper clearfix" id="profile"> 
    	<nav class="profile-nav"> 
      		<ul class="nav nav-list"> 
       			<li> <a href="customer/member_index.jsp"> <i class="icon-user"></i> 个人中心 </a> </li>        
      		</ul> 
     	</nav>     
     	<c:forEach items="${opi.orderInfos }" var="oi">
	     	<div class="main-content"> 
	      		<div class="content-header"> 
	       			<h2>${oi.order.orderState }</h2>       
	      		</div> 
	      		<div class="content-inner"> 
	       			<div class="order-list"> 
	        			<span id="ref_time"></span> 
	        			<div class="order-block" data-id="12266119358749105"> 
	         				<div class="order-header"> 
	          					<div class="status-wrapper"> 
	           						<div class="status gray"> ${oi.order.orderState }@<a href="http://r.ele.me/ayzhssnzzbql" target="_blank">${oi.store.storeName }</a> </div>          
	          					</div> 
	          					<div class="line-two"> 
	           						<table class="table table-condensed"> 
		            					<tbody> 
		             						<tr> 
								             	<td class="col1"><span class="item-name">订单号:</span> ${oi.order.orderId }</td> 
								              	<td class="col2"><span class="item-name">下单时间:</span><span class="om_time" data-time="2018-06-10 10:03:20">${oi.order.orderDate }</span></td> 
								              	<td class="col3"><span class="item-name">餐厅电话:</span>2313232234</td> 
								            </tr> 
		             						<tr> 
									            <td class="col1"><span class="item-name">订单地址:</span>${oi.order.sendAddress }</td> 
									            <td class="col2"><span class="item-name">联系电话:</span>123324324123</td> 
									            <td class="col3"><span class="item-name">订单备注:</span> </td> 
									        </tr> 
		            					</tbody> 
	           						</table> 
	          					</div> 
	         				</div>           
	         				<div class="order-table-wrapper"> 
	          					<table class="order-table table table-striped"> 
	           						<thead> 
							            <tr> 
							            	<th class="col-name">购物车</th> 
							            	<th class="col-rating"></th> 
							            	<th class="col-price">单价</th> 
							            	<th class="col-quantity">数量</th> 
							            	<th class="col-sub-total">小计</th> 
							            </tr> 
						          	</thead> 
	           						<tbody> 
	           							<c:forEach items="${oi.order.foodList }" var="f">
								            <tr> 
								            	<td class="col-name"> <span>${f.foodName }</span> </td> 
									            <td class="col-rating"><p class="omodule-actions"> </p></td> 
								             	<td class="col-price">￥${f.foodPrice }</td> 
								             	<td class="col-quantity">${f.count }</td> 
								             	<td class="col-sub-total">￥${f.foodPrice * f.count }</td> 
								            </tr>  
							            </c:forEach>           
	           						</tbody> 
	          					</table> 
	          					<table class="order-table total-table table table-striped"> 
	           						<tfoot> 
							            <tr> 
							            	<td class="col-name">合计</td> 
							             	<td class="col-rating"></td> 
							             	<td class="col-price"></td> 
							             	<td class="col-quantity">${oi.order.totalNum }</td> 
							             	<td class="col-sub-total relative">￥${oi.order.totalPrice } </td> 						     		 
							            </tr>            
	           						</tfoot> 
	          					</table>        
	         				</div>       
	         				<p class="omodule-actions"> 
				     			<a class="ui-btn btn-small" href="customer/comment.jsp">评价得金币</a> 
				     			<br>
				     			<br>
				     			<a class="ui-btn btn-small" href="${pageContext.request.contextPath }/ShowStoreInfoServlet"> 返回首页</a> 
	     					</p>
	        			</div> 
	       			</div>  
	      		</div>     
	      	</div> 
	      	<br><br>
      	</c:forEach>
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