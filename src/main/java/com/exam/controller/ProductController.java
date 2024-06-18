package com.exam.controller;

import com.exam.dto.ProductDTO;
import com.exam.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/productDetail")
        public String productDetail(@RequestParam int category_idx, Model model) {
        ProductDTO productDTO = productService.productDetail(category_idx);
        model.addAttribute("product", productDTO);
        return "productDetail";
    }

}
