package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.model.message.MessageBoardDetail;
import com.example.model.message.MessageBoardTreeNode;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;

/**
 * 留言板内容持久化 Mapper
 * @author aria
 * @date 2022/6/5 10:34
 */
@Mapper
public interface MessageBoardMapper extends BaseMapper<MessageBoardDetail> {

    /**
     * 查询所有用户留言板明细内容
     * @return 留言列表
     */
    @Select("select detail.id, parent_id, user_id, message_content, released_time,person.user_name,person.head_portrait,person.email from message_board_detail detail left join sys_userinfo person on (detail.user_id = person.id) order by detail.parent_id,released_time desc")
    List<MessageBoardTreeNode> selectAllUserDetail();
}
