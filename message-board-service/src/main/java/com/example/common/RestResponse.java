package com.example.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

/**
 * Rest API 统一响应内容
 * @author aria
 * @date 2022/6/2 20:28
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class RestResponse<T> {

    /**
     * 响应编码
     */
    private Integer code;

    /**
     * 响应状态
     */
    private String message;

    /**
     * 响应实体内容
     */
    private T data;

    /**
     * REST API RESPONSE 构造函数
     * @param status 响应状态
     * @param data 响应内容
     */
    public RestResponse(ResponseStatus status, T data) {
        this.code = status.getCode();
        this.message = status.getStatus();
        this.data = data;
    }

    /**
     * 返回成功的请求
     * @param <T> 泛型
     * @param data 响应内容
     * @return 成功响应内容
     */
    public static <T> RestResponse<T> success(T data) {
        return new RestResponse<>(ResponseStatus.SUCCESS,data);
    }

    /**
     * 失败的请求
     * @param message 错误描述
     * @return 异常响应内容
     */
    public static  RestResponse<String> fail(String message) {
        return new RestResponse<>(ResponseStatus.ERROR,message);
    }


    /**
     * token失效
     * @return 异常响应内容
     */
    public static RestResponse<String> expire() {
        return new RestResponse<>(ResponseStatus.TOKEN_EXPIRE,"登录状态已失效，请重新登录~");
    }

}
