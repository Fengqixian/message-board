package com.example.config;

import cn.dev33.satoken.exception.NotLoginException;
import com.example.common.MessageException;
import com.example.common.RestResponse;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理类
 * @author: aria
 * @date-time: 2022/6/2 22:07
 */
@RestControllerAdvice
public class GlobalExceptionAdvice {

    /**
     * 业务异常通知
     * @param e
     * @return
     */
    @ExceptionHandler(MessageException.class)
    public RestResponse message(MessageException e) {
        return RestResponse.fail(e.getMessage());
    }

    /**
     * 未授权异常拦截
     * @return
     */
    @ExceptionHandler(NotLoginException.class)
    public RestResponse notLogin() {
        return RestResponse.expire();
    }

    /**
     * 统一参数异常拦截
     * @param exception
     * @return
     */
    @ExceptionHandler(value= MethodArgumentNotValidException.class)
    public RestResponse MethodArgumentNotValidHandler(MethodArgumentNotValidException exception) {
        StringBuilder errorMes = new StringBuilder();
        for (FieldError error : exception.getBindingResult().getFieldErrors()) {
            errorMes.append(error.getDefaultMessage());
        }
        return RestResponse.fail(errorMes.toString());
    }
}
