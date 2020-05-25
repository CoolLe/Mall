<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/17
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>乐乐商城</title>
</head>
<body>
    <div class="top">
        <div class="top_text">
            <c:if test="${empty user}">
                <a href="goto_login.do">用户登录</a>
                <a href="">用户注册</a>
            </c:if>
            <c:if test="${not empty user}">
                <a href="">用户名称:${user.username}</a>
                <a href="">用户订单</a>
            </c:if>
        </div>
    </div>
</body>
</html>
