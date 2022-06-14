package com.example.service.message;

import com.example.model.message.MessageBoardDetail;
import com.example.model.message.MessageBoardTreeNode;
import java.util.List;

/**
 * 留言板业务接口
 * @author: aria
 * @date-time: 2022/6/5 10:36
 */
public interface MessageBoardService {

    /**
     * 获取留言板内容
     * @return
     */
    List<MessageBoardTreeNode> getData();

    /**
     * 添加一条留言记录
     * @param detail
     * @return
     */
    MessageBoardTreeNode addMessage(MessageBoardDetail detail);
}
