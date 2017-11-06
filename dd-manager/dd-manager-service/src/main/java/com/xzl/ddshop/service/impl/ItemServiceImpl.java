package com.xzl.ddshop.service.impl;

import com.xzl.ddshop.dao.TbItemMapper;
import com.xzl.ddshop.pojo.po.TbItem;
import com.xzl.ddshop.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService
{
    @Autowired
    private TbItemMapper itemDao;
    @Override
    public TbItem getById(Long itemid) {
        return itemDao.selectByPrimaryKey(itemid);
    }
}
