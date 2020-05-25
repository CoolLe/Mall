<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/24
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>Title</title>
</head>
<body>
    <c:forEach items="${list_sku}" var="sku">
        <div style="margin-left: 10px;float: left;border: 1px red solid;width: 250px;height: 250px">
            <img src="upload/image/${sku.spu.shp_tp}" width="150px" height="150px"><br>
            ${sku.sku_mch}<br>
            ${sku.jg}<br>
            ${sku.sku_xl}<br>
        </div>
    </c:forEach>
</body>
</html>
