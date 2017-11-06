package com.xzl.ddshop.web;

import com.xzl.ddshop.pojo.po.TbItem;
import com.xzl.ddshop.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Scope("prototype")
public class ItemAction
{
    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/item/{itemId}",method = RequestMethod.GET)
    @ResponseBody
    public TbItem getById(@PathVariable ("itemId") Long itemId)
    {
        return itemService.getById(itemId);
    }

    @RequestMapping("/{page}")
    public String page(@PathVariable("page") String page)
    {
        return page;
    }
}
