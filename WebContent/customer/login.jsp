<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zh">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<link class="usemin" rel="stylesheet" href="customer/css/NewFile.css">
<link class="usemin" rel="stylesheet" href="customer/css/NewFile1.css">
</head> 

 
<body class="page-account">
	<header class="header" >
		<h1>orange | 叫外卖？上橙子外卖！<a href="${pageContext.request.contextPath }/ShowStoreInfoServlet">先逛逛</a></h1>
	</header>
	<div class="container clrfix"> 
    	<aside class="banner"> 
   			<img class="img" alt="随时随地轻松订餐" src="customer/images/logo.jpg"> 
    	</aside> 
		<div class="panel"> 
			<div class="panel-hd clrfix" id="login-panel-hd"> 
     			<h3 class="title">用户登录
     			
     			</h3> 
    		</div> 
    		<div class="panel-bd"> 
    			<form class="login-form block" id="login_form" novalidate="true" method="post" action="${pageContext.request.contextPath }/LoginServlet"> 
    			<div class="form-item"> 
       				<input class="inputbox error empty" name="username" minlength="5" placeholder="用户名/电子邮箱/手机号" required="" type="text">
       				<div class="g-error-tip hide"></div> 
      			</div>
      			<div class="form-item"> 
       				<input class="inputbox error empty" name="password" minlength="6" maxlength="20" placeholder="密码" required="" type="password"> 
       				
       				<div class="g-error-tip hide"></div> 
      			</div>		
    			<div class="form-helper"> 
    				<label class="login-checkbox"> <input name="remember" class="login-remember" type="checkbox" checked=""> 下次自动登录 </label> 
        			<a class="g-link" href="forget.jsp">忘记密码了？</a> 
    			</div> 
    			<button class="g-btn g-btn-l g-btn-submit" type="submit">登录</button> 
    			<br> 
    			</form> 
   				<a class="g-link js_link_register" href="customer/register.jsp">免费注册</a> 
   				<a class="g-link js_link_register" href="store/store_login.jsp">商家登录</a> 
     			<a class="g-link js_link_register" href="governor/g_login.jsp">管理员登录</a> 
    		</div> 
    		<div class="ui-wave-loader-mask hide" id="loading_mask"> 
    			 <i class="ui-wave-loader left"></i> 
     			 <i class="ui-wave-loader middle"></i> 
     			 <i class="ui-wave-loader right"></i> 
    		</div> 
   		</div> 
 	</div>
    <footer class="site-footer group" role="contentinfo"> 
    	<div class="container"> 
    		<p class="sfooter-line"> <a class="sfooter-link">我要开店</a> | <a class="sfooter-link" href="contact.jsp">联系我们</a> | <a class="sfooter-link" >服务条款和协议</a>  | <a class="sfooter-link" >加入我们</a> </p> 
   	    	<p class="sfooter-line">版权@orange工作室</p> 
   		</div> 
  	</footer>
  	<script class="usemin" src="customer/js/login.js"></script>
  	<script class="usemin" src="customer/js/login1.js"></script>
  

</body>
</html>