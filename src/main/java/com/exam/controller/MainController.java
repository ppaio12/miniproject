package com.exam.controller;

import com.exam.dto.ProductDTO;
import com.exam.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    Logger logger = LoggerFactory.getLogger(getClass());

    ProductService productService;
    public MainController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "top") String product_category, ModelMap model) {

        List<ProductDTO> productList = productService.productList(product_category);

        model.addAttribute("productList", productList);

        return "main";
    }

}
