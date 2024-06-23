package com.exam.mapper;

import com.exam.dto.OrderInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {

    int addOrder(List<OrderInfoDTO> orderInfoDTO);
    int getMaxOrderIdx();
    Map<String, Object> findOrderUserInfoOne(int orderIdx);
    Map<String, Object> findOrderUserInfoMany(int userIdx);
    List<Map<String, Object>> findOrderProductByCart(int orderIdx);
    List<Map<String, Object>> findOrderProductByCartMany(int userIdx);
}
