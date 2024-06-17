package com.exam.controller;

import com.exam.dto.UserDTO;
import com.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value={"/login"})
    public String showLoginPage() {
        return "loginForm";
    }

    @GetMapping(value={"/login_fail"})
    public String showlogin_failPage() {
        logger.info("logger:showlogin_failPage");
        return "redirect:login";
    }

    @GetMapping(value={"/login_success"})
    public String showlogin_successPage() {
        logger.info("logger:showlogin_successPage");
        return "redirect:home";
    }

    @PostMapping("login")
    public String login(@RequestParam Map<String, String> map, ModelMap model) {
        UserDTO dto = userService.login(map);

        // 로그인이 되었다면
        if (dto != null) {
            model.addAttribute("login", dto);
            return "redirect:main";
        }

        // 로그인이 되지 않았다면
        model.addAttribute("errorMessage", "아이디 또는 비밀번호를 확인하세요");
        return "loginForm";
    }
}
