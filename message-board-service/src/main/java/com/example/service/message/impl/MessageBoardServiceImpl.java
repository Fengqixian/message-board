package com.example.service.message.impl;

import com.example.common.AuthorizationUtil;
import com.example.component.InfiniteMessageTree;
import com.example.mapper.MessageBoardMapper;
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
 * @author aria
 * @date 2022/6/5 10:46
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MessageBoardServiceImpl implements MessageBoardService {
    /**
     * 留言树
     */
    private final InfiniteMessageTree messageBoardTree;
    /**
     * 留言 Mapper
     */
    private final MessageBoardMapper messageBoardMapper;
    @Autowired
    public MessageBoardServiceImpl(InfiniteMessageTree messageBoardTree, MessageBoardMapper messageBoardMapper) { this.messageBoardTree = messageBoardTree; this.messageBoardMapper = messageBoardMapper;}


    @Override
    public List<MessageBoardTreeNode> getData() {
        return messageBoardTree.getListTree();
    }


    @Override
    public MessageBoardTreeNode addMessage(MessageBoardDetail detail) {
        UserInfo user = AuthorizationUtil.getCurrentUserInfo();
        detail.setUserId(user.getId());
        detail.setReleasedTime(new Timestamp(new Date().getTime()));
        // 持久化留言数据
        messageBoardMapper.insert(detail);
        return messageBoardTree.findParentAdd(new MessageBoardTreeNode(user,detail));
    }


}
