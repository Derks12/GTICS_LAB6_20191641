package org.example.lab7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/openLoginWindow")
    public String openLoginWindow() { return "loginWindow";}


}