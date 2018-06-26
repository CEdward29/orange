<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zh"><head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家登陆页面</title>
<link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath }/store/css/NewFile.css">
<link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath }/store/css/NewFile1.css">
</head> 

 
<body class="page-account">
	<header class="header" >
		<h1>orange | 叫外卖？上橙子外卖！</h1>
	</header>
	<div class="container clrfix"> 
    	<aside class="banner"> 
   			<img class="img" alt="随时随地轻松订餐" src="${pageContext.request.contextPath }/store/images/logo.jpg"> 
    	</aside> 
		<div class="panel"> 
			<div class="panel-hd clrfix" id="login-panel-hd"> 
     			<h3 class="title">
     				商家登录
   	
     			</h3> 
     			
     			<h3>${store_msg }</h3> 
    		</div> 
    		<div class="panel-bd"> 
    			<form class="login-form block" action="${pageContext.request.contextPath }/sloginServlet" method="post"> 
    			<div class="form-item"> 
       				<input class="inputbox error empty" name="storeName" minlength="1" placeholder="商家名称" required="" type="text">
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
    			<div style="color:red;">${state }</div>
    			<br> 
    			</form> 
   				<a class="g-link js_link_register" href="store/store_registe.jsp">我要开店</a>
   				<a class="g-link js_link_register" href="customer/login.jsp">用户登录</a>
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
  	
</body>
</html>