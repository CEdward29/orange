<%@ page import="com.orange.domain.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>接收订单</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/main.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>
</head>
<body>
	<div style="background:#fff; height:600px;">

        <div id="headdiv">
        	<div id="headone">
        		<h1>Orange</h1>
        	</div>

        	<div id="headtwo">
        		<input type="text" value="欢迎你：${store.storeName }" style="width:250px;">
        	</div>

        	<div id="headthree">
        		<table>
        			<tr>
        				<td><a href="${pageContext.request.contextPath }/store/index.jsp">首页&nbsp;|&nbsp;</a></td>
        				<td><a href="${pageContext.request.contextPath }/checkOrderServlet">订单管理&nbsp;|&nbsp;</a></td>
        				<td><a href="${pageContext.request.contextPath }/findAllfoodServlet">商品管理&nbsp;|&nbsp;</a></td>
        				<td><a href="${pageContext.request.contextPath }/findStoreByIdServlet?storeId=${store.storeId}">账户管理&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
        				<td><a href="${pageContext.request.contextPath }/store/store_login.jsp">登录/</a></td>
        				<td><a href="${pageContext.request.contextPath }/store/store_registe.jsp">注册</a></td>
        			</tr>
        		</table>
        	</div>
        </div>
        <div class="clear"></div>
        <hr/>


	<table cellspacing="0" class="infocontent">
		<tr style="float:right;padding:5px 20px;">
			<td><input class="button_ok" type="button" onclick="history.go(-1)" value="返回" /></td>
		</tr>
		<tr>
			<td style="padding:20px">
				<table width="100%" border="0" cellspacing="0" class="tableopen">
					<tr>
						<td bgcolor="#FFF68F" class="tableopentd01">订单号</td>
						<td bgcolor="#FFD700" class="tableopentd01">顾客</td>
						<td bgcolor="#FFC125" class="tableopentd01">订单时间</td>
						<td bgcolor="#FFB90F" class="tableopentd01">状态</td>
						<td bgcolor="#FFFF00" class="tableopentd01">操作</td>
					</tr>

					<tr>
						<td class="tableopentd02">${order.orderId }</td>

						<td class="tableopentd02">tom</td>
						<td class="tableopentd02">${order.orderDate }</td>
						<td class="tableopentd02">已接单</td>
						<td class="tableopentd03"><a href="${pageContext.request.contextPath }/sendServlet?orderId=${order.orderId}">送餐</a>&nbsp;&nbsp;
						</td>
					</tr>
									
					
				</table>
			</td>
		</tr>
		
	</table>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	</div>
	<div style="height:150px;">
	<%@include file="foot.jsp"%>
	</div>
</body>
</html>