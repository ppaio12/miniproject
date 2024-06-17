package com.exam.controller;

import com.exam.dto.UserDTO;
import com.exam.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    // 회원가입 폼
    @GetMapping("/signup")
    public String singupForm(ModelMap modelMap) {
        UserDTO dto = new UserDTO();

        modelMap.addAttribute("UserDTO", dto);

        return "signupForm";
    }
    
    // 회원가입 POST요청
    @PostMapping("/signup")
    public String signup(@Valid UserDTO userDTO, BindingResult result) {
        System.out.println(userDTO.toString());

//        if (result.hasErrors()) {
//            return "signupForm";
//        }

        logger.info("signup:{}", userDTO);
        int n = userService.addUser(userDTO);

        return "redirect:main";
    }
//
//    @GetMapping("/myPage")
//    public String myPage(ModelMap model) {
//        UserDTO dto = (UserDTO) model.getAttribute("login");
//
//        String userid = dto.getUser_id();
//
//        UserDTO searchDTO = userService.myPage(userid);
//        model.addAttribute("login", searchDTO);
//
//        return "myPage";
//    }


}
