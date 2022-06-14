package com.example.model.message;

import com.example.common.MessageException;
import com.example.model.RecordId;
import com.example.model.user.UserInfo;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * 留言板数据视图
 * @author: aria
 * @date-time: 2022/6/5 10:37
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageBoardTreeNode extends RecordId {

    /**
     * 消息节点构造器
     * @param userInfo 用户基本信息
     * @param detail 消息记录
     */
    public MessageBoardTreeNode(UserInfo userInfo, MessageBoardDetail detail) {
        setId(detail.getId());
        this.parentId = detail.getParentId();
        this.userId = userInfo.getId();
        this.messageContent = detail.getMessageContent();
        this.releasedTime = detail.getReleasedTime();
        this.userName = userInfo.getUserName();
        this.email = userInfo.getEmail();
        this.headPortrait = userInfo.getHeadPortrait();

    }


    /**
     * 父级ID
     */
    private Long parentId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 消息内容
     */
    private String messageContent;

    /**
     * 发布时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp releasedTime;

    /**
     * 账号
     */
    private String userName;


    /**
     * 邮箱
     */
    private String email;

    /**
     * 头像地址
     */
    private String headPortrait;

    /**
     * 留言子集
     */
    private List<MessageBoardTreeNode> children = new ArrayList<>();


    /**
     * 添加一个节点
     * @param node
     * @return
     */
    public MessageBoardTreeNode addToTree(MessageBoardTreeNode node) {
        if(node.getParentId() == null) {
            throw new MessageException("父节点不能为空：" + node.getId());
        }
        if(node.getParentId().equals(this.getId())) {
            this.children.add(node);
            return this;
        } else {
            //TODO 在子集中寻找是否有满足条件的集合
            for(MessageBoardTreeNode downNode: children) {
                MessageBoardTreeNode temp = downNode.addToTree(node);
                if( temp!= null) {
                    return temp;
                }
            }
        }
        return null;
    }

    /**
     * 添加一个节点
     * @param node
     * @return
     */
    /*public boolean addToTree(MessageBoardTreeNode node) {
        if(node.getParentId() == null) {
            throw new MessageException("父节点不能为空：" + node.getId());
        }
        if(node.getParentId().equals(this.getId())) {
            return this.children.add(node);
        } else {
            //TODO 在子集中寻找是否有满足条件的集合
            for(MessageBoardTreeNode downNode: children) {
                if(downNode.addToTree(node)) {
                    return true;
                }
            }
        }
        return false;
    }*/
}
