<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"/>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>Mall</title>
</head>
<body>
<div class="container">
    <form action="checkout.do" method="post">
    <h5 class="page-header"></h5>
    <c:forEach items="${products}" var="sku">
        <div class="row">
            <div class="col-md-1">
                <input type="checkbox" aria-label="none" value="${sku.id}">
            </div>
            <div class="col-md-3">
                <img src="upload/image/${sku.spu.shp_tp}" alt="Load failure" class="img-thumbnail" height="150px" width="150px">
            </div>

            <div class="col-md-4">
                <span name="" id="name_${sku.id}">名称：${sku.spu.shp_mch}</span>
                <span id="type_${sku.id}">类型：${sku.sku_mch}</span>
                <span id="price_${sku.id}">单价： ${sku.jg}</span>
            </div>
            <div class="col-md-4">
                <div class="row">
                    <button type="button" class="btn btn-default" onclick="removeFromShoppingChart(${sku.id})">移除购物车</button>
                </div>
                <div class="row">
                <input type="text" id="count_${sku.id}" disabled value="${sku.count}"></div>
                <button type="button" class="btn btn-default" id="prod_count_plus" onclick="calcPrice(${sku.id},true)" >+</button>
                <button type="button" class="btn btn-default" id="prod_count_minus" onclick="calcPrice(${sku.id},false)">-</button>
                </div>
                <div id="prod_price_${sku.id}">${sku.jg*sku.count}</div>
            </div>
    </div>
    <h5 class="page-header"></h5>
    </c:forEach>
        <div class="row">
            <div class="col-md-1 col-md-offset-10">
                <input type="text" id="total_prod_price"  disabled value="${init_price}"></div>
            </div>
            <div class="col-md-1 col-md-offset-11">
                <button type="submit" class="btn btn-success" >结算</button>
            </div>
        </div>
    </form>
</div>
</body>

<script>
    var selected = []
    var prevTotalPrice = ${init_price}

    $(function(){
        $('input[type=checkbox]').click(function(){
            var id = $(this).val()

            if(this.checked){
                selected.push(id)
            }else{
                for(let i=0;i<selected.length;i++){
                    if(selected[i]==id){
                        selected.splice(i,1)
                    }
                }
            }
            var result = 0;
            for(let i=0;i<selected.length;i++){
                var priceString = $('#price_'+id).text();
                var price = parseFloat(priceString.split('：')[1])

                var count = parseInt($('#count_'+id).val())
                console.log(price,count)
                result += price*count
            }
            $('#total_prod_price').val(result)

        });
    });

    function calcPrice(id,isIncrement){
        $(function(){
            var priceString = $('#price_'+id).text();
            var price = parseFloat(priceString.split('：')[1])

            var oldCount = parseInt($('#count_'+id).val())
            if(oldCount===0 && !isIncrement){
                return;
            }


            var newCount = 0;
            if(isIncrement){
                newCount = parseInt(oldCount) +1;
            }else{
                newCount = parseInt(oldCount) -1;
            }
            $('#count_'+id).val(newCount)

            var result = newCount * price;
            $("#prod_price_"+id).text(result)

            if(isIncrement){
                prevTotalPrice += price;
            }else{
                prevTotalPrice -= price;
            }
            $('#total_prod_price').val(prevTotalPrice)
        })
    }

    function removeFromShoppingChart(id){
        $.post("remove_from_shopping_chart", { prod_id: id},
            function(data){
                console.log(data)
                if(data==="ok"){
                    toastr.success('已移除商品！')
                }else{
                    toastr.warning('移除失败：（')
                }
            });
        window.location.reload();
    }
</script>
<style>
</style>
</html>
