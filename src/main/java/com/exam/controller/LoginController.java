package com.exam.controller;

import com.exam.dto.UserDTO;
import com.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String showLoginPage(ModelMap model) {
        return "loginForm";
    }

    @PostMapping("/login_fail")
    public String login_failPage(RedirectAttributes redirectAttributes) {
        String mesg = "아이디 또는 비밀번호를 잘못 입력했습니다";
        redirectAttributes.addFlashAttribute("mesg", mesg);
        return "redirect:login";
    }

    @GetMapping("/login_success")
    public String login_successPage() {
        return "redirect:main";
    }

}
