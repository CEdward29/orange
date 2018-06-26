<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title>订单列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <script src="https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190"></script><script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
    <link rel="stylesheet" href="..//layui/css/layui.css">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
  
<body>
	<div class="x-nav">
    	<span class="layui-breadcrumb" style="visibility: visible;">
        	<a href="">首页</a><span lay-separator="">/</span> 
        	<a><cite>导航元素</cite></a>
      	</span>
      	<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        	<i class="layui-icon" style="line-height:30px">刷新</i>
        </a>
	</div>
   	<div class="x-body">
		<div class="layui-row">
        	<form class="layui-form layui-col-md12 x-so">         		
          		<div class="layui-input-inline">
          			<select name="contrller">
              			<option>支付状态</option>
              			<option>已支付</option>
              			<option>未支付</option>
            		</select>
            		<div class="layui-unselect layui-form-select">
            			<div class="layui-select-title">
            				<input placeholder="请选择" value="支付状态" readonly="" class="layui-input layui-unselect" type="text">
            				<i class="layui-edge"></i>
            			</div>
            			<dl class="layui-anim layui-anim-upbit">
            				<dd lay-value="支付状态" class="layui-this">支付状态</dd>
            				<dd lay-value="已支付" class="">已支付</dd>
            				<dd lay-value="未支付" class="">未支付</dd>
            			</dl>
            		</div>
				</div>
         		<div class="layui-input-inline">
            		<select name="contrller">
             			<option>支付方式</option>
              			<option>在线支付</option> 
              			<option>餐到付款</option>
            		</select>
            		<div class="layui-unselect layui-form-select">
            			<div class="layui-select-title"><input placeholder="请选择" value="支付方式" readonly="" class="layui-input layui-unselect" type="text">
            				<i class="layui-edge"></i>
            			</div>
            			<dl class="layui-anim layui-anim-upbit">
            				<dd lay-value="支付方式" class="layui-this">支付方式</dd>
            				<dd lay-value="在线支付" class="">在线支付</dd>
            				<dd lay-value="货到付款" class="">货到付款</dd>
            			</dl>
            		</div>
          		</div>
          		<div class="layui-input-inline">
            		<select name="contrller">
              			<option value="">订单状态</option>
              			<option value="0">待确认</option>
              			<option value="1">已确认</option>
              			<option value="2">已收货</option>
              			<option value="3">已取消</option>
              			<option value="4">已完成</option>
              			<option value="5">已作废</option>
            		</select>
            		<div class="layui-unselect layui-form-select">
            			<div class="layui-select-title">
            				<input placeholder="订单状态" value="" readonly="" class="layui-input layui-unselect" type="text">
            				<i class="layui-edge"></i>
            			</div>
            			<dl class="layui-anim layui-anim-upbit">
            				<dd lay-value="" class="layui-select-tips">订单状态</dd>
            				<dd lay-value="0" class="">待确认</dd>
            				<dd lay-value="1" class="">已确认</dd>
            				<dd lay-value="2" class="">已收货</dd>
            				<dd lay-value="3" class="">已取消</dd>
            				<dd lay-value="4" class="">已完成</dd>
            				<dd lay-value="5" class="">已作废</dd>
            			</dl>
            		</div>
          		</div>
          		<input name="username" placeholder="请输入订单号" autocomplete="off" class="layui-input" type="text">
          		<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon"></i></button>
        	</form>
      	</div>
      	<xblock>
        	<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        	<span class="x-right" style="line-height:40px">共有数据：88 条</span>
      	</xblock>
      	<table class="layui-table">
        <thead>
        	<tr>
            	<th>
              		<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
            	</th>
            	<th>订单编号</th>
            	<th>收货人</th>
            	<th>总金额</th>
            	<th>订单状态</th>
            	<th>支付状态</th>
            	<th>发货状态</th>
            	<th>支付方式</th>
            	<th>下单时间</th>
            	<th>操作</th>
           </tr>
        </thead>
        <tbody>
        	<tr>
            	<td>
              		<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2"><i class="layui-icon"></i></div>
            	</td>
            	<td>23243546565</td>
            	<td>老王</td>
            	<td>15.00</td> 
            	<td>待确认</td>
            	<td>未支付</td>
            	<td>未发货</td>
            	<td>在线支付</td>
            	<td>2018-08-17 18:22</td>
            	<td class="td-manage">
              		<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                		<i class="layui-icon"></i>
              		</a>
            	</td>
          	</tr>
       </tbody>
		</table>
    	<div class="page">
        	<div>
          		<a class="prev" href="">&lt;&lt;</a>
          		<a class="num" href="">1</a>
          		<span class="current">2</span>
          		<a class="num" href="">3</a>
          		<a class="num" href="">4</a>
          		<a class="next" href="">&gt;&gt;</a>
        	</div>
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

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
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