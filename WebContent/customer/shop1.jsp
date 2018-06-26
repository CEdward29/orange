<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="js flexbox canvas no-touch geolocation history rgba backgroundsize boxshadow cssanimations csscolumns cssgradients csstransforms csstransforms3d csstransitions no-localstorage no-sessionstorage svg placeholder lastchild">

<head lang="zh">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${store.storeName }</title>
<link href="customer/css/shop1.css" type="text/css" rel="stylesheet">
<link href="customer/css/indexshop.css" type="text/css" rel="stylesheet">  
<link href="customer/css/shop11.css" type="text/css" rel="stylesheet">
<link href="customer/css/car.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="customer/js/index1.js"></script>
<script src="customer/jquery/jquery-2.1.0.min.js"></script>

<script type="text/javascript">
	
	var totalnum = 0;//商品总数量
	var totalPrice = 0;//商品总价格
	
	function total() {
		//更新总数量
		$(".fl.txt-count").each(function(){
			//alert("1");
			totalnum += parseInt($(this).val());
			//alert($(this).val());
		});
		//更新总价格
		$(".fr.pri").each(function(){
			//alert($(this).text());
			var t = $(this).text().substring(1);
			totalPrice += parseFloat(t);
			//alert(totalPrice);
		});
		$(".bill").text(totalPrice);
		$("#totalnumber").text(totalnum);
		totalnum = 0;
		totalPrice = 0;	
	}
	
	function changeFoodNum(a, text) {
		//alert(text);
		//alert(a.previousElementSibling.value);
		//alert(a.parentNode.nextElementSibling.childNodes[0].innerText);
		
		//alert(foodPrice);
		//获得价格
		var t = a.parentNode.nextElementSibling.childNodes[0].innerText;
		var foodPrice = parseFloat(t.substring(1));
		var foodNum;
		
		if(text == '+') {
			//修改商品数量
			foodNum = parseInt(a.previousElementSibling.value) + 1;
			a.previousElementSibling.value = foodNum;
			//修改价格
			foodPrice = foodNum * foodPrice / (foodNum - 1);
			a.parentNode.nextElementSibling.childNodes[0].innerText = "￥" + foodPrice;
			total();
		} else{
			var t2 = parseInt(a.nextElementSibling.value);
			if(t2 != 1){
				//修改商品数量
				foodNum = t2 - 1;
				a.nextElementSibling.value = foodNum;
				//修改价格
				foodPrice = foodNum * foodPrice / (foodNum + 1);
				a.parentNode.nextElementSibling.childNodes[0].innerText = "￥" + foodPrice;
				
				total();
			} else {
				//alert("1");
				//alert(a.parentNode.parentNode.innerHTML);
				//foodNum = t2 - 1;
				//alert(a.parentNode.nextElementSibling.childNodes[0].innerText.substring(1));
				//alert(parseFloat($(".bill").text()));
				var p1 = a.parentNode.nextElementSibling.childNodes[0].innerText.substring(1);
				p1 = parseFloat(p1);
				var p2 = parseFloat($(".bill").text());
				var p3 = p2 - p1;
				$(".bill").text("￥" + p3);
				
				
				$("#totalnumber").text($("#totalnumber").text() - 1);
				a.parentNode.parentNode.innerHTML = "";
				
				//修改商品数量
				foodNum = t2 - 1;
				a.nextElementSibling.value = foodNum;
				//修改价格
				foodPrice = foodNum * foodPrice / (foodNum + 1);
				a.parentNode.nextElementSibling.childNodes[0].innerText = "￥" + foodPrice;
				
				
			}
		}
	}
	
	$(document).ready(function() {
		
		//totalPrice = parseFloat($(".bill").text());
		//totalnum = parseInt($("#totalnumber").text());
		//alert(totalPrice);
		//alert(totalnum);
		//$(".bill").text(totalPrice);
		//$("#totalnumber").text(totalnum);
		
		$(".addToCart").click(function() {
			//alert($(this).parent().parent().prev().prev().children().children().next().text());
			//alert($(this).prev().children("span.price symbol-rmb").text());
			//alert($(this).prev().children().eq(1).text());
			//var n = 0;
			
			var username = $("#un").val();
			//alert(username);
			if(username == "") {
				alert("请先登录");
				window.location.href = "customer/login.jsp";
			}
			
			var foodName = $(this).parent().parent().prev().prev().children().children().next().text();
			var foodPrice = $(this).prev().children().eq(1).text();
			var footItem = "<li class='clearfix  food-431112897_470953543' data-fid='431112897' data-fkey='431112897_470953543'>"  
  	      		+	"<div class='fl na clearfix' title='"+ foodName +"'>"    
  	      		+		"<div class=''>" + foodName + "</div>" 
  	      		+		"<input name='foodName' type='hidden' value='" + foodName + "'> "
  	      		+	"</div>"    
  	      		+	"<div class='fl modify clearfix'>"    
  	      		+		"<a href='javascript:void(0);' class='fl minus' onclick='changeFoodNum(this,this.innerText)'>-</a>"    
  	      		+		"<input name='foodCount' class='fl txt-count' value='1' maxlength='2' type='text'>"    
  	      		+		"<a href='javascript:void(0);' class='fl plus' onclick='changeFoodNum(this,this.innerText)'>+</a>"  
  	      		+	"</div>"  
  	      		+	"<div><span class='fr pri'>¥" + foodPrice + "</span></div>"
  	      		+"</li>"; 
			$("#foodList").after(footItem);
			
			//更新总数量
			$(".fl.txt-count").each(function(){
				//alert("1");
				totalnum += parseInt($(this).val());
				//alert($(this).val());
			});
			//更新总价格
			$(".fr.pri").each(function(){
				//alert($(this).text());
				var t = $(this).text().substring(1);
				totalPrice += parseFloat(t);
				//alert(totalPrice);
			});
			$(".bill").text(totalPrice);
			$("#totalnumber").text(totalnum);
			totalnum = 0;
			totalPrice = 0;
			//n++;
			//alert(parseInt("1") + parseInt("2"));
			//alert($("#foodList").next().html());
		});
		
		$(".clear-cart").click(function() {
			$("#foodList").parent().html("<input id='foodList' type='hidden'>");
		});
		
		
	});
</script>
 
</head>

<body >

<header class="site-topbar" id="topbar" role="banner"> 
<input id="un" type="hidden" value="${sessionScope.user.username }"></input>
   <div class="container"> 
     	<a id="logo"  title="橙子外卖" alt="橙子外卖" role="logo">
     		<h1 ><font color="black">orange</font></h1>
     		<i class="default-logo"></i> </a> 
 		<div id="topbar_search" class="topbar-search" role="search"> 
      		<form id="tsearch_form" class="tsearch-form clearfix" action="/search" method="get"> 
	       		<i class="icon-tsearch"></i> 
	       		<input id="tsearch_input" class="tsearch-input" name="kw" autocomplete="off" placeholder="搜索店内美食" type="text"> 
	       		<i id="ts_loading" class="icon-tloading hide"></i> 
	       		<a id="ts_clear" class="icon-tclear hide"></a> 
      		</form> 
      		<div id="tsearch_autocomplete" class="tsearch-autocomplete"></div> 
     	</div> 
     	<nav class="topbar-nav" role="navigation"> 
      		<ul class="topbar-site-nav"> 
       			<li><a class="tnav-link" rel="nofollow" href="index.jsp">首页</a></li> 
       			<li><a class="tnav-link" rel="nofollow" href="order.jsp">我的订单</a></li> 
       			<li><a class="tnav-link" rel="nofollow" href="" target="_blank">加盟合作</a></li> 
       			<li><a class="tnav-link" rel="nofollow" href="">我的客服</a></li> 
     		 </ul> 
      		 <div id="topbar_cart" class="eleme_dropdown topbar-widget topbar-cart empty"> 
       			 <a class="e_toggle twidget-toggle"> <span id="tcart_total" class="tcart-total twidget-total">0</span> <i class="icon-tcart"></i> </a> 
       			<div class="e_dropdown twidget-dropdown"> 
        			<div id="tcart_loading" class="twidget-loading"></div> 
        			<div id="tcart_wrapper"></div> 
       			</div> 
      		</div> 
      		<div class="topbar-user-nav tnav-link"> 
       			<a rel="nofollow" href="login.jsp">登录</a> / 
       			<a rel="nofollow" href="register.jsp">注册</a> 
      		</div> 
		</nav> 
		
    </div> 
</header>

<div class="restaurant-header"> 
	<div class="container rst_header_con"> 
    	<article class="rst-header-main rst-header-toggle rst_info_header" itemtype="http://schema.org/Restaurant" itemscope=""> 
    	<header class="rst-header-info group"> 
        <a class="rst-logo" href="/kxljmlt-pt" itemprop="url"> 
      		<img class="rst-logo-img" alt="Q堡堡" itemprop="logo" src="customer/images/${store.imgUri }">       		
        </a>  
		<div class="rst-basic-info"> 
       		<div class="rst-name-wrapper caret"> 
        		<a title="Q堡堡" class="rst-name text-overflow" href="shop1.jsp" itemprop="name" data-toggle="bs-tooltip">${store.storeName }</a> 
       		</div> 
       		<div class="rst-misc"> 
        		<a class="rst-rating" id="rst_rating" href="/kxljmlt-pt/rating"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star half">★</i><i class="glyph-rating-star off">★</i></span> 4.4 </a> 
        		<span title="西式" class="rst-flavor text-overflow">${store.type }</span> 
       		</div> 
		</div> 
      	</header> 
     	<div class="rst-header-detail rst-header-dropdown"> 
		<section class="rst-header-rating group"> 
       		<div class="rating-point header" itemtype="http://schema.org/AggregateRating" itemscope="" itemprop="aggregateRating"> 
        	<a class="point"><span itemprop="ratingValue">4.4</span></a> 
        	<a class="comment" href="/kxljmlt-pt/rating"><span itemprop="reviewCount">495</span>人评价</a> 
       		</div> 
       		<ul class="rating-diagram header"> 
		        <li class="diagram-item"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i></span> <span class="bar" style="width: 89.1px;"></span> 81% </li> 
		        <li class="diagram-item"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star off">★</i></span> <span class="bar" style="width: 5.5px;"></span> 5% </li> 
		        <li class="diagram-item"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i></span> <span class="bar" style="width: 2.2px;"></span> 2% </li> 
		        <li class="diagram-item"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i></span> <span class="bar" style="width: 0px;"></span> 0% </li> 
		        <li class="diagram-item"> <span class="rating-stars"> <i class="glyph-rating-star">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i><i class="glyph-rating-star off">★</i></span> <span class="bar" style="width: 13.2px;"></span> 12% </li> 
	       </ul> 
		</section> 
	    <section class="rst-header-intro">  ${store.description } </section> 
			<ul class="rst-header-list"> 
	       		<li><span class="item">时间：</span>${store.openTime }</li> 
	       		<li><span class="item">地址：</span><span itemprop="address">${store.address }</span></li> 
	      	</ul> 
     	</div> 
	    </article> 
	    <nav class="rst-header-nav"> 
		     <a class="rst-header-nav-item ui_active" href="shop1.jsp">菜单</a> 
		     <a class="rst-header-nav-item" href="comments.jsp">评价</a> 
		     <a class="rst-header-nav-item" href="message.jsp">留言</a> 
	    </nav> 
    	<div class="rst-fav-wrapper"> 
     		<div class="rst-block rst-fav" id="rst_fav"> 
      			<i class="glyph">♥</i> 
      			<span class="status" data-faved="已收藏" data-unfaved="收藏 餐厅">收藏 餐厅</span> 
     		</div> 
    	</div> 
	</div> 
</div>

<div class="container"> 
	<article class="restaurant-main" id="rst_menus">  
    	<div class="rst-block" id="cate_view">   
     		<section id="cate_view_920304"> 
      			<h2 title="点套餐送可乐" class="menu_title rst-menu-title">点套餐送可乐</h2>     
     		</section>     
     		<section id="cate_view_887211"> 
      			<h2 title="点餐区" class="menu_title rst-menu-title">点餐区</h2>
      			<c:forEach items="${store.food }" var="f">
	      			<ul class="rst-menu-list">  
		       			<li class="rst-dish-item eleme_view" id="food_view_10766783"> 
			        		<div class="rst-d-info">        
			         			<p class="rst-d-main" >         
				         			<a title="收藏" class="dish-favor-flat favor_btn">♥</a>
				         			<a title="${f.foodName }" class="rst-d-name food_name">${f.foodName }</a>
				         			<div><img height="85" width="85" src="customer/images/${f.foodUri }" /></div>
			         			</p>
				        	</div> 
			        		<div class="rst-d-note">
			         			<span class="rst-d-ordered dish_state hide">
			         			</span>
			        		</div> 
			        		<div class="rst-d-action r_d_a">
		         				<div class="rst-d-act act_btns">
		          					<a title="点击饿一份" class="rst-d-act-add add_btn" role="button" ubt-click="add_cart">
		          					<span class="rst-d-act-glyph"></span>
		          					<span class="price symbol-rmb">${f.foodPrice }</span></a>          
			         				<input class="addToCart" type="button" value="加入购物车">
		         				</div>
		        			</div> 
		        			<div class="rst-d-status cmt_block">        
		         				<span class="rst-d-sales">月售${f.salesNum }份</span>
		        			</div>
		        			     			
		        		</li>        
	      			</ul>
      			</c:forEach>
     		</section>
    	</div> 
    </article> 
    
	<aside class="restaurant-aside" id="rst_aside"> 
    	<section class="rst-block restaurant-board"> 
     		<h3 class="rst-aside-title">店内公告</h3> 
     		<p class="rst-deliver-detail"> <i class="icon-rst-deliver"></i>起送价15<span class="rst_deliver_amount"></span>元。 </p> 
     		<ul class="rst-badge-list"> 
		    	<li class="rst-badge-item"> <i class="icon-rst-badge v v-person"></i> 该商家已通过个人身份认证 </li> 
		      	<li class="rst-badge-item"><i class="icon-rst-badge online-payment"></i>该餐厅支持在线支付</li> 
		      	<li class="rst-badge-item"><i class="icon-rst-badge new-user-discount"></i>新用户首次订餐，可立减15元。(不与其他活动同享)</li> 
		      	<li class="rst-badge-item"><i class="icon-rst-badge extra-discount"></i>在线支付满20减10</li> 
		 	</ul> 
		</section> 
		<section class="rst-block" id="favor_food"></section> 
    	<section class="rst-block hide" id="rec_food"> 
    		<h3 class="rst-aside-title">本周热卖</h3> 
     		<ul class="rst-aside-menu-list" id="weekly_ranking"></ul> 
    	</section>  
    	<section class="rst-block restaurant-board fixed rst_fix_panel"> 
     		<h3 class="rst-aside-title">餐厅公告</h3> 
     		<p class="rst-deliver-detail"> <i class="icon-rst-deliver"></i>起送价<span class="rst_deliver_amount"></span>元。 </p> 
    	</section> 
   </aside> 
   <div class="restaurant-cart" id="rst_cart"></div> 
</div>

<div class="shopping-cart clearfix" data-status="1" data-poiname="Q堡堡" data-poiid="144703063152442919">
	<form method="post" action="${pageContext.request.contextPath }/ShowFoodCartInfoServlet" id="shoppingCartForm" >
    	<div class="first-to-app clearfix j-first-to-app" style="top: -249px;">
            <span class="fl">电脑下单不享优惠了哦，优惠活动手机专享~</span>
        </div>
  	    <div class="order-list" style="top: -204px;">
  	    	<div class="title">
            	<span class="fl buy-title">购物车</span>
  	        		<span class="fr dishes"><a href="javascript:;" class="clear-cart">清空菜品</a></span>
  	      	</div>
  	      	<ul style="height: 63px; overflow: auto;">
  	      		<input id="foodList" type="hidden">
  	      		
  	      	</ul>
  	      	<div class="other-charge">  	        
  	        	<div class="clearfix delivery-cost">
  	          		<span class="fl">配送费(不计入起送价)</span>
  	          		<span class="fr shippingfee">¥1</span>
  	        	</div>
  	     	</div>
  	      	<div class="privilege hidden" style=""></div>
  	      	<div id="total" class="total">共<span id="totalnumber" class="totalnumber">0</span>份，总计<span id="bill" class="bill">0</span></div>
		</div>
  	    <div class="footer clearfix">
          	<div class="logo icon fl"></div>
          	<div class="brief-order fl" style="display: none;">
            	<span class="count">1</span>
            	<span class="price"><i>¥</i>15</span>
          	</div>
          	<div class="fr">
           		<a class="ready-pay borderradius-2" href="javascript:;" style="display: none;">差<span data-left="20" class="margintominprice">0</span>元起送</a>
            	<input class="go-pay borderradius-2" value="立即下单" style="display: inline-block;" type="submit">
            	<input value="{&quot;poi&quot;:&quot;144703063152442919&quot;,&quot;foods&quot;:[{&quot;sku&quot;:470953543,&quot;attrs&quot;:[],&quot;num&quot;:1}]}" class="order-data" name="shop_cart" type="hidden">
          	</div>
		</div>    
		<input type="hidden" name="storeId" value="${store.storeId }">   						
	</form>
</div>

<footer class="site-footer group" role="contentinfo"> 
   	<div class="container"> 
    	<p class="sfooter-line"> <a class="sfooter-link">我要开店</a> | <a class="sfooter-link" href="contact.jsp">联系我们</a> | <a class="sfooter-link" >服务条款和协议</a>  | <a class="sfooter-link" >加入我们</a> </p> 
   	    <p class="sfooter-line">版权@orange工作室</p> 
   	</div> 
</footer>




</body>