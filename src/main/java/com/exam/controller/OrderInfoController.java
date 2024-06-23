package com.exam.controller;

import com.exam.dto.OrderInfoDTO;
import com.exam.dto.ProductDTO;
import com.exam.dto.UserDTO;
import com.exam.service.OrderService;
import com.exam.service.ProductService;
import com.exam.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class OrderInfoController {

    OrderService orderService;
    UserService userService;
    ProductService productService;

    public OrderInfoController(UserService userService, OrderService orderService, ProductService productService) {
        this.userService = userService;
        this.orderService = orderService;
        this.productService = productService;
    }

    @PostMapping("/orderAdd")
    public String orderAdd(@AuthenticationPrincipal UserDTO userDTO,
                           @RequestParam List<Integer> product_idx,
                           @RequestParam List<Integer> cart_quantity,
                           @RequestParam List<String> cart_color,
                           @RequestParam List<String> cart_size,
                           OrderInfoDTO orderInfoDTO) {

        List<OrderInfoDTO> insertDto = new ArrayList<>();
        int orderIdx = orderService.getMaxOrderIdx();
        int total = 0;
        for(int i = 1; i <= product_idx.size(); i++) {
            OrderInfoDTO pushDto = orderInfoDTO.clone();
            pushDto.setUser_idx(userDTO.getUser_idx());
            pushDto.setOrder_idx(orderIdx);
            pushDto.setOrder_idx_sn(i);
            pushDto.setProduct_idx(product_idx.get(i-1));
            pushDto.setCart_quantity(cart_quantity.get(i-1));
            pushDto.setCart_size(cart_size.get(i-1));
            pushDto.setCart_color(cart_color.get(i-1));

            insertDto.add(pushDto);

            ProductDTO product = productService.productDetail(product_idx.get(i-1));
            total += product.getProduct_price() * cart_quantity.get(i-1);
            System.out.println(pushDto.toString());
        }

        int result = orderService.addOrder(insertDto);

        if(result > 0) {
            int point = (int)Math.round(total * 0.05);
            userDTO.setUser_point(point);

            userService.updateUserPoint(userDTO);
        }


        return "redirect:orderInfo?orderId=" + orderIdx;
    }

    // 주문 확인
    @GetMapping("/orderInfo")
    public String OrderInfoform(@AuthenticationPrincipal UserDTO userDTO,
                                @RequestParam(name = "orderId", required = true) String orderId,
                                ModelMap model) {
        int orderIdx = Integer.parseInt(orderId);

        Map<String, Object> receiverUserInfo = orderService.getOrderUserInfo(orderIdx);
        List<Map<String, Object>> orderProduectInfo = orderService.getOrderProductInfo(orderIdx);

        int total = 0;
        for(Map<String, Object> map : orderProduectInfo) {
            total += (int) map.get("product_price") * (int) map.get("cart_quantity") ;
        }
        int point = (int)Math.round(total * 0.05);

        model.addAttribute("receiverUserInfo", receiverUserInfo);
        model.addAttribute("orderProduectInfo", orderProduectInfo);
        model.addAttribute("point", point);

        return "orderInfo";
    }

    // 주문내역
    @GetMapping("/orderList")
    public String orderList(@AuthenticationPrincipal UserDTO userDTO, ModelMap model) {

        int userIdx = userDTO.getUser_idx();

        Map<String, Object> receiverUserInfoMany = orderService.getOrderUserInfoMany(userIdx);
        List<Map<String, Object>> orderProductInfoMany = orderService.getOrderProductInfoMany(userIdx);

        model.addAttribute("receiverUserInfoMany", receiverUserInfoMany);
        model.addAttribute("orderProductInfoMany", orderProductInfoMany);

        System.out.println(orderProductInfoMany.toString());

        return "orderList";
    }

}
