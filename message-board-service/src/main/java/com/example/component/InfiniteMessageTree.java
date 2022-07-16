package com.example.component;

import com.example.common.MessageException;
import com.example.mapper.MessageBoardMapper;
import com.example.model.message.MessageBoardTreeNode;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * 无 限 层 级 树
 * @author F-QiXian
 * @date 2022/6/14 15:20
 */
@Data
@Component
@NoArgsConstructor
public class InfiniteMessageTree {


    @Resource
    MessageBoardMapper mapper;

    /**
     * 初始化留言板内容
     */
    @PostConstruct
    public void init() {
        List<MessageBoardTreeNode> nodeList = mapper.selectAllUserDetail();
        this.init(nodeList);
    }

    /**
     * 消息树： 使用 CopyOnWriteArrayList 避免并发数据更新出现线程安全问题
     */
    private List<MessageBoardTreeNode> listTree = new CopyOnWriteArrayList<>();

    /**
     * 节点映射：通过映射对节点增删操作的时间复杂度为O(1)， 使用 ConcurrentHashMap 避免并发数据更新出现线程安全问题
     */
    private Map<String, List<MessageBoardTreeNode>> nodeMapping;


    /**
     * 初始化无限层级树
     * @param list 列表数据
     */
    public void init(List<MessageBoardTreeNode> list) {
        nodeMapping  = new ConcurrentHashMap<>(list.size());
        // 通过父节点ID排序，使用降序插入的方式避免tree节点翻转
        list.stream().sorted(Comparator.comparingLong(MessageBoardTreeNode::getParentId)).forEach(this::findParentAdd);
    }

    /**
     * 根据父级ID寻找节点子集插入
     * @param node 目标节点
     * @return 成功/失败
     */
    public MessageBoardTreeNode findParentAdd(MessageBoardTreeNode node) {
        // 父级ID的 Key
        String key = node.getParentId().toString();
        // 设置子集映射
        nodeMapping.put(node.getId().toString(), node.getChildren());
        // 通过缓存插入记录或直接插入为头节点
        if (nodeMapping.containsKey(key) ? nodeMapping.get(key).add(node) : listTree.add(node)) {
            return node;
        } else {
            throw new MessageException("节点插入异常~");
        }

    }

}
