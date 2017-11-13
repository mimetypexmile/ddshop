package com.xzl.ddshop.service;

import com.xzl.ddshop.common.dto.Order;
import com.xzl.ddshop.common.dto.Page;
import com.xzl.ddshop.common.dto.Result;
import com.xzl.ddshop.pojo.po.TbItem;
import com.xzl.ddshop.pojo.vo.TbItemCustom;

import java.util.List;

public interface ItemService
{
    TbItem getById(Long itemid);

    Result<TbItemCustom> listItemsByPage(Page page, Order order);

    int updateItemsByIds(List<Long> ids);
}
