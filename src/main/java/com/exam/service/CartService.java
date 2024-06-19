package com.exam.service;

import com.exam.dto.CartDTO;

import java.util.List;

public interface CartService {

    public int cartAdd(CartDTO cartDTO);
    public List<CartDTO> cartList(int idx);

}
