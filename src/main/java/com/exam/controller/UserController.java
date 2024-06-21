package com.exam.controller;

import com.exam.dto.UserDTO;
import com.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class UserController {

    Logger logger = LoggerFactory.getLogger(getClass());

    UserService userService;
    public UserController(UserService userService) {
        this.userService = userService;
    }

    // ID중복확인
    @GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam String user_id) {
        UserDTO dto = userService.idCheck(user_id);
        String mesg = "사용 가능한 ID입니다";
        if (dto != null) {
            mesg = "사용 불가능한 ID입니다";
        }
        return mesg;
    }

    // 회원가입
    @GetMapping("/signup")
    public String singupForm(ModelMap model) {
        model.addAttribute("userDTO", new UserDTO());
        return "signupForm";
    }

    // 회원가입 POST요청
    @PostMapping("/signup")
    public String signup(@Valid UserDTO userDTO, BindingResult result) {
        if (result.hasErrors()) {
            return "signupForm";
        }
        // 비밀번호 암호화
        String criptPw = new BCryptPasswordEncoder().encode(userDTO.getUser_pw());
        userDTO.setUser_pw(criptPw);

        int n = userService.addUser(userDTO);

        return "redirect:main";
    }

    // 마이페이지
    @GetMapping("/myPage")
    public String myPageForm(ModelMap model, @AuthenticationPrincipal UserDTO userDTO) {
        model.addAttribute("login", userDTO);
        return "myPage";
    }

    // 마이페이지 수정 요청
    @PostMapping("/myPage")
    public String myPage(@Valid @ModelAttribute("login") UserDTO login, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                System.out.println(error.getDefaultMessage());
            }
            return "myPage";
        }
        // 비밀번호 암호화
        if (login.getUser_pw() != null && !login.getUser_pw().isEmpty()) {
            String criptPw = new BCryptPasswordEncoder().encode(login.getUser_pw());
            login.setUser_pw(criptPw);
        }

        int n = userService.updateUser(login);

        return "redirect:main";
    }


}
