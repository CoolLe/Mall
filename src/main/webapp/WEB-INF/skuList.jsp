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
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"/>
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
            <button type="button" onclick="addToShoppingChart(${sku.id})">加入购物车</button>
        </div>
    </c:forEach>
</body>
<script>
    function addToShoppingChart(id){
        $.post("add_to_shopping_chart", { prod_id: id},
            function(data){
            console.log(data)
                if(data==="ok"){
                    toastr.success('已添加进购物车！')
                }else{
                    toastr.warning('添加进购物车失败：（')
                }
        });
    }
</script>
</html>
