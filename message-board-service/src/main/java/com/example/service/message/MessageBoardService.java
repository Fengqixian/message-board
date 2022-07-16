package com.example.service.message;

import com.example.model.message.MessageBoardDetail;
import com.example.model.message.MessageBoardTreeNode;
import java.util.List;

/**
 * 留言板业务接口
 * @author aria
 * @date 2022/6/5 10:36
 */
public interface MessageBoardService {

    /**
     * 获取留言板内容
     * @return 留言树
     */
    List<MessageBoardTreeNode> getData();

    /**
     * 添加一条留言记录
     * @param detail 留言内容
     * @return 插入的留言节点
     */
    MessageBoardTreeNode addMessage(MessageBoardDetail detail);
}
