<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/24
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>Mall</title>
</head>
<body>
    <jsp:include page="attrList.jsp"></jsp:include>
    <div id="skuListInner">
        <jsp:include page="skuList.jsp"></jsp:include>
    </div>
</body>
</html>
