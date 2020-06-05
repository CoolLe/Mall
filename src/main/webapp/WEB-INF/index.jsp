<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/16
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/index.css">
    <script>
        $(function () {
            $.getJSON("js/json/class_1.js",function (data) {
                $(data).each(function (i,json) {
                    $("#class_1_ul").append("<li onmouseover='get_class_2(this.value)' value="+json.id+"><a href='javascript:;'>"+json.flmch1+"</li>");
                });
            });
        });

        function get_class_2(class_1_id) {
            $.getJSON("js/json/class_2_"+class_1_id+".js",function (data) {
                $("#class_2_ul").empty();
                $(data).each(function (i,json) {
                    $("#class_2_ul").append("<li value="+json.id+"><a href='goto_list.do?flbh2="+json.id+"' target='_blank'>"+json.flmch2+"</a></li>" );
                });
            });
        }

        function show_list() {
            $("#classificationList").show();
        }

        function hide_list() {
            $("#classificationList").hide();
        }

        function hidden_topbanner() {
            $("#topbanner").hide();
        }

    </script>
    <title>Mall导航</title>
</head>
<body>
    <div class="header">
        <div class="w">
            <div class="fl">
                <!--左盒子-->
                <!--类名为公共类，左浮动-->
                <div class="dt">
                    送至：北京
                    <i><s>◇</s></i>
                </div>
            </div>
            <div class="fr">
                <!--右盒子-->
                <ul>
                    <li>
                        <c:if test="${empty user}">
                            <a href="goto_login.do" target="_blank">你好，请登录</a>
                            <a href="goto_register.do" class="col-red" target="_blank">免费注册</a>
                        </c:if>
                        <c:if test="${not empty user}">
                            <a href="goto_center.do" target="_blank">用户名称:${user.nickname}</a>
                            <a href="logout.do" target="_blank">退出登录</a>
                        </c:if>
                    </li>
                    <li class="line"></li>
                    <!--灰色竖线，添加类“line”-->
                    <li><a href="my_order.do" target="_blank">我的订单</a></li>
                    <li class="line"></li>
                    <li class="xsj">
                        我的京东
                        <i><s>◇</s></i>
                    </li>
                    <li class="line"></li>
                    <li>京东会员</li>
                    <li class="line"></li>
                    <li>企业采购</li>
                    <li class="line"></li>
                    <li class="xsj jd-sj">
                        <em class="sj"></em>
                        手机京东
                        <i><s>◇</s></i>
                    </li>
                    <li class="line"></li>
                    <li class="xsj">
                        关注京东
                        <i><s>◇</s></i>
                    </li>
                    <li class="line"></li>
                    <li class="xsj">
                        客户服务
                        <i><s>◇</s></i>
                    </li>
                    <li class="line"></li>
                    <li class="xsj">
                        网站导航
                        <i><s>◇</s></i>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="topbanner" id="topbanner">
        <!--负责通栏的盒子-->
        <div class="w tp">
            <!--版心-->
            <img src="../img/topbanner.jpg" alt="">
            <!--插入图片-->
            <a href="javascript:hidden_topbanner();" class="close-tpbanner"></a>
            <!--当点击a链接时，不需要打开任何链接，所以href的值用"javacript:;"，可以用JS做交互效果-->
        </div>
    </div>
    <div class="w" style="height: 110px">
        <div class="logo">
            <a href="http://www.jd.com" target="_blank" class="jd-a" title="京东">京东</a>
            <!--标签a里面的字不需要显示，之所以写上内容，是为了搜索引擎优化，增大搜索权重-->
            <div class="db11">
                <a href="#"><img src="../img/dong.gif" alt=""/></a>
                <!--插入动图-->
            </div>
        </div>
        <div class="search">
            <form action="select_list.do" method="post">
                <input type="text" name="content" id="" value="" placeholder="卫衣"/>
                <button type="submit">搜索</button>
            </form>
        </div>
        <div class="shoppingcar">
            <a href="shopping_chart.do" target="_blank">我的购物车</a>
            <span class="icon1"></span>
            <span class="icon2">></span>
            <span class="icon3">8</span>
        </div>
        <div class="hotwords">
            <a href="#" class="col-red">11月11天</a>
            <!--第一个热词字体是红色-->
            <a href="#">11.11秒杀</a>
            <a href="#">买2免1</a>
            <a href="#">Note5 黑</a>
            <a href="#">12期免息</a>
            <a href="#">智能科技</a>
            <a href="#">清仓</a>
            <a href="#">国际服饰</a>
            <a href="#">优惠券</a>
        </div>
    </div>
    <div style="height: 50px">
        <div class="jd-nav clearfix">
            <!--最外层盒子负责通栏，要清除浮动-->
            <div class="w">
                <!--添加版心盒子-->
                <div class="dropdown">
                    <!--全部商品分类和下拉列表的父亲盒子-->
                    <div class="dt">
                        <!--全部商品分类盒子，后面再做下拉列表盒子-->
                        <a href="#" onclick="show_list()" ondblclick="hide_list()">全部商品分类</a>
                    </div>
                    <div class="dd" id="classificationList" style="display: none">
                        <div class="items">
                            <ul id="class_1_ul" >
                                <li>
                                    <div id="class_2_ul" class="two_list" style="">

                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="items">
                            <h3>服装鞋帽</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>家用电器</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>办公器材</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>化妆美容</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>母婴用品</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>手机数码</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>家居生活</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>箱包首饰</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>食品饮料</h3>
                            <span>></span>
                        </div>
                        <div class="items">
                            <h3>电脑用品</h3>
                            <span>></span>
                        </div>
                    </div>
                </div>
                <div class="navitems">
                    <ul>
                        <li><a href="#">服装城</a></li>
                        <li><a href="#">美妆馆</a></li>
                        <li><a href="#">超市</a></li>
                        <li><a href="#">全球购</a></li>
                        <li><a href="#">闪购</a></li>
                        <li class="new"><a href="#">团购</a></li>
                        <li><a href="#">拍卖</a></li>
                        <li><a href="#">金融</a></li>
                        <li><a href="#">智能</a></li>
                    </ul>
                </div>
                <div class="bike">
                    <a href="#"></a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner clearfix">
        <!--banner是通栏大盒子-->
        <a href="#" class="bg"></a>
        <!--因为banner盒子里不止一个a标签，为了防止继承给其他a标签，这里给a标签加个类名-->
        <div class="w main">
            <!--引入版心w,main类负责是轮播图和右侧部分的父盒子-->
            <div class="slider">
                <!--轮播图大盒子-->
                <a href="#" ><img src="../img/slider1.jpg" alt=""/></a>
                <!--插入图片-->
                <ul class="circle">
                    <!-- 小圆点-->
                    <li class="current">1</li>
                    <!--当前小圆点，-->
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                </ul>
                <div class="arrow">   <!--左右两个三角-->
                    <a href="javascript:;" class="arrow-l"><</a>
                    <!--点击事件，后期可用js左交互-->
                    <a href="javascript:;" class="arrow-r">></a>
                </div>
            </div>
            <div class="news">这是右边的部分，先放着撑布局</div>
        </div>
    </div>
</body>
</html>
