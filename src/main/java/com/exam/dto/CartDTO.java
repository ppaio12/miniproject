package com.exam.dto;

import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("CartDTO")
public class CartDTO {
    private int cart_idx;
    private int product_idx;
    private int user_idx;
    private int cart_quantity;
    private String cart_color;
    private String cart_size;
    private List<ProductDTO> cartList;

    public CartDTO() {
    }

    public CartDTO(int cart_idx, int product_idx, int user_idx, int cart_quantity, String cart_color, String cart_size, List<ProductDTO> cartList) {
        this.cart_idx = cart_idx;
        this.product_idx = product_idx;
        this.user_idx = user_idx;
        this.cart_quantity = cart_quantity;
        this.cart_color = cart_color;
        this.cart_size = cart_size;
        this.cartList = cartList;
    }

    public int getCart_idx() {
        return cart_idx;
    }

    public void setCart_idx(int cart_idx) {
        this.cart_idx = cart_idx;
    }

    public int getProduct_idx() {
        return product_idx;
    }

    public void setProduct_idx(int product_idx) {
        this.product_idx = product_idx;
    }

    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public int getCart_quantity() {
        return cart_quantity;
    }

    public void setCart_quantity(int cart_quantity) {
        this.cart_quantity = cart_quantity;
    }

    public String getCart_color() {
        return cart_color;
    }

    public void setCart_color(String cart_color) {
        this.cart_color = cart_color;
    }

    public String getCart_size() {
        return cart_size;
    }

    public void setCart_size(String cart_size) {
        this.cart_size = cart_size;
    }

    public List<ProductDTO> getCartList() {
        return cartList;
    }

    public void setCartList(List<ProductDTO> cartList) {
        this.cartList = cartList;
    }

    @Override
    public String toString() {
        return "CartDTO{" +
                "cart_idx=" + cart_idx +
                ", product_idx=" + product_idx +
                ", user_idx=" + user_idx +
                ", cart_quantity=" + cart_quantity +
                ", cart_color='" + cart_color + '\'' +
                ", cart_size='" + cart_size + '\'' +
                ", cartList=" + cartList +
                '}';
    }
}
