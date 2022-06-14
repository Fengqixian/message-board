package com.example.service.user;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.example.model.user.LoginAccountPassword;
import com.example.model.user.UserInfo;

/**
 * 用户基本信息业务接口
 * @author: aria
 * @date-time: 2022/6/2 22:43
 */
public interface UserInfoService {

    /**
     * 登录系统
     * @param loginInfo
     * @return
     */
    SaTokenInfo login(LoginAccountPassword loginInfo);

    /**
     * 用户注册
     * @param userInfo
     * @return
     */
    boolean register(UserInfo userInfo);

    /**
     * 检测注册账号是否已存在
     * @param name
     * @return
     */
    boolean checkAccountExist(String name);
}
