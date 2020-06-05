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
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<div id="app">
    <el-card>
    <c:forEach items="${list_attr}" var="attr">
        <el-card>
        <el-row>
                ${attr.shxm_mch}:
                    <c:forEach items="${attr.list_value}" var="val">
                        <el-radio label="${attr.id}"
                                  href="javascript:save_param(${attr.id},${val.id},'${val.shxzh}${val.shxzh_mch}');">
                                ${val.shxzh}${val.shxzh_mch}
                        </el-radio>
                    </c:forEach>
        </el-row>
        </el-card>
    </c:forEach>
    </el-card>


    <el-row :gutter="8">
    <c:forEach items="${list_sku}" var="sku">
        <el-col :span="6">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>${sku.spu.shp_mch}</span>
                    <el-button style="float: right; padding: 3px 0" type="text"  @click="addToShoppingChart(${sku.id})">加入购物车</el-button>
                </div>
                <div>
                    <el-row>

                        <img src="upload/image/${sku.spu.shp_tp}" width="150px" height="150px"/>
                    </el-row>
                    <el-row>
                        <span class="el-icon-paperclip">
                            类型：${sku.sku_mch}
                        </span>
                    </el-row>
                    <el-row>
                        <span class="el-icon-money">
                            单价：¥${sku.jg}
                        </span>
                    </el-row>
                    <el-row></el-row>
                    <el-row>
                        <span class="el-icon-shopping-cart-2">
                            销量：${sku.sku_xl}
                        </span>
                    </el-row>
                </div>
            </el-card>
        </el-col>
    </c:forEach>
    </el-row>

</div>
</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                checkList:[]
            }
        },
        methods:{
            addToShoppingChart(id){
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
        }
    })
</script>
</html>