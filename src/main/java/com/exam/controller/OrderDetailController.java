package com.exam.controller;

import com.exam.dto.OrderInfoDTO;
import com.exam.dto.UserDTO;
import com.exam.service.OrderService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class OrderDetailController {

    OrderService orderService;

    public OrderDetailController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping("orderPayment")
    public String orderPayment(@AuthenticationPrincipal UserDTO userDTO,
                               @RequestParam int order_totalPrice,
                               @RequestParam String order_comment,
                               @RequestParam int product_idx,
                               ModelMap model) {

        System.out.println(userDTO.getUser_idx());
        System.out.println(product_idx);
        System.out.println(order_comment);
        System.out.println(order_totalPrice);
        System.out.println(order_comment);


        OrderInfoDTO orderInfoDTO = new OrderInfoDTO();
        orderInfoDTO.setUser_idx(userDTO.getUser_idx());
        orderInfoDTO.setProduct_idx(product_idx);
        orderInfoDTO.setOrder_totalPrice(order_totalPrice);
        orderInfoDTO.setOrder_comment(order_comment);
        orderInfoDTO.setOrder_comment(order_comment);
        orderInfoDTO.setOrder_date(new Date());

        int result = orderService.addOrder(orderInfoDTO);

        return "redirect:orderList";
    }
}
