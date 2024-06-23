package com.exam.service;

import com.exam.dto.OrderInfoDTO;

import java.util.List;
import java.util.Map;

public interface OrderService {

    public int addOrder(List<OrderInfoDTO> orderInfoDTO);
    public int getMaxOrderIdx();
    public Map<String, Object> getOrderUserInfo(int orderIdx);
    public List<Map<String, Object>> getOrderProductInfo(int orderIdx);
}
