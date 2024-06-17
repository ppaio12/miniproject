package com.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    Logger logger = LoggerFactory.getLogger(getClass());

    // jw 브랜치 테스트 13:03
    // sh 브랜치 테스트
    @GetMapping("/main")
    public String main() {
        return "main";
    }

}
