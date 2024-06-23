package com.exam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("OrderInfo")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfoDTO {
    private int order_idx;
    private int order_idx_sn;
    private String user_name;
    private String user_email;
    private String user_phone;
    private String user_post;
    private String user_addr1;
    private String user_addr2;
    private String order_comment;
    private Date order_date;
    private int product_idx;
    private int cart_quantity;
    private String cart_color;
    private String cart_size;

    public OrderInfoDTO clone() {
        OrderInfoDTO returnDto = new OrderInfoDTO();

        returnDto.setOrder_idx(this.order_idx);
        returnDto.setOrder_idx_sn(this.order_idx_sn);
        returnDto.setUser_name(this.user_name);
        returnDto.setUser_email(this.user_email);
        returnDto.setUser_phone(this.user_phone);
        returnDto.setUser_post(this.user_post);
        returnDto.setUser_addr1(this.user_addr1);
        returnDto.setUser_addr2(this.user_addr2);
        returnDto.setOrder_comment(this.order_comment);
        returnDto.setOrder_date(this.order_date);
        returnDto.setProduct_idx(this.product_idx);
        returnDto.setCart_quantity(this.cart_quantity);
        returnDto.setCart_color(this.cart_color);
        returnDto.setCart_size(this.cart_size);

        return returnDto;
    }
}

