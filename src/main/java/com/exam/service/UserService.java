package com.exam.service;

import com.exam.dto.UserDTO;

import java.util.Map;

public interface UserService {

    public UserDTO idCheck(String userid);
    public int addUser(UserDTO dto);
    public UserDTO findById(String userid);
    public UserDTO myPage(String userid);
    public int updateUser(UserDTO dto);
}
