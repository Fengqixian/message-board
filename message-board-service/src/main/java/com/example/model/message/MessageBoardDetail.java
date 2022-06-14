package com.example.model.message;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.model.RecordId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;

/**
 * 留言板明细内容
 * @author: aria
 * @date-time: 2022/6/5 10:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("message_board_detail")
public class MessageBoardDetail extends RecordId {


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
    @NotBlank(message = "评论内容不能为空~")
    private String messageContent;

    /**
     * 发布时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp releasedTime;

}
