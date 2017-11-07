package com.xzl.ddshop.pojo.vo;

import com.xzl.ddshop.pojo.po.TbItem;

/**
 将返回的数据做封装 自定义的多表查询的商品显示类
 */
public class TbItemCustom extends TbItem
{
    private String catName;

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
}


