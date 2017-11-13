package com.xzl.ddshop.web;

import com.xzl.ddshop.common.dto.Order;
import com.xzl.ddshop.common.dto.Page;
import com.xzl.ddshop.common.dto.Result;
import com.xzl.ddshop.pojo.po.TbItem;
import com.xzl.ddshop.pojo.vo.TbItemCustom;
import com.xzl.ddshop.pojo.vo.TbItemQuery;
import com.xzl.ddshop.service.ItemService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Scope("prototype")
public class ItemAction
{
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/item/{itemId}",method = RequestMethod.GET)
    @ResponseBody
    public TbItem getById(@PathVariable ("itemId") Long itemId)
    {
        return itemService.getById(itemId);
    }

    @ResponseBody
    @RequestMapping("/items")
    public Result<TbItemCustom> listItem(Page page,Order order,TbItemQuery query)
    {
        Result<TbItemCustom> result = null;
        try {
             result = itemService.listItemsByPage(page,order,query);

        }catch (Exception e)
        {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }


    @RequestMapping(value = "/items/batch",method = RequestMethod.POST)
    @ResponseBody
    public int updateItemsByIds(@RequestParam("ids[]") List<Long>  ids)
    {
        return itemService.updateItemsByIds(ids);
    }

//    @ResponseBody
//    @RequestMapping("/item")
//    public int saveItem(TbItem tbItem,String content){
//        int i = 0;
//        try {
//            i = itemService.saveItem(tbItem, content);
//        }catch (Exception e){
//            logger.error(e.getMessage(), e);
//            e.printStackTrace();
//        }
//        return i;
//    }
}
