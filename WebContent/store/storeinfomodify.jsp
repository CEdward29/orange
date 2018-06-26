<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家信息管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/main.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>

</head>
<body>
	<div style="background:#fff">
	
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
		<tr>
			<td>
				<form action="${pageContext.request.contextPath }/modifySUserServlet" method="post" >
					<input type="hidden" name="storeId" value="${store.storeId }">
						<table width="100%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">商家名称：</td>
								<td style="width:40%; padding-left:20px">
									<input type="text" name="storeName" value="${store.storeName}" class="textinput"/>
								</td>
								<td>&nbsp;</td>


							</tr>
							
							<tr>
								<td style="text-align:right">密码：</td>
								<td style="width:40%; padding-left:20px">
									<input type="password" name="password" class="textinput" value="${store.password }"/>
								</td>
								<td><font color="#999999">密码设置至少6位，请区分大小写</font>
								</td>
							</tr>
							<tr>
								<td style="text-align:right">邮箱：</td>
								<td style="width:40%; padding-left:20px">
									<input type="text" name="email" value="${store.email}" class="textinput"/>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">地址：</td>
								<td style="width:40%; padding-left:20px">
									<input type="text" name="address" value="${store.address}" class="textinput"/>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">联系方式：</td>
								<td colspan="2" style="width:40%; padding-left:20px">
									<input name="telephone" type="text" value="${store.telephone}" class="textinput" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right">配送时间：</td>
								<td colspan="2" style="width:40%; padding-left:20px">
									<input name="sendTime" type="text" value="${store.sendTime}" class="textinput" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right">配送费：</td>
								<td colspan="2" style="width:40%; padding-left:20px">
									<input name="sendCost" type="text" value="${store.sendCost}" class="textinput" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right">营业时间：</td>
								<td colspan="2" style="width:40%; padding-left:20px">
									<input name="openTime" type="text" value="${store.openTime}" class="textinput" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right">商家类型：</td>
								<td colspan="2" style="width:40%; padding-left:20px">
									<input name="type" type="text" value="${store.type}" class="textinput" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right">店铺头像：</td>
								<td style="width:40%; padding-left:20px">
									<img alt="" src="${store.imgUri }" style="width:60px;height:60px;">
									<input type="file" name="imgUri" size="30" value="${store.imgUri }"/>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">店铺介绍：</td>
								<td colspan="2">
									<textarea class="textarea" name="description">${store.description}</textarea>
								</td>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td style="text-align:right">&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							
						</table>





						<p style="text-align:center">

							<input type="image" src="images/botton_gif_025.gif" border="0">

						</p>
						<p style="text-align:center">&nbsp;</p>
					</form></td>
			</tr>
		</table>
		
	</div>
    <jsp:include page="foot.jsp" />
</body>
</html>