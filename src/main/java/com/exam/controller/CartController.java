package com.exam.controller;

import com.exam.dto.CartDTO;
import com.exam.dto.UserDTO;
import com.exam.service.CartService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CartController {

    CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @PostMapping("/cartAdd")
    public String cartAdd(@RequestParam String cart_color,
                          @RequestParam String cart_size,
                          @RequestParam int cart_quantity,
                          @RequestParam int product_idx,
                          @AuthenticationPrincipal UserDTO userDTO) {

        CartDTO cartDTO = new CartDTO();
        cartDTO.setUser_idx(userDTO.getUser_idx());
        cartDTO.setProduct_idx(product_idx);
        cartDTO.setCart_color(cart_color);
        cartDTO.setCart_size(cart_size);
        cartDTO.setCart_quantity(cart_quantity);

        int result = cartService.cartAdd(cartDTO);

        return "redirect:cartList";
    }

    @GetMapping("/cartList")
    public String cartList(@AuthenticationPrincipal UserDTO userDTO, ModelMap model) {
        int user_idx = userDTO.getUser_idx();
        List<CartDTO> cartList = cartService.cartList(user_idx);
        System.out.println(cartList);
        model.addAttribute("cartList", cartList);

        return "cartList";
    }

}
