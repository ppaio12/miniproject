package com.exam.mapper;

import com.exam.dto.CartDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    public int cartAdd(CartDTO cartDTO);
    public List<CartDTO> cartList(int idx);
}
