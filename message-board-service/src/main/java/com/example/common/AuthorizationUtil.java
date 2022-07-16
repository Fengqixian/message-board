package com.example.common;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.example.model.user.UserInfo;
import lombok.extern.slf4j.Slf4j;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 授权信息工具类
 * @Author: aria
 * @Date: 2022/6/2 23:23
 */
@Slf4j
public class AuthorizationUtil {


    // 随机数
    private static final ThreadLocalRandom random  = ThreadLocalRandom.current();

    // session key
    private static final String USER_INFO = "info";

    private static final String[] HEAD_RESOURCE = {"20220604173345.png","20220604173409.png","20220604173446.png","20220604173502.png","20220604173542.png","20220604173553.png","20220604173615.png","20220604173625.png","20220604173636.png","20220604173653.png","20220604173711.png"};

    /**
     * 获取随机头像
     * @return 头像文件名称
     */
    public static String getHeadPortraitFilePath() {
        //TODO 通过随机数获取头像文件
        int length = HEAD_RESOURCE.length;
        return HEAD_RESOURCE[random.nextInt(length -1)];
    }


    /**
     * 登录成功
     * @param rememberMe 是否记住我
     * @param userInfo 登录账号信息
     */
    public static SaTokenInfo loginSuccess(Boolean rememberMe,UserInfo userInfo) {
        try{
            //TODO 设置当前用户登录状态和 remember-me 状态
            StpUtil.login(userInfo.getId(),rememberMe);
            StpUtil.getSession().set(USER_INFO,userInfo);
            return StpUtil.getTokenInfo();
        } catch (Exception e) {
            throw new MessageException("登录状态设置异常~");
        }
    }

    /**
     * 通过session获取当前登录账号基本信息
     * @return 用户信息
     */
    public static UserInfo getCurrentUserInfo() {
        Object info;
        try{
            info = StpUtil.getSession().get(USER_INFO);
            return (UserInfo)info;
        } catch (Exception e) {
            throw new MessageException("登录状态已失效，请重新登录~");
        }
    }

    /**
     * 退出登录
     * @return 是否登录
     */
    public static Boolean logout() {
        StpUtil.logout();
        return !StpUtil.isLogin();
    }
}

