package com.example.service.user.impl;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.SaTokenInfo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.common.AuthorizationUtil;
import com.example.common.MessageException;
import com.example.mapper.UserInfoMapper;
import com.example.model.user.LoginAccountPassword;
import com.example.model.user.UserInfo;
import com.example.service.user.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户基本信息业务
 * @author aria
 * @date 2022/6/2 22:45
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    /**
     * 用户信息 Mapper
     */
    private final UserInfoMapper userInfoMapper;

    @Autowired
    public UserInfoServiceImpl(UserInfoMapper userInfoMapper) {this.userInfoMapper = userInfoMapper;}

    @Override
    public SaTokenInfo login(LoginAccountPassword loginInfo) {
        // 通过账号和邮箱以及密码查询当前登录账号信息（如需遇高并发场景可增加缓存）
        UserInfo userInfo = userInfoMapper.selectOne(new LambdaQueryWrapper<UserInfo>()
                // 查询用户基本信息缓存至 session
                .select(UserInfo::getId,UserInfo::getUserName,UserInfo::getEmail,UserInfo::getHeadPortrait)
                // account字段 和 email字段 or 查询，实现账号或邮箱登录
                .eq(UserInfo::getUserName,loginInfo.getUserName()).or().eq(UserInfo::getEmail,loginInfo.getUserName())
                // 密码匹配
                .eq(UserInfo::getPassword,SaSecureUtil.sha256(loginInfo.getPassword()))
        );

        if(null == userInfo) {
            throw new MessageException("账号或密码错误！");
        }

        return AuthorizationUtil.loginSuccess(loginInfo.getRememberMe(),userInfo);
    }

    @Override
    public boolean register(UserInfo userInfo) {
        if(checkAccountExist(userInfo.getUserName())) {
            throw new MessageException("当前账号名称已存在，请重新创建~");
        }

        // 对用户密码进行加密
        userInfo.setPassword(SaSecureUtil.sha256(userInfo.getPassword()));
        // 设置用户头像
        userInfo.setHeadPortrait(AuthorizationUtil.getHeadPortraitFilePath());
        int effect = userInfoMapper.insert(userInfo);

        return effect == 1 && userInfo.getId() != null;
    }

    @Override
    public boolean checkAccountExist(String name) {
        return userInfoMapper.exists(new LambdaQueryWrapper<UserInfo>().eq(UserInfo::getUserName,name));
    }
}
