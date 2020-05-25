<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/24
  Time: 21:41
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
    <title>Mall</title>
</head>
<body>
    属性列表<br>
    <c:forEach items="${list_attr}" var="attr">
        ${attr.shxm_mch}:
        <c:forEach items="${attr.list_value}" var="val">
            ${val.shxzh}${val.shxzh_mch}
        </c:forEach>
        <br>
    </c:forEach>
</body>
</html>
