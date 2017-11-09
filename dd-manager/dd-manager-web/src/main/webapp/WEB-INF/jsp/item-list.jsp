<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--商品列表页面--%>

<table id="dg"></table>
<script>
    //添加工具栏
    var toolbar =[{
        iconCls:'icon-add',
        text:'新增',
        handler:function () {
          //新增方法
        },
    },{
        iconCls:'icon-remove',
        text:'删除',
        handler:function () {
            var selections = $('#dg').datagrid('getSelections');
            console.log(selections);
            if(selections.length == 0)
            {
                $.messager.alert('提示','至少选择一条记录','warning');
               /* $.messager.show({
                    title:'提示',
                    icon:'warning',
                    msg:'至少选中一条记录',
                    style:{

                    }
                });*/
                return;
            }
            $.messager.confirm('确认','您确认要删除您选中的数据?',function (r) {
                if(r)
                {
                    //为了存放id的集合
                    var ids = [];
                    //遍历选中的记录，将记录的id存放到js数组中
                    for (var i = 0; i < selections.length; i++) {
                        ids.push(selections[i].id);
                    }
                    //把ids异步提交到后台
                    $.post(
                        //url:请求后台的哪个地址来进行处理，相当于url,String类型
                        'items/batch',
                        //data:从前台提交哪些数据给后台处理，相当于data，Object类型
                        {'ids[]':ids},
                        //callback:后台处理成功的回调函数，相当于$.ajax中的 success ，function类型
                        function(data){
                            alert('成功删除行数'+data);
                            $('#dg').datagrid('reload');
                        },
                        //dataType:返回的数据类型，如：json，String类型
                        'json'
                    );
                }
            })
        },
    },{
        iconCls:'icon-edit',
        text:'编辑',
        handler:function () {

        }
    },{
        iconCls: 'icon-up',
        text: '上架',
        handler: function () {
            console.log('up');
        }
    }, {
        iconCls: 'icon-down',
        text: '下架',
        handler: function () {
            console.log('down');
        }

    }];


    //添加数据表格
    $('#dg').datagrid({
        //允许多列组合排序
        multiSort:true,
        toolbar:toolbar,
        //请求远程服务器上的URL http://localhost:8080/ddshop/items
        url: 'items',
        //隔行变色，斑马线效果
        striped: true,
        //添加分页工具栏
        pagination: true,
        //每行的前面显示行号
        rownumbers: true,
        //使得数据表格自适应填充父容器
        fit: true,
        //默认显示10条，这样的话就显示20条
        pageSize: 20,
        //分页列表
        pageList: [10,15,20,25,30,35],
        //列属性
        columns: [[
            //field title width列属性
            {field: 'ck', checkbox: true},
            {field: 'id', title: '商品编号', width: 100,sortable:true},
            {field: 'title', title: '商品名称', width: 100,sortable:true},
            {field:'sellPoint',title:'商品卖点',width:100},
            {field: 'price', title: '商品价格（单价/元）', width: 100,formatter:function (price)
                {
                    var _price = price/100;
                    return _price.toFixed(2);
                }
            },
            {field:'num',title:'库存数量',width:100},
            {field:'barcode',title:'商品条形码',width:100},
            {field:'image',title:'商品图片',width:100},
            {field :'catName',title:'所属分类',width:100},
            {field:'status',title:'商品状态',width:100,formatter:function (status)
                {
                    if(status == 1)
                    {
                        return '正常';
                    }
                    if(status ==2)
                    {
                        return '下架';
                    }
                    if(status ==3)
                    {
                        return '删除';
                    }else{
                        return '未知';
                    }
                }
            },
            {
                field:'created',title:'创建时间',width:100,formatter:function (value,row,index)
                {
                    return moment(value).format("LLLL");
                }
            },
            {
                field:'updated',title:'更新时间',width:100,align:"right",
                formatter:function (value)
                {
                    return moment(value).format("LLLL");
                }
            }

        ]]
    });
</script>



