package com.example.common;

import lombok.Getter;

/**
 * 自定义响应返回状态
 * @author aria
 * @date 2022/6/3 9:14
 */
@Getter
public enum ResponseStatus {

    SUCCESS(20000,"SUCCESS"),
    ERROR(50000,"ERROR"),
    ILLEGAL_TOKEN(50008,"Illegal token"),
    UNAUTHORIZED(50012,"Illegal token"),
    TOKEN_EXPIRE(50014,"Token expired");

    /**
     * 响应code
     */
    private final Integer code;

    /**
     * 响应状态
     */
    private final String status;

    ResponseStatus(Integer code,String status) {
        this.code = code;
        this.status = status;
    }
}
