package com.xzl.ddshop.service.impl;

import com.xzl.ddshop.common.dto.Order;
import com.xzl.ddshop.common.dto.Page;
import com.xzl.ddshop.common.dto.Result;
import com.xzl.ddshop.dao.TbItemCustomMapper;
import com.xzl.ddshop.dao.TbItemMapper;
import com.xzl.ddshop.pojo.po.TbItem;
import com.xzl.ddshop.pojo.po.TbItemExample;
import com.xzl.ddshop.pojo.vo.TbItemCustom;
import com.xzl.ddshop.pojo.vo.TbItemQuery;
import com.xzl.ddshop.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService
{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TbItemMapper itemDao;

    @Autowired
    private TbItemCustomMapper itemCustomDao;
    @Override
    public TbItem getById(Long itemid) {
        return itemDao.selectByPrimaryKey(itemid);
    }

    @Override
    public Result<TbItemCustom> listItemsByPage(Page page, Order order, TbItemQuery query)
    {
        Result<TbItemCustom> result =null;
        try{
            result = new Result<>();
            int total = itemCustomDao.countItems(query);
            List<TbItemCustom> rows = itemCustomDao.listItemsByPage(page,order,query);
            result.setTotal(total);
            result.setRows(rows);
        }catch (Exception e)
        {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int updateItemsByIds(List<Long> ids) {
        TbItem record = new TbItem();
        record.setStatus((byte) 3);
        TbItemExample example = new TbItemExample();
        TbItemExample.Criteria criteria =example.createCriteria();
        criteria.andIdIn(ids);
        return itemDao.updateByExampleSelective(record,example);
    }
}
