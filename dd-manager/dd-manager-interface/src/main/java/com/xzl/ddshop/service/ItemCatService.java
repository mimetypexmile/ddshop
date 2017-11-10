package com.xzl.ddshop.service;

import com.xzl.ddshop.common.dto.TreeNode;

import java.util.List;


public interface ItemCatService
{
    List<TreeNode> listItemCatsByPid(Long parentId);
}
