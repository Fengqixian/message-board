package com.example;

import com.example.service.message.MessageBoardService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class MessageBoardApplicationTests {

    @Resource
    MessageBoardService messageBoardService;

    @Test
    void contextLoads() {
        messageBoardService.getData();
    }

}
