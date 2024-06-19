package com.exam.service;

import com.exam.dto.CartDTO;
import com.exam.mapper.CartMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService{

    CartMapper cartMapper;

    public CartServiceImpl(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Override
    public int cartAdd(CartDTO cartDTO) {
        return cartMapper.cartAdd(cartDTO);
    }

    @Override
    public List<CartDTO> cartList(int idx) {
        return cartMapper.cartList(idx);
    }

}
