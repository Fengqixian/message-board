package com.example.model.user;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.model.RecordId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * 系统用户基本信息
 * @author aria
 * @date 2022/6/2 22:39
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_userinfo")
public class UserInfo  extends RecordId  {

    /**
     * 账号
     */
    @NotBlank(message = "用户名不能为空")
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱
     */
    @NotBlank(message = "邮箱能为空")
    private String email;

    /**
     * 头像地址
     */
    private String headPortrait;

    /**
     * 账号是否可用
     */
    @TableLogic
    private Boolean enable;
}
