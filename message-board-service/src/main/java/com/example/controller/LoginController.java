package com.example.controller;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.example.common.AuthorizationUtil;
import com.example.common.RestResponse;
import com.example.model.user.LoginAccountPassword;
import com.example.model.user.UserInfo;
import com.example.service.user.UserInfoService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

/**
 * 用户登录 API
 * @author: aria
 * @date-time: 2022/6/2 20:26
 */
@RestController
@RequestMapping("/user")
public class LoginController {

    @Resource
    UserInfoService service;

    /**
     * 用户登录接口
     * @param user 账号密码
     * @return
     */
    @PostMapping("/login")
    public RestResponse<SaTokenInfo> login(@Validated @RequestBody LoginAccountPassword user) {
        return RestResponse.success(service.login(user));
    }

    /**
     * 账号注册
     * @param userInfo
     * @return
     */
    @PostMapping("/register")
    public RestResponse<Boolean> register(@Validated @RequestBody UserInfo userInfo) {
        return RestResponse.success(service.register(userInfo));
    }

    /**
     * 检测用户名称是否已存在
     * @param name
     * @return
     */
    @GetMapping("/exist/{name}")
    public RestResponse<Boolean> exist(@PathVariable("name") String name) {
        return RestResponse.success(service.checkAccountExist(name));
    }

    /**
     * 获取用户身份信息接口
     * @return
     */
    @GetMapping("/info")
    public RestResponse info() {
        return RestResponse.success(AuthorizationUtil.getCurrentUserInfo());
    }

    /**
     * 退出登录接口
     * @return
     */
    @PostMapping("/logout")
    public RestResponse logout() {
        return RestResponse.success(AuthorizationUtil.logout());
    }
}
