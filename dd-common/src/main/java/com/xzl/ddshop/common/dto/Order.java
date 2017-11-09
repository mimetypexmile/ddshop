package com.xzl.ddshop.common.dto;

import java.util.ArrayList;
import java.util.List;

//easyui 的datagrid 排序的实体类
public class Order
{
    private String sort;
    private String order;

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<String> getOrderParams()
    {
        String[] sorts = sort.split(",");
        String[] orders = order.split(",");
        List<String> list= new ArrayList<>();
        for(int i=0;i<sorts.length;i++)
        {
            String str  = sorts[i]+" "+orders[i];
            list.add(str);
        }
        return list;
    }
}
