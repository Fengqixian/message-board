package com.example.common;

import lombok.NoArgsConstructor;

/**
 * 业务异常信息
 */
@NoArgsConstructor
public class MessageException extends RuntimeException{

    /**
     * 全局异常构造方法
     * @param message 异常描述信息
     */
    public MessageException(String message) {
        super(message);
    }
}
