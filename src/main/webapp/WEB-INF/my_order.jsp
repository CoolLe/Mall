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
    <el-row  v-for="(value,key,index) in data">
        <el-col :span="18" :offset="3" style="box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)">
        <el-card class="box-card">
            订号单：{{value[0].order.order_id}}订单日期：{{value[0].order.create_time}}

        </el-card>
        <el-table
                :data="value"
                border
                show-summary
                :summary-method="summary"
                style="width: 100%">
            <el-table-column label="订单详情">
            <el-table-column
                    prop="spu.shp_mch"
                    label="名称"
            >
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
            </el-table-column>

            <el-table-column
                    prop="order.count"
                    sortable
                    label="数量"
            >
            </el-table-column>
            <el-table-column
                    prop="sku.jg"
                    sortable
                    label="单价"
            >
            </el-table-column>
            <el-table-column
                    prop="order.state"
                    sortable
                    label="状态"
            >
            </el-table-column>

        </el-table>
        <p height="400px"></p>
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
            data:[]
        }
        ,
        methods: {
            summary(param){
                let summaries = '合计： ';
                console.log(param.data)
                let arr = param.data;
                let totalPrice = 0.0;
                for(let i=0;i<arr.length;i++){
                    let item = arr[i];
                    if(!(item instanceof Array)){
                        totalPrice += item.order.count* item.sku.jg;
                        console.log(item)
                    }
                }
                summaries += '\t¥';
                summaries += totalPrice
                return [summaries];
            },
            async getOrderList(){
                await axios.get('get_order_list.do')
                    .then(response=>{
                        this.tableData =response.data;
                        let temp={};

                        for(let i=0;i<this.tableData.length;i++){
                          let orderId = this.tableData[i].order.order_id;

                          let existingOrder =  Object.keys(temp);
                          if(existingOrder.indexOf(orderId)!=-1){
                              //existing
                              temp[existingOrder[existingOrder.indexOf(orderId)]]
                              .push(this.tableData[i]);
                          }else{
                              // append
                              temp[orderId] = [this.tableData[i]];
                          }
                        }
                        for(let obj in temp){
                           this.data.push(temp[obj])
                        }
                        console.log(this.data)
                    })
                    .catch(error=> {
                        console.log(error);
                    });
            },
            decorateData(){

            }

        },
        mounted() {
            this.getOrderList();
            this.decorateData();
        },

    })
</script>
</html>
