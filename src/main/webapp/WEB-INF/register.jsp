<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/6/4
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>注册</title>
    <style type="text/css">
        /* 清除默认样式 同时给所有元素设置样式 */
        * {
            margin: 0;
            padding: 0;
            font-family: "Open Sans Light";
            letter-spacing: .07em; /* 字母间隔大小 */
        }
        /* 因为下面想设置body、wrap区域的宽高为整个窗口高度 所以得先设置html也得这样设置
             这里得注意 body 和 html 的区别
             1.如果body及其子元素想设置高度为窗口高度 那么得设置h向下面这样设置html

             2.在body里面设置background-color时，发现整个窗口都会变了颜色 这容易产生错觉： body == 窗口
        */
        html {
            height: 100%;
        }
        body {
            height: 100%;
        }
        /* 继承窗口高度 设置一个渐变色向右渐变  渐变色推荐网站：https://www.sj520.cn/tools/jianbian/  应该有你喜欢的吧 */
        .wrap {
            height: 100%;
            background-image: linear-gradient(to right, #84fab0, #8fd3f4);
        }
        /* 这个是登录区域 */
        .register-wrap {
            width: 300px;
            height: 500px;
            background-color: rgba(170, 170, 255, 0.3);
            /* 居中开始 */
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* 居中结束 */
            border-radius: 10px;
            padding: 0 50px; /* 左右留出空余 */
        }
        /* 给最上面的Login这个标题设置样式 */
        .register-title {
            font-size: 25px;
            text-align: center;
            line-height: 100px;
            color: #fff;
            font-weight: bold;
        }
        /* 输入设置样式 */
        .register-form .register-input{
            display: block; /* input 标签是行内元素 */
            width: 100%;
            border: 0;
            border-bottom: 1px solid #ccc;
            padding: 10px 0 10px 10px;
            margin-bottom: 20px;
            outline: none; /* 输入框边框去掉 */
            background-color: transparent; /* 透明色 */
        }
        .register-form .register-input::placeholder {
            text-transform: uppercase; /* 设置placeholder内容的大小写 */
            color: #bdbdbd;
        }
        /* 给登录提交按钮设置样式 */
        .register-form .register-submit {
            width: 100%;
            line-height: 30px;
            border: 0;
            border-radius: 3px;
            margin-top: 20px;
            background-image: linear-gradient(to right, #5ee7df, #b490ca);
            font-size: 16px;
            text-align: center;
            cursor: pointer;
            color: #aa00ff;
            font-weight: bold;
        }
        /* tip 区域样式 */
        .tip {
            margin-top: 15px;
        }
        .tip a {
            padding-left: 110px;
            text-decoration: none;
            color: #7d3ebc;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="register-wrap">
            <div class="register-title">
                注册
            </div>
            <div class="register-form">
                <form action="register.do" id="register_form" method="post">
                    <input type="text" name="username" placeholder="用户名" class="register-input">
                    <input type="password" name="password" placeholder="密码" class="register-input">
                    <input type="text" name="nickname" placeholder="昵称" class="register-input">
                    <input type="text" name="phoneNum" placeholder="手机号" class="register-input">
                    <input type="text" name="email" placeholder="邮箱" class="register-input">
                </form>
                <input type="submit" name="register" value="register" class="register-submit" onclick="to_submit()"/>
            </div>
            <div class="tip">
                已有账户? <a href="goto_login.do">返回登录</a>
            </div>
        </div>
    </div>
</body>
</html>
