package com.exam.controller;

import com.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "loginForm";
    }

    @PostMapping("/login_fail")
    public String login_failPage() {
        return "redirect:login";
    }

    @GetMapping("/login_success")
    public String login_successPage() {
        return "redirect:main";
    }

}
