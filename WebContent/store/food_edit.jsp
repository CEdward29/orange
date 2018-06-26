<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑菜品</title>
<LINK href="css/Style.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>


</head>
<body>

    <div style="background:#fff;height:500px;">
    
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
        				<td><a href="${pageContext.request.contextPath }/checkOrderServlet?">订单管理&nbsp;|&nbsp;</a></td>
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
    
    <form id="userAction_save_do" action="${pageContext.request.contextPath }/modifyFoodServlet" method="post" >
    	<input type="hidden" name="foodId" value="${food.foodId }">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #999" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#FFA500" colSpan="4"
					height="26"><strong><STRONG>编辑商品品${food_msg }</STRONG> </strong>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#FFEC8B" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="foodName" class="bg" value="${food.foodName }"/>
				</td>
				<td align="center" bgColor="#FFEC8B" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="price" class="bg" value="${food.foodPrice }"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#FFEC8B" class="ta_01">商品数量：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="salesNum" class="bg" value="${food.salesNum }"/>
				</td>
				<td align="center" bgColor="#FFEC8B" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
				<input type="text" name="foodType" class="bg" value="${food.foodType }"/>
				</td>
			</tr>


			<tr>
				<td align="center" bgColor="#FFEC8B" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
				<input
					type="file" name="foodUri" size="30" value=""/>
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#FFEC8B">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
				<textarea name="foodDescription" cols="30" rows="3" style="WIDTH: 96%">${food.foodDescription }</textarea>
				</TD>
			</TR>
			


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#FFEC8B" colSpan="4">
					
					
						
					<input type="submit" class="button_ok" value="确定">	
						
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					
					
					
					<input type="reset" value="重置" class="button_cancel">

					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<span id="Label1">
					
					</span>
				</td>
			</tr>
		</table>
	</form>
	</div>

	<%@include file="foot.jsp"%>
</body>
</html>