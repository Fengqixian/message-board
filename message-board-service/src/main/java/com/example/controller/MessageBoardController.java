package com.example.controller;

import com.example.common.RestResponse;
import com.example.model.message.MessageBoardDetail;
import com.example.model.message.MessageBoardTreeNode;
import com.example.service.message.MessageBoardService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

/**
 * 留言板 API
 * @author aria
 * @date 2022/6/5 11:19
 */
@RestController
@RequestMapping("/message")
public class MessageBoardController {

    @Resource
    MessageBoardService messageBoardService;

    /**
     * 添加一条评论内容
     * @param detail 明细内容
     * @return 评论节点
     */
    @PostMapping("/add")
    public RestResponse<MessageBoardTreeNode> add(@Validated @RequestBody MessageBoardDetail detail) {
        return RestResponse.success(messageBoardService.addMessage(detail));
    }

    /**
     * 留言板信息列表
     * @return 留言板消息列表
     */
    @GetMapping("/list")
    public RestResponse<List<MessageBoardTreeNode>> list() {
        return RestResponse.success(messageBoardService.getData());
    }
}
