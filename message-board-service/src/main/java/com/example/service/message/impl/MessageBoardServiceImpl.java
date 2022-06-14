package com.example.service.message.impl;

import com.example.common.AuthorizationUtil;
import com.example.mapper.MessageBoardMapper;
import com.example.component.MessageBoardTree;
import com.example.model.message.MessageBoardTreeNode;
import com.example.model.message.MessageBoardDetail;
import com.example.model.user.UserInfo;
import com.example.service.message.MessageBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 留言板业务处理类
 * @author: aria
 * @date-time: 2022/6/5 10:46
 */
@Service
public class MessageBoardServiceImpl implements MessageBoardService {
    private final MessageBoardTree messageBoardTree;
    private final MessageBoardMapper messageBoardMapper;
    @Autowired
    public MessageBoardServiceImpl(MessageBoardTree messageBoardTree, MessageBoardMapper messageBoardMapper) { this.messageBoardTree = messageBoardTree; this.messageBoardMapper = messageBoardMapper;}

    /**
     * 获取留言视图数据
     * @return
     */
    @Override
    public List<MessageBoardTreeNode> getData() {
        return messageBoardTree.getTree();
    }

    /**
     * 添加一条留言记录
     * @param detail
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public MessageBoardTreeNode addMessage(MessageBoardDetail detail) {
        UserInfo user = AuthorizationUtil.getCurrentUserInfo();
        detail.setUserId(user.getId());
        detail.setReleasedTime(new Timestamp(new Date().getTime()));
        //TODO 保存节点记录 高并发可优化为异步处理
        messageBoardMapper.insert(detail);
        messageBoardTree.add(new MessageBoardTreeNode(user,detail));
        return new MessageBoardTreeNode(user,detail);
    }


}
