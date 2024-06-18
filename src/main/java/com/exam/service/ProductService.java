package com.exam.service;

import com.exam.dto.ProductDTO;

import java.util.List;

public interface ProductService {

    public List<ProductDTO> productList(String category);
    public ProductDTO productDetail(int idx);

}
