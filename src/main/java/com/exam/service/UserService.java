package com.exam.service;

import com.exam.dto.UserDTO;

import java.util.Map;

public interface UserService {

    public UserDTO idCheck(String user_id);
    public int addUser(UserDTO user);
    public UserDTO login(Map<String, String> map);
    public UserDTO findById(String userid);
}
