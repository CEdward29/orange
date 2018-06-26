<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>

</head>
<body>
    <div style="background:#fff;">
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
        
        <hr/>
        <div id="s_info">
            <div id="dm">
                <p style="padding:40px 5px;">${store.storeName }</p>
                <img alt="" src="${store.imgUri }">
            </div>
            <div class="clear"></div>
            <hr style="width:80%;align:center;"/>
            <div class="clear"></div>
            <div id="gg">
                <p>公告：</p>
                <p>(${store.openTime })</p>
                <span>${store.description }</span>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <%@include file="foot.jsp"%>
</body>
</html>