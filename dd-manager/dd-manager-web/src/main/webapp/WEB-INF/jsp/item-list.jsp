<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div id="toolbar">
    <div style="padding: 5px; background-color: #fff;">
        <label>商品标题：</label>
        <input class="easyui-textbox" type="text" id="title">
        <label>商品状态：</label>
        <select id="status" class="easyui-combobox">
            <option value="0">全部</option>
            <option value="1">正常</option>
            <option value="2">下架</option>
        </select>
        <!--http://www.cnblogs.com/wisdomoon/p/3330856.html-->
        <!--注意：要加上type="button",默认行为是submit-->
        <button onclick="searchForm()" type="button" class="easyui-linkbutton">搜索</button>
        <%--<a onclick="searchForm()" class="easyui-linkbutton">搜索</a>--%>
    </div>
    <div>
        <button onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="remove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
        <button onclick="down()" class="easyui-linkbutton" data-options="iconCls:'icon-down',plain:true">下架</button>
        <button onclick="up()" class="easyui-linkbutton" data-options="iconCls:'icon-up',plain:true">上架</button>
    </div>
</div>
<%--商品列表页面--%>
<table id="dg"></table>
<script>
    function searchForm(){
        $('#dg').datagrid('load',{
            title:$('#title').val(),
            status:$('#status').combobox('getValue')
        });
    }

    function add() {
        ddshop.addTabs('item-add','新增商品');
    }

    function edit() {
        console.log('edit');
    }

    function remove() {
        var selections = $('#dg').datagrid('getSelections');
        console.log(selections);
        if (selections.length == 0) {
            //客户没有选择记录
            $.messager.alert('提示', '请至少选中一条记录！');
            return;
        }
        //至少选中了一条记录
        //确认框，第一个参数为标题，第二个参数确认框的提示内容，第三参数是一个确认函数
        //function(r) 如果用户点击的是"确定"，那么r=true
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
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
                    {'ids[]': ids},
                    //callback:后台处理成功的回调函数，相当于success，function类型
                    function (data) {
                        $('#dg').datagrid('reload');
                    },
                    //dataType:返回的数据类型，如：json，String类型
                    'json'
                );

            }
        });
    }

    function down() {
        console.log('down');
    }

    function up() {
        console.log('up');
    }

    //添加数据表格
    $('#dg').datagrid({
        //允许多列组合排序
        multiSort:true,
        toolbar:'#toolbar',
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



