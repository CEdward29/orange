<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>

</head>
<body>
	<div style="background:#FFFFFF;font-size:15px;">
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

    <p class="op">订单管理 ${orderList1_msg }</p>
    <hr class="ophr">
    <div class="divleft">
        <span class="lop">待处理${orderList1_msg }</span>
        <c:forEach items="${orderList1 }" var="o">
        <table class="tb" cellspacing="0">
            <tr>
                <td width="400px"><input type="hidden" name="orderId" value="${o.orderId}">订单${o.orderId}</td>
                <td width="200px"><a href="${pageContext.request.contextPath }/findOrderByIdServlet?orderId=${o.orderId}">订单详情>></a></td>
            </tr>
            <tr>
                <td style="width:85%;align:right;padding:5px;">
                <a href="${pageContext.request.contextPath }/acceptOrderServlet?orderId=${o.orderId}">接单</a></td>
                <td width="15%"><a href="">拒绝</a></td>
            </tr>
        </table>
        </c:forEach>
    </div>
    <div class="clear"></div>
   </div>

    <%@include file="foot.jsp"%>
</body>
</html>