package com.example.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * @author: aria
 * @date-time: 2022/6/2 22:30
 */
@Data
public class RecordId {

    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;
}
