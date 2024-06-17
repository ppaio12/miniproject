package com.exam.service;

import com.exam.dto.UserDTO;
import com.exam.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

    UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public UserDTO idCheck(String user_id) {
        return userMapper.idCheck(user_id);
    }

    @Override
    public int addUser(UserDTO user) {
        return userMapper.addUser(user);
    }

    @Override
    public UserDTO login(Map<String, String> map) {
        return userMapper.login(map);
    }

    @Override
    public UserDTO findById(String userid) {
        return userMapper.findById(userid);
    }
}
