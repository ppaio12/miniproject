package com.exam.dto;

import org.apache.ibatis.type.Alias;

@Alias("ProductDTO")
public class ProductDTO {
    private int product_idx;
    private String product_name;
    private int product_price;
    private String product_image;
    private String product_content;
    private int product_stock;
    private String product_category;

    public ProductDTO() {
    }

    public ProductDTO(int product_idx, String product_name, int product_price, String product_image, String product_content, int product_stock, String product_category) {
        this.product_idx = product_idx;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_image = product_image;
        this.product_content = product_content;
        this.product_stock = product_stock;
        this.product_category = product_category;
    }

    public int getProduct_idx() {
        return product_idx;
    }

    public void setProduct_idx(int product_idx) {
        this.product_idx = product_idx;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public String getProduct_content() {
        return product_content;
    }

    public void setProduct_content(String product_content) {
        this.product_content = product_content;
    }

    public int getproduct_stock() {
        return product_stock;
    }

    public void setproduct_stock(int product_stock) {
        this.product_stock = product_stock;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    @Override
    public String toString() {
        return "ProductDTO{" +
                "product_idx=" + product_idx +
                ", product_name='" + product_name + '\'' +
                ", product_price=" + product_price +
                ", product_image='" + product_image + '\'' +
                ", product_content='" + product_content + '\'' +
                ", product_stock=" + product_stock +
                ", product_category='" + product_category + '\'' +
                '}';
    }
}
