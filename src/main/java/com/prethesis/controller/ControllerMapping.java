package com.prethesis.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerMapping {

    @RequestMapping("/admin")
    public String openAdminPage() {
        return "admin/index";
    }

    @RequestMapping("/")
    public String openMainPage() {
        return "main/index";
    }

    @RequestMapping("/indexOpen")
    public String openIndex() {
        return "main/indexOpen";
    }
}
