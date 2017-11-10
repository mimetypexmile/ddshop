
var ddshop = {
    //点击左侧导航树上的节点，添加选项卡
    registerMenuEvent:function () {
        var _this = this;
        //约定大于配置：jquery对象前面加上$,如果是DOM对象不需要加$
        var $tree = $('#menu .easyui-tree');
        //将当前树打印到控制台
        //console.log($tree);
        $tree.tree({
            onClick:function(node){
                var href = node.attributes.href;//item-add
                var text = node.text;
//                debugger;
                //console.log(this);
                //console.log(_this);
                _this.addTabs(href,text);
            }
        });
    },
    addTabs:function (href,text) {
        if($('#tab').tabs('exists',text))
        {
            $('#tab').tabs('select',text);
        }else {
            $('#tab').tabs('add',{
                title: text,
                href: href,
                closable:true
            });
        }
    }
};