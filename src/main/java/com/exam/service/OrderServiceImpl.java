package com.exam.service;

import com.exam.dto.OrderInfoDTO;
import com.exam.mapper.OrderMapper;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{

    OrderMapper orderMapper;

    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public int addOrder(OrderInfoDTO orderInfoDTO) {
        return orderMapper.addOrder(orderInfoDTO);
    }
}
