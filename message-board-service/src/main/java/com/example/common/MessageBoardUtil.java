package com.example.common;

import com.example.model.message.MessageBoardTreeNode;
import lombok.extern.slf4j.Slf4j;

import java.util.*;

/**
 * 留言板数据处理工具类
 * @author: aria
 * @date-time: 2022/6/5 11:27
 */
@Slf4j
public class MessageBoardUtil {


    /**
     * 留言列表数据格式转换： List -> Tree
     * @param detailList 留言明细数据
     * @param detailList 节点映射
     * @return
     */
    public static List<MessageBoardTreeNode> transformToTree(List<MessageBoardTreeNode> detailList,Map<Long,List<MessageBoardTreeNode>> nodeMapping) {
        detailList.stream().forEach(e -> nodeMapping.put(e.getId(),e.getChildren()));
        List<MessageBoardTreeNode> treeList = new ArrayList<>();
        for(MessageBoardTreeNode node : detailList) {
            if(node.getParentId() == null) {
                treeList.add(node);
            } else {
                for(MessageBoardTreeNode treeNode: treeList) {
                    MessageBoardTreeNode temp = treeNode.addToTree(node);
                    if(temp != null) {
                        break;
                    }
                }
            }

        }
        return treeList;
    }
    /*public static List<MessageBoardTreeNode> transformToTree(List<MessageBoardTreeNode> detailList,Map<Long,List<MessageBoardTreeNode>> nodeMapping) {
        List<MessageBoardTreeNode> treeList = new ArrayList<>();
        for(MessageBoardTreeNode node : detailList) {
            if(node.getParentId() == null) {
                treeList.add(node);
                nodeMapping.put(node.getId(),node.getChildren());
            } else {
                for(MessageBoardTreeNode treeNode: treeList) {
                    MessageBoardTreeNode temp = treeNode.addToTree(node);
                    if(temp != null) {
                        nodeMapping.put(temp.getId(),temp.getChildren());
                        break;
                    }
                }
            }

        }
        return treeList;
    }*/
}
