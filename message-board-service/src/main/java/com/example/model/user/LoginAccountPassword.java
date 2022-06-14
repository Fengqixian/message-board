package com.example.model.user;

import lombok.Data;
import javax.validation.constraints.NotBlank;


/**
 * 用户登录请求内容
 * @author: aria
 * @date-time: 2022/6/2 21:54
 */
@Data
public class LoginAccountPassword {

    /**
     * 账号
     */
    @NotBlank(message = "账号不能为空")
    private String userName;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;

    /**
     * 记住我
     */
    private Boolean rememberMe = false;


}
