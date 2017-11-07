package com.xzl.ddshop.dao;

import com.xzl.ddshop.common.dto.Page;
import com.xzl.ddshop.pojo.vo.TbItemCustom;

import java.util.List;

/**
 * 自定义的商品实体数据访问层接口
 */
public interface TbItemCustomMapper
{
    /**
     * 查询商品表中的所有的记录的数量
     * @return
     */
    int countItems();

    List<TbItemCustom> listItemsByPage(Page page);
}
