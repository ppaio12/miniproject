package com.exam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Alias("OrderInfo")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfoDTO {
    private int ordder_idx;
    private int product_idx;
    private int user_idx;
    private int order_totalPrice;
    private String order_comment;
}
