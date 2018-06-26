<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单查询列表</title>
<link href="${pageContext.request.contextPath}/store/css/Style.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/index.css" type="text/css"/>
<script language="javascript"
	src="${pageContext.request.contextPath}/store/js/public.js"></script>

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
        				<td><a href="${pageContext.request.contextPath }/checkOrderServlets">订单管理&nbsp;|&nbsp;</a></td>
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
    
    <br>
	
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#FFEC8B" border="0">
			<TBODY>
				
				<tr>
					<td class="ta_01" align="center" bgColor="#FFA500"><strong>查询菜单列表${food_msg }</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#FFEC8B">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #FFEC8B; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #FFA500">
								<td align="center" width="24%">商品编号</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">商品数量</td>
								<td width="8%" align="center">商品类别</td>
								<td width="8%" align="center">商品图片</td>
								<td width="8%" align="center">商品介绍</td>
								<td width="8%" align="center">编辑</td>

								<td width="8%" align="center">删除</td>
							</tr>

								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="23">${food.foodId }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%">${food.foodName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${food.foodPrice}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${food.salesNum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${food.foodType }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${food.foodUri }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${food.foodDescription }</td>
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath }/${pageContext.request.contextPath }/findFoodByIdServlet?foodId=${food.foodId}">
											<img
											src="${pageContext.request.contextPath}/store/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>

									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath }/delFoodServlet?foodId=${food.foodId}">
											<img
											src="${pageContext.request.contextPath}/store/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a>
									</td>
								</tr>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</div>
	<%@include file="foot.jsp"%>
</body>
</html>