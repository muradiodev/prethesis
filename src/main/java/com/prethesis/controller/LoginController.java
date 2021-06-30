package com.prethesis.controller;

import com.prethesis.entity.User;
import com.prethesis.repo.RepoUser;
import com.prethesis.security.PdfUserDetails;
import com.prethesis.service.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;

    @RequestMapping(value = {"/login"})
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginError(Model md) {
        userService.loginError(md);
        return "admin/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(SessionStatus session, Model model) {
        userService.logout(session, model);
        return "redirect:/login";
    }

    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public String postLogin(Model model, HttpSession session, HttpServletRequest request) {
        return userService.postLogin(model, session, request);
    }


}
