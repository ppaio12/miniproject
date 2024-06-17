package com.exam.dto;

public class CartDTO {
    private int cart_idx;
    private int product_idx;
    private int user_idx;
    private int cart_quantity;

    public CartDTO() {
    }

    public CartDTO(int cart_idx, int product_idx, int user_idx, int cart_quantity) {
        this.cart_idx = cart_idx;
        this.product_idx = product_idx;
        this.user_idx = user_idx;
        this.cart_quantity = cart_quantity;
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

    @Override
    public String toString() {
        return "CartDTO{" +
                "cart_idx=" + cart_idx +
                ", product_idx=" + product_idx +
                ", user_idx=" + user_idx +
                ", cart_quantity=" + cart_quantity +
                '}';
    }
}
