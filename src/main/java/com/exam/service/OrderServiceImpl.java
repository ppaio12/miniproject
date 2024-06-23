package com.exam.service;

import com.exam.dto.OrderInfoDTO;
import com.exam.mapper.OrderMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService{

    OrderMapper orderMapper;

    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public int addOrder(List<OrderInfoDTO> orderInfoDTO) {
        return orderMapper.addOrder(orderInfoDTO);
    }

    @Override
    public int getMaxOrderIdx() {
        return orderMapper.getMaxOrderIdx();
    }

    @Override
    public Map<String, Object> getOrderUserInfo(int orderIdx) {
        Map<String, Object> resultMap = orderMapper.findOrderUserInfoOne(orderIdx);

        return resultMap;
    }

    @Override
    public Map<String, Object> getOrderUserInfoMany(int userIdx) {
        Map<String, Object> resultMap = orderMapper.findOrderUserInfoOne(userIdx);

        return resultMap;
    }

    @Override
    public List<Map<String, Object>> getOrderProductInfo(int orderIdx) {
        List<Map<String, Object>> resultList = orderMapper.findOrderProductByCart(orderIdx);

        return resultList;
    }

    @Override
    public List<Map<String, Object>> getOrderProductInfoMany(int userIdx) {
        List<Map<String, Object>> resultList = orderMapper.findOrderProductByCart(userIdx);

        return resultList;
    }

}
