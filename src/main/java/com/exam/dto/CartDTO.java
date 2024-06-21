package com.exam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("CartDTO")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
    private int cart_idx;
    private int product_idx;
    private int user_idx;
    private int cart_quantity;
    private String cart_color;
    private String cart_size;
    private List<ProductDTO> cartList;

}
