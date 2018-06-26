<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link class="usemin" rel="stylesheet" href="../css/NewFile.css">
<link class="usemin" rel="stylesheet" href="../css/NewFile1.css">
</head>
<body class="page-account">
	<header class="header" >
		<h1>orange | 叫外卖？上橙子外卖！</h1>
	</header>
	<div class="container clrfix"> 
    	<aside class="banner"> 
   			<img class="img" alt="随时随地轻松订餐" src="../images/logo.jpg"> 
    	</aside>  
   		<div class="panel"> 
    		<div class="panel-hd"> 
     			<h2 class="title">忘记密码</h2> 
     			<p class="sub-title-long"></p> 
    		</div> 
    		<div class="panel-bd">    			
     			<form id="forget_password_form" class="form hide block" action="" method="" novalidate="true"> 
      			<fieldset class="account-field"> 
       			<div class="form-item"> 
        			<input id="email_input" class="inputbox" name="email" placeholder="注册邮箱" required="" type="email"> 
        			<div class="g-error-tip hide"></div> 
       			</div> 
       			<div class="form-item clrfix"> 
        			<input id="captcha_input" class="inputbox input-captcha" name="captcha" minlength="4" maxlength="4" placeholder="验证码" autocomplete="off" required="" type="text"> 
        			<div class="g-error-tip hide"></div> 
       			</div>
				<div class="form-item"> 
        			<input class="inputbox" name="password" placeholder="新密码" minlength="6" maxlength="20" required="" type="password"> 
        			<div class="g-error-tip hide"></div> 
       			</div> 
       			<div class="form-item"> 
        			<input class="inputbox" name="repeat" placeholder="确认密码" minlength="6" maxlength="20" required="" type="password"> 
        			<div class="g-error-tip hide"></div> 
       			</div>  
      			<button class="g-btn g-btn-l g-btn-submit btn-individual" type="submit">确认</button> 
     			</form> 
   			 </div> 
    		 <div class="panel-ft"> 
     			<a class="g-link" href="login.jsp">返回登录</a> 
    		</div> 
    		<div id="loading_mask" class="ui-wave-loader-mask hide"> 
     			<i class="ui-wave-loader left"></i> 
			    <i class="ui-wave-loader middle"></i> 
			    <i class="ui-wave-loader right"></i> 
    		</div> 
   		</div> 
   		<div id="hidetip" class="panel panel-success hide"> 
    		<div class="panel-hd clrfix"> 
    			<h2 class="title"><em class="icon-success"></em>重设密码邮件发送成功</h2> 
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