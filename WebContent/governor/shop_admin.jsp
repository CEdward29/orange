<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
=======
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>美食店列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<<<<<<< HEAD
    <link rel="stylesheet" href="governor/css/font.css">
    <link rel="stylesheet" href="governor/css/xadmin.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190"></script><script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="governor/js/xadmin.js"></script>    
=======
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <link rel="stylesheet" href="..//layui/css/layui.css">
    <script src="https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190"></script><script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="..//layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>    
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
   
</head>
        
<body>
	<div class="x-nav">
    	<span class="layui-breadcrumb" style="visibility: visible;">
        	<a href="">首页</a><span lay-separator="">/</span>
        	<a><cite>导航元素</cite></a>
        </span>
      	<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">刷新</i></a>
	</div>
    <div class="x-body">
		<div class="layui-row">
        	<form class="layui-form layui-col-md12 x-so">
          		<input name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input" type="text">
          		<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon"></i></button>
        	</form>
      	</div>
      	<xblock>
        	<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        	<button class="layui-btn" onclick="x_admin_show('添加美食店','./member-add.html',600,400)"><i class="layui-icon"></i>添加</button>
<<<<<<< HEAD
        	<span class="x-right" style="line-height:40px">共有数据：${spf.totalStore } 条</span>
=======
        	<span class="x-right" style="line-height:40px">共有数据：88 条</span>
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
      	</xblock>
      	<table class="layui-table">
        <thead>
        	<tr>
            	<th>
              		<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
            	</th>
            	<th>申请者</th>
            	<th>美食店名</th>
            	<th>分类</th>
            	<th>联系电话</th>
            	<th>地址</th>
            	<th>申请时间</th>
            	<th>状态</th>
            	<th>操作</th></tr>
       </thead>
       <tbody>
          <tr>
<<<<<<< HEAD
          	<c:forEach items="${spf.stores }" var="s">
	         	<td>	
	             	<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"><i class="layui-icon"></i></div>
	            </td>
	            <td>${s.storeName }</td>
	            <td>${s.storeName }</td>
	            <th>${s.description }</th>
	            <td>${s.telephone }</td>
	            <td>${s.address }</td>
	            <td>${s.registime }</td>
	            <td class="td-status">
	            	<span class="layui-btn layui-btn-normal layui-btn-mini">${s.state == 1?"已通过":"未通过" }</span>
	            </td>
	            <td class="td-manage">
	            	<a style="text-decoration:none" onclick="member_stop(this,id)" href="javascript:;" title="停用">
	            		<i class="layui-icon"></i>
	            	</a>                           
	                <a title="删除" href="javascript:;" onclick="member_del(this,'1')" style="text-decoration:none">
	                	<i class="layui-icon"></i>
	                </a>
	                <a title="通过 " href="${pageContext.request.contextPath }/ChangeStoreStateServlet?storeId=${s.storeId}"  style="text-decoration:none">√
	                	<i class="layui-icon"></i>
	                </a>
	            </td>
         </tr>
         </c:forEach>
    
        </tbody>
      </table>
      <div class="page">
      	<!-- <div>
=======
         	<td>	
             	<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"><i class="layui-icon"></i></div>
            </td>
            <td>小明</td>
            <td>Q堡堡</td>
            <th>汉堡薯条</th>
            <td>232432424</td>
            <td>仲恺农业工程学院食堂二楼</td>
            <td>2018-01-01 11:11:11</td>
            <td class="td-status">
            	<span class="layui-btn layui-btn-normal layui-btn-mini">已通过</span>
            </td>
            <td class="td-manage">
            	<a style="text-decoration:none" onclick="member_stop(this,id)" href="javascript:;" title="停用">
            		<i class="layui-icon"></i>
            	</a>                           
                <a title="删除" href="javascript:;" onclick="member_del(this,'1')" style="text-decoration:none">
                	<i class="layui-icon"></i>
                </a>
            </td>
            
         </tr>
          <tr>
         	<td>	
             	<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"><i class="layui-icon"></i></div>
            </td>
            <td>小明</td>
            <td>Q堡堡</td>
            <th>汉堡薯条</th>
            <td>232432424</td>
            <td>仲恺农业工程学院食堂二楼</td>
            <td>2018-01-01 11:11:11</td>
            <td class="td-status">
            	<span class="layui-btn layui-btn-normal layui-btn-mini">已通过</span>
            </td>
            <td class="td-manage">
            	<a style="text-decoration:none" onclick="member_stop(this,id)" href="javascript:;" title="停用">
            		<i class="layui-icon"></i>
            	</a>                           
                <a title="删除" href="javascript:;" onclick="member_del(this,'1')" style="text-decoration:none">
                	<i class="layui-icon"></i>
                </a>
            </td>
            
         </tr>
        </tbody>
      </table>
      <div class="page">
      	<div>
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">4</a>
          <a class="next" href="">&gt;&gt;</a>
<<<<<<< HEAD
        </div> -->
        <table align="center">
			<tr>
				<td><a style="color: blue"
				href="${pageContext.request.contextPath  }/ShowBackStageStoreInfo?currentPage=${spf.currentPage==1?1:spf.currentPage-1}">&lt;&lt;上一页</a>
				<td>第${spf.currentPage }页/共${spf.totalPage }页
				<td><a style="color: blue"
				href="${pageContext.request.contextPath  }/ShowBackStageStoreInfo?currentPage=${spf.currentPage==spf.totalPage?spf.totalPage:spf.currentPage+1}">下一页&gt;&gt;</a>
			</tr>
		</table>
=======
        </div>
>>>>>>> 047c34315ee6542c6cc3ddff256708651845a444
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

      /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){
              //发异步把用户状态进行更改
              $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="通过"><i class="layui-icon">&#xe62f;</i></a>');
              $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">未通过</span>');
              $(obj).remove();
              layer.msg('已停用!',{icon: 5,time:1000});
          });
      }

      /*用户-启用*/
      function member_start(obj,id){
          layer.confirm('确认要通过吗？',function(index){
              //发异步把用户状态进行更改
              $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
              $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已通过</span>');
              $(obj).remove();
              layer.msg('已通过!',{icon: 6,time:1000});
          });
      }
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  

</body>
</html> 
        
   
    