package com.exam.mapper;

import com.exam.dto.OrderInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    int addOrder(OrderInfoDTO orderInfoDTO);
}
