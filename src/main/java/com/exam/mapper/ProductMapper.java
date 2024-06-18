package com.exam.mapper;

import com.exam.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    public List<ProductDTO> productList(String category);
    public ProductDTO productDetail(int idx);
}
