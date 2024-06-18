package com.exam.service;

import com.exam.dto.ProductDTO;
import com.exam.mapper.ProductMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    ProductMapper productMapper;

    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public List<ProductDTO> productList(String category) {
        return productMapper.productList(category);
    }

    @Override
    public ProductDTO productDetail(int idx) {
        return productMapper.productDetail(idx);
    }
}
