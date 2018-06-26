<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="zh">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link href="../css/indexshop.css" type="text/css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet" type="text/css">  
<script type="text/javascript" src="../js/index1.js"></script> 
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
    <div class="wash-paper clearfix" id="profile"> 
    	<nav class="profile-nav"> 
      		<ul class="nav nav-list"> 
       			<li class="active"> <a href="member_index.jsp"> <i class="icon-user "></i> 个人中心 </a> </li> 
       			<li class="divider"></li>
       			<li > <a href="index.jsp"> 返回首页 </a> </li>        
      		</ul> 
     	</nav>       	
     	<div class="main-content"> 
      		<div class="content-header"> 
       			<h2>个人中心</h2> 
      		</div> 
      		<div class="content-inner profile-index"> 
       			<div class="account-status clearfix"> 
        			<div class="clearfix"> 
         				<div class="col-left"> 
          					<div class="avatar"> 
           						<a href="">上传<br>头像</a> 
          					</div> 
          					<div class="safety-level-wrapper"> 
           						<h5>orange</h5> 
           						<p> <span class="text-gray">安全等级： 高 </a> </p> 
          					</div> 
         				</div> 
         				<div class="col-right"> 
          					<p class="text-gray">账户余额：</p> 
          					<div class="account-balance clearfix"> 
           						<div class="balance">
            						<strong>0</strong> 元
           						</div>       
          					</div> 
         				</div> 
         			</div> 
        			<ul class="related-info clearfix"> 
         				<li> <i class="icon-point"></i>积分： 2800点  </li> 
         				<li> <i class="icon-order"></i>完成订单：1</a>张（一个月内完成） </li>          
        			</ul> 
       			</div>  
      		</div>
      		<div class="content-inner profile-address"> 
       			<h3>已经保存的送餐地址</h3> 
       			<table class="address-table table table-bordered"> 
        			<thead> 
				    	<tr> 
				        	<th class="col-address">地址</th> 
				          	<th class="col-phone">手机号码</th> 
				          	<th class="col-phone-bk">备选电话</th> 
				          	<th class="col-action">操作</th> 
				        </tr> 
				   	</thead> 
	        		<tbody> 
				    	<tr class="stable_address"> 
					        <td class="col-address">仲恺农业工程学院东沙街24号</td> 
					        <td class="col-phone">12434425452</td> 
				          	<td class="col-phone-bk"></td> 
				          	<td class="col-action"> <span>默认地址</span> | <a href="">编辑</a> | <a class="gray_link" href="">删除</a> </td> 
				        </tr>        
	        		</tbody> 
       			</table> 
       			<h3>新增/编辑送餐地址</h3> 
       				<form name="address" class="ui-form-horizontal" id="add_address_form" action="/profile/address" method="post"> 
				        <input name="address[id]" id="address_id" type="hidden">
				        <input name="address[_csrf_token]" id="address__csrf_token" type="hidden" value="769532b677c313420e1acb228079d074"> 
				        <input name="address[entry_id]" id="address_entry_id" type="hidden"> 
				        <label for="address_address"><span class="required-mark">*</span>详细地址</label> 
				        <input name="address[address]" id="address_address" type="text"> 
        				<p>（请填写真实详细的送餐地址）</p> 
        				<label for="address_phone"><span class="required-mark">*</span>手机号码</label> 
				        <input name="address[phone]" id="address_phone" type="text"> 
				        <p>（请保证外卖员能打通该号码）</p> 
				        <label for="address_phone_bk">备用电话</label> 
				        <input name="address[phone_bk]" id="address_phone_bk" type="text"> 
				        <p>（备用电话方便外卖员能联系到您）</p> 
				        <div class="ui-form-footer"> 
         					<button class="btn btn-yellow" id="add_address_submit">保存</button>       
        				</div> 
       				</form> 
      			</div> 
     		</div>
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