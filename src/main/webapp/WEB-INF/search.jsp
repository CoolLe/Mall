<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/18
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>

    <style type="text/css">
        /* 样式较少，为方便写在这里 */
        #search_on {
            width: 960px;
            height: 400px;
            margin: 80px auto;
        }
        .search {
            width: 494px;
            height: 30px;
            border: 3px solid #E4393C;
            position: relative;
        }
        .search input {
            float: left;
            border: 0;
        }
        input:focus {
            outline: 0;
        }
        .text {
            float: left;
            width: 406px;
            padding: 5px;
            height: 20px;
            line-height: 20px;
            font-family: arial,"\5b8b\4f53";
        }
        .text:focus {
            background-color: #FCFCFC;
            -webkit-box-shadow: 2px 2px 3px #D2D2D2 inset;
            -moz-box-shadow: 2px 2px 3px #D2D2D2 inset;
            box-shadow: 2px 2px 3px #D2D2D2 inset;
        }
        .button {
            width: 78px;
            height: 30px;
            font-size: 14px;
            font-weight: 700;
            color: #FFFFFF;
            background-color: #E4393C;
            display: inline-block;
            text-align: center;
            cursor: pointer;
        }
    </style>
    <title>搜索</title>
</head>
<body>
    <div class="search">
        <div class="logo"><img src="" alt=""></div>
        <div class="search_on" id="search_on">
            <div class="se">
                <input type="text" name="search" class="text"/>
                <input type="submit" class="button" value="搜索"/>
            </div>
            <div class="se">
                <a href="">取暖神器</a>
                <a href="">1元秒杀</a>
                <a href="">吹风机</a>
                <a href="">热水袋</a>
            </div>
        </div>
        <div class="card">
            <a href="">购物车<div class="num">0</div></a>

            <div class="cart_pro">
                <h6>最新加入的商品</h6>
                <div class="one">
                    <img src=""/>
                    <span class="one_name">
                        商品名称
                    </span>
                    <span class="one_prace">
                        <b>￥9999</b><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除
                    </span>
                </div>
                <div class="gobottom">
                    共<span>2</span>件商品&nbsp;&nbsp;&nbsp;&nbsp;
                    共计￥<span>9999</span>
                    <button class="goprice">去购物车</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
