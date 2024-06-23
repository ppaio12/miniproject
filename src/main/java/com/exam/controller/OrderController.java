package com.exam.controller;

import com.exam.dto.CartDTO;
import com.exam.dto.UserDTO;
import com.exam.service.CartService;
import com.exam.service.OrderService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class OrderController {

    OrderService orderService;
    CartService cartService;

    public OrderController(OrderService orderService, CartService cartService) {
        this.orderService = orderService;
        this.cartService = cartService;
    }

    // 주문 페이지 요청
    @PostMapping("/orderForm")
    public String orderProduct(@AuthenticationPrincipal UserDTO userDTO, ModelMap model) {
        return "redirect:orderForm";
    }

    // 주문 페이지
    @GetMapping("/orderForm")
    public String orderForm(@AuthenticationPrincipal UserDTO userDTO, ModelMap model) {
        model.addAttribute("userDTO", userDTO);

        int user_idx = userDTO.getUser_idx();
        List<CartDTO> cartList = cartService.cartList(user_idx);
        model.addAttribute("cartList", cartList);

        return "orderForm";
    }



}
