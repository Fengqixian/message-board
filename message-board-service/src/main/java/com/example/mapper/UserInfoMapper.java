package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.model.user.UserInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户信息持久化 Mapper
 * @author: aria
 * @date-time: 2022/6/2 22:41
 */
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {
}
