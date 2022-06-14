package com.example.component;

import com.example.common.MessageBoardUtil;
import com.example.common.MessageException;
import com.example.mapper.MessageBoardMapper;
import com.example.model.message.MessageBoardTreeNode;
import lombok.Data;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * 缓存留言板结构数据，利用hash映射子节点加速数据插入
 * @author: aria
 * @date-time: 2022/6/7 19:31
 */
@Data
@Component
public class MessageBoardTree {

    @Resource
    MessageBoardMapper mapper;

    /**
     * 初始化留言板内容
     */
    @PostConstruct
    public void init() {
        List<MessageBoardTreeNode> nodeList = mapper.selectAllUserDetail();
        this.nodeMapping = new ConcurrentHashMap<>();
        this.tree =MessageBoardUtil.transformToTree(nodeList,nodeMapping);
    }

    /**
     * 消息树
     */
    private List<MessageBoardTreeNode> tree;

    /**
     * 树节点映射
     */
    private Map<Long,List<MessageBoardTreeNode>> nodeMapping;

    /**
     * 内存树添加子节点
     * @param node
     */
    public void add(MessageBoardTreeNode node) {
        if(nodeMapping.containsKey(node.getParentId())) {
            //TODO 缓存节点数据
            nodeMapping.get(node.getParentId()).add(0,node);
            nodeMapping.put(node.getId(),node.getChildren());
        } else {
            throw new MessageException("没有找到留言的地方~");
        }
    }


}
