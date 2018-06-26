<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
=======

>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台首页</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<<<<<<< HEAD
    <link rel="stylesheet" href="governor/css/font.css">
	<link rel="stylesheet" href="governor/css/xadmin.css">
	<link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="governor/js/xadmin.js"></script>
=======
    <link rel="stylesheet" href="css/font.css">
	<link rel="stylesheet" href="css/xadmin.css">
	<link rel="stylesheet" href="../layui/css/layui.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="../layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.html">管理员</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
<<<<<<< HEAD
              <dd><a href="governor/g_login.jsp">退出</a></dd>
              <dd><a href="governor/g_login.jsp">消息</a></dd>
=======
              <dd><a href="g_login.jsp">退出</a></dd>
              <dd><a href="g_login.jsp">消息</a></dd>
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>顾客管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
<<<<<<< HEAD
                        <a _href="governor/customer_admin.jsp">
=======
                        <a _href="customer_admin.jsp">
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>顾客列表</cite>
                            
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
<<<<<<< HEAD
                        <a _href="governor/order_admin.jsp">
=======
                        <a _href="order_admin.jsp">
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
     
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>美食店管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
<<<<<<< HEAD
                        <a _href="${pageContext.request.contextPath }/ShowBackStageStoreInfo">
=======
                        <a _href="shop_admin.jsp">
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>美食店列表</cite>
                        </a>
                    </li >
                    
                </ul>
            </li>
            
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
            	<br>
            	<br>			
                <h1 style="font-family:verdana;  text-align: center;">欢迎来到orange橙子外卖后台管理员界面</h1>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright"><p style="text-align:center;"> ©orange工作室</p></div>  
    </div>
    <!-- 底部结束 -->
    <script>
    
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(hm, s);
    })();
    </script>
</body>
</html>