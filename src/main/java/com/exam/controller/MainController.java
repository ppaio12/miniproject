package com.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    Logger logger = LoggerFactory.getLogger(getClass());

    // 원복2
    @GetMapping("/main")
    public String main() {
        return "main";
    }

}
