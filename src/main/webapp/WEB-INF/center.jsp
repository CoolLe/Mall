<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/6/4
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../css/base.css">
    <script>

    </script>
    <title>个人中心</title>
    <style>
    </style>
</head>
<body>
    <div id="container" style="width:100%">

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

        <div style="width: 100%">
            <div id="menu" style="background-color:#FFD700;height:100%;width:300px;float:left;">
                <a href="">个人信息</a><br>
                <a href="shopping_chart.do">购物车</a><br>
                <a href="my_order.do">订单信息</a><br>
            </div>

            <div id="content" style="background-color:#EEEEEE;height:100% ;width:1200px;float:left;">
                内容在这里
            </div>
        </div>
    </div>
</body>
</html>
