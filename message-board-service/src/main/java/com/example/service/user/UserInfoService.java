package com.example.service.user;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.example.model.user.LoginAccountPassword;
import com.example.model.user.UserInfo;

/**
 * 用户基本信息业务接口
 * @author aria
 * @date 2022/6/2 22:43
 */
public interface UserInfoService {

    /**
     * 登录系统
     * @param loginInfo 登录用户信息
     * @return token
     */
    SaTokenInfo login(LoginAccountPassword loginInfo);

    /**
     * 系统账号注册
     * @param userInfo 用户信息
     * @return 成功/失败
     */
    boolean register(UserInfo userInfo);


    /**
     * 检测名称是否已存在
     * @param name 注册账号
     * @return 存在/不存在
     */
    boolean checkAccountExist(String name);
}
