//package com.prethesis.service.impl;
//
//import com.prethesis.controller.LoginController;
//import com.prethesis.entity.User;
//import com.prethesis.security.PdfUserDetails;
//import com.prethesis.service.UserService;
//import lombok.RequiredArgsConstructor;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.support.SessionStatus;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//@Service
//@RequiredArgsConstructor
//public class UserServiceImpl implements UserService {
//
//    private static final Logger log = LogManager.getLogger(LoginController.class);
//
//    @Override
//    public void loginError(Model md) {
//        log.info("Login attempt failed");
//        md.addAttribute("error", "true");
//    }
//
//    @Override
//    public void logout(SessionStatus session, Model model) {
//        SecurityContextHolder.getContext().setAuthentication(null);
//        session.setComplete();
//        model.addAttribute("logout", "true");
//    }
//
//    @Override
//    public String postLogin(Model model, HttpSession session, HttpServletRequest request) {
//        log.info("postLogin()");
//        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
//        validatePrinciple(authentication.getPrincipal());
//        User loggedInUser = ((PdfUserDetails) authentication.getPrincipal()).getUserDetails();
//
//        model.addAttribute("currentUser", loggedInUser.getEmail());
//        session.setAttribute("uid", loggedInUser.getUid());
//
//        System.out.println(loggedInUser.getRoles().toString());
//        if (loggedInUser.getRoles().toString().contains("ADMIN")) {
//            return "redirect:/admin";
//
//        }
//        return "redirect:/login";
//    }
//
//    private void validatePrinciple(Object principal) {
//
//        if (!(principal instanceof PdfUserDetails)) {
//            throw new IllegalArgumentException("Principal can not be null!");
//        }
//    }
//}
