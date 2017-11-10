package com.xzl.ddshop.service.impl;

import com.xzl.ddshop.common.dto.TreeNode;
import com.xzl.ddshop.dao.TbItemCatMapper;
import com.xzl.ddshop.pojo.po.TbItemCat;
import com.xzl.ddshop.pojo.po.TbItemCatExample;
import com.xzl.ddshop.service.ItemCatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ItemCatServiceImpl implements ItemCatService
{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TbItemCatMapper itemCatDao;
    @Override
    public List<TreeNode> listItemCatsByPid(Long parentId) {

        List<TreeNode> list = new ArrayList<>();
        try{
            TbItemCatExample example = new TbItemCatExample();
            TbItemCatExample.Criteria criteria = example.createCriteria();
            criteria.andParentIdEqualTo(parentId);
            List<TbItemCat> itemCatsList = itemCatDao.selectByExample(example);

            for (int i = 0;i<itemCatsList.size() ; i++) {
                TreeNode treeNode = new TreeNode();
                treeNode.setId(itemCatsList.get(i).getId());
                treeNode.setText(itemCatsList.get(i).getName());
                treeNode.setState(itemCatsList.get(i).getIsParent()?"closed":"open");
                list.add(treeNode);
            }

        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return list;
    }
}
