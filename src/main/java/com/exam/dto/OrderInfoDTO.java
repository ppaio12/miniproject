package com.exam.dto;

public class OrderInfoDTO {
    private int ordder_idx;
    private int product_idx;
    private int user_idx;
    private int order_totalPrice;

    public OrderInfoDTO() {
    }

    public OrderInfoDTO(int ordder_idx, int product_idx, int user_idx, int order_totalPrice) {
        this.ordder_idx = ordder_idx;
        this.product_idx = product_idx;
        this.user_idx = user_idx;
        this.order_totalPrice = order_totalPrice;
    }

    public int getOrdder_idx() {
        return ordder_idx;
    }

    public void setOrdder_idx(int ordder_idx) {
        this.ordder_idx = ordder_idx;
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

    public int getOrder_totalPrice() {
        return order_totalPrice;
    }

    public void setOrder_totalPrice(int order_totalPrice) {
        this.order_totalPrice = order_totalPrice;
    }

    @Override
    public String toString() {
        return "OrderInfoDTO{" +
                "ordder_idx=" + ordder_idx +
                ", product_idx=" + product_idx +
                ", user_idx=" + user_idx +
                ", order_totalPrice=" + order_totalPrice +
                '}';
    }
}
