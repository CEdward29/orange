<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>商家信息修改成功</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/store/css/main.css" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath }/store/js/my1.js">
	
</script>
</head>

<body class="main" onload="startSecond()">




	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98"><img
								src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000">修改用户信息成功！</font><br />
								<br /> <a href="${pageContext.request.contextPath }/store/store_login.jsp"><span id="second">5</span>秒后自动退出登录，请重新登录</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp"></jsp:include>


</body>
</html>
