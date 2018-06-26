<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>店铺账户信息</title>
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
	
	
    <p style="font-size:17px;padding:5px 60px;">>>我的账户>>
    <a href="${pageContext.request.contextPath }/store/storeinfomodify.jsp" style="font-size:17px;padding:5px 5px;">商家信息修改</a>
    <a href="${pageContext.request.contextPath }/logoutServlet">商家退出</a>
    </p>
    <hr/>
    <table cellspacing="0" class="infocontent">
		<tr>
			<td>
				
						<table width="100%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">商家名称：</td>
								<td style="width:40%; padding-left:20px">${store.storeName}</td>
								<td>&nbsp;</td>


							</tr>
							<tr>
								<td style="text-align:right">联系方式：</td>
								<td style="padding-left:20px">${store.telephone}</td>
							</tr>
							<tr>
								<td style="text-align:right">商家邮箱：</td>
								<td style="padding-left:20px">${store.email}</td>
							</tr>
							<tr>
								<td style="text-align:right">商家地址：</td>
								<td style="padding-left:20px">${store.address}</td>
							</tr>
							<tr>
								<td style="text-align:right">商家商品类型：</td>
								<td style="padding-left:20px">${store.type}</td>
							</tr>
							<tr>
								<td style="text-align:right">营业时间：</td>
								<td style="padding-left:20px">${store.openTime}</td>
							</tr>
							<tr>
								<td style="text-align:right">送餐时间：</td>
								<td style="padding-left:20px">${store.sendTime}</td>
							</tr>
							<tr>
								<td style="text-align:right">配送费：</td>
								<td style="padding-left:20px">${store.sendCost}</td>
							</tr>
							<tr>
								<td style="text-align:right">商家头像：</td>
								<td style="padding-left:20px"><img alt="" src="${store.imgUri}" width="100px" height="100px"></td>
							</tr>
							<tr>
								<td style="text-align:right">商家订单量：</td>
								<td style="padding-left:20px">${store.order_num}</td>
							</tr>
							<tr>
								<td style="text-align:right">商家介绍：</td>
								<td colspan="2"><textarea class="textarea" name="introduce">${store.description}</textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align:right">注册时间：</td>
								<td style="padding-left:20px">${store.registime}</td>
							</tr>
							
							<tr>
								<td style="text-align:right">&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>

						<p style="text-align:center">&nbsp;</p>
					</td>
			</tr>
		</table>
		</div>
    <jsp:include page="foot.jsp" />
</body>
</html>