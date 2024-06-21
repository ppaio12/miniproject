package com.exam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Alias("ProductDTO")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    private int product_idx;
    private String product_name;
    private int product_price;
    private String product_image;
    private String product_content;
    private int product_stock;
    private String product_category;
}
