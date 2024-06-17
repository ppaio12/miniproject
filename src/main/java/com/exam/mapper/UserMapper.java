package com.exam.mapper;

import com.exam.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapper {

    public UserDTO idCheck(String id);
    public int addUser(UserDTO dto);
    public UserDTO login(Map<String, String> map);
    public UserDTO findById(String id);
//    public MemberDTO myPage(String userid);
}
