<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--商品列表页面--%>

<table id="dg"></table>
<script>
    $('#dg').datagrid({
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
            {field: 'id', title: '商品编号', width: 100},
            {field: 'title', title: '商品名称', width: 100},
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
                    }
                }
            },
            {
                field:'created',title:'创建时间',width:100,formatter:function (created)
                {
                    var unixTimestamp = new Date(created);
                    return unixTimestamp.toLocaleString();
                }
            },
            {
                field:'updated',title:'更新时间',width:100,align:"right",
                formatter:function (updated)
                {
                    var unixTimestamp = new Date(updated);
                    return unixTimestamp.toLocaleString();
                }
            }

        ]]
    });
</script>
<script>

    function format(/** timestamp=0 **/) {
        var ts = arguments[0] || 0;
        var t, y, m, d, h, i, s;
        t = ts ? new Date(ts * 1000) : new Date();
        y = t.getFullYear();
        m = t.getMonth() + 1;
        d = t.getDate();
        h = t.getHours();
        i = t.getMinutes();
        s = t.getSeconds();
        // 可根据需要在这里定义时间格式
        return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d) + ' ' + (h < 10 ? '0' + h : h) + ':' + (i < 10 ? '0' + i : i) + ':' + (s < 10 ? '0' + s : s);
    }

</script>


