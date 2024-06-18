package com.exam.mapper;

import com.exam.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

    public UserDTO idCheck(String userid);
    public int addUser(UserDTO dto);
    public UserDTO findById(String userid);
    public UserDTO myPage(String userid);
    public int updateUser(UserDTO dto);
}
