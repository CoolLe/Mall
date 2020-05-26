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
        function save_param(shxm_id,shxzh_id,shxmch) {
            $("#paramArea").append("<input type='text' name='shxparam' value='{\"shxm_id\":"+shxm_id+",\"shxzh_id\":"+shxzh_id+"}'>"+shxmch);
            //调用ajax异步请求
            get_list_by_attr();
        }
        function get_list_by_attr() {
            //获取参数
            // var attrJson = {};
            var jsonStr = "flbh2=" +${flbh2};

            $("#paramArea input[name='shxparam']").each(function (i,data) {
                var json = $.parseJSON(data.value);
                // attrJson["list_attr["+i+"].shxm_id"] = json.shxm_id;
                // attrJson["list_attr["+i+"].shxzh_id"] = json.shxzh_id;
                jsonStr = jsonStr + "&list_attr["+i+"].shxm_id="+json.shxm_id+"&list_attr["+i+"].shxzh_id="+json.shxzh_id;
            });
            //异步提交
            //刷新商品列表
            $.get("get_list_by_attr.do",jsonStr,function (data) {
                $("#skuListInner").html(data);
            });
        }
    </script>
    <title>Mall</title>
</head>
<body>
    <div id="paramArea"></div>
    属性列表<br>
    <c:forEach items="${list_attr}" var="attr">
        ${attr.shxm_mch}:
        <c:forEach items="${attr.list_value}" var="val">
            <a href="javascript:save_param(${attr.id},${val.id},'${val.shxzh}${val.shxzh_mch}');">${val.shxzh}${val.shxzh_mch}</a>
        </c:forEach>
        <br>
    </c:forEach>
</body>
</html>
