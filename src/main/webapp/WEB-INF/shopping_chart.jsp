<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/24
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
<div id="app">
    <el-row>
        <el-col :offset="4" :span="18">
            <el-table
                    empty-text="暂无商品，快去选购吧"
                    ref="table"
                    :data="tableData"
                    tooltip-effect="dark"
                    @selection-change="handleSelectionChange">
                <el-table-column
                        type="selection"
                        width="55">
                </el-table-column>
                <el-table-column
                        prop="shp_id"
                        label="商品编号"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="spu.shp_tp"
                        label="图片"
                        width="120">
                    <template slot-scope="scope">
                        <el-image
                                style="width: 100px; height: 100px"
                                :src="'upload/image/'+scope.row.spu.shp_tp">

                        </el-image>
                    </template>
                </el-table-column>
                <el-table-column
                        prop="sku_mch"
                        label="属性"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="spu.shp_mch"
                        label="名称"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="jg"
                        label="单价"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="zj"
                        label="总价"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="count"
                        label="数量"
                >
                    <template slot-scope="scope">
                                <el-button
                                        size="mini"
                                        @click="increment(scope.$index, scope.row)">+</el-button>

                                <span>{{scope.row.count}}</span>

                                <el-button
                                        size="mini"
                                        @click="decrement(scope.$index, scope.row)">-</el-button>


                    </template>
                </el-table-column>

                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button
                                size="mini"
                                type="danger"
                                @click="remove(scope.$index, scope.row)">移除购物车</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-col>
    </el-row>

    <el-row >
        <el-col  :offset="4" :span="4" ><el-button size="mini"
                                                 type="danger"
                                                 @click="removeProducts">移除购物车</el-button></el-col>
        <el-col  :offset="18" :span="18">
            <el-tag type="success">¥{{this.totalPrice}}</el-tag>
            <el-button @click="checkout">结算</el-button>

        </el-col>
    </el-row>
</div>
</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data:{
            tableData:[],
            totalPrice:0,
            selected:[]
        }
        ,
        methods: {
            removeProducts() {
                var selected = this.$refs.table.store.states.selection;
                for(let i=0;i<selected.length;i++){
                    this.remove(null,selected[i]);
                }
            },
            handleSelectionChange(val) {
                this.totalPrice = 0
                for(let i=0;i<val.length;i++){
                    val[i].zj= val[i].jg* val[i].count;
                    this.totalPrice += val[i].zj;
                }
            },
            checkout(){
                // Checkout
                var selected = this.$refs.table.store.states.selection;
                axios.post('create_order.do',selected).then(response=>{});

                // Clear shopping chart and remove corresponding cache in memory database
                for(let i=0;i<selected.length;i++){
                    this.remove(null,selected[i]);
                }
            },
            increment(index,data){
                data.count+=1
                data.zj = data.count*data.jg;
            },
            decrement(index,data){
                if(data.count==0){
                    return;
                }
                data.count-=1
                data.zj = data.count*data.jg;
            },
            remove(index,data){
                axios.post('remove_from_shopping_chart',{prod_id:data.id}).then(response=>{
                    if(response.data==="ok"){
                        this.get_chart_list();
                    }
                });
            },
            get_chart_list(){
                axios.get('get_shopping_chart_list')
                    .then(response=>{
                        this.tableData = response.data;
                        for(let i=0;i<this.tableData.length;i++){
                            this.tableData[i].zj= this.tableData[i].jg* this.tableData[i].count;
                        }
                        console.log(this.tableData);
                    })
                    .catch(error=> {
                        console.log(error);
                    });
            }

        },
        mounted(){
            this.get_chart_list();
        },

    })
</script>
</html>
