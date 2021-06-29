package com.prethesis.controller;

import com.prethesis.entity.Annotation;
import com.prethesis.entity.Ticket;
import com.prethesis.entity.User;
import com.prethesis.repo.RepoAnnotation;
import com.prethesis.repo.RepoTicket;
import com.prethesis.repo.RepoUser;
import com.prethesis.security.PdfUserDetails;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {


    @Autowired
    RepoAnnotation repoAnnotation;

    @Autowired
    private RepoTicket repoTicket;


    @RequestMapping("/openTicket")
    @ResponseBody
    public ResponseEntity openTicketInWebsite(HttpServletRequest request, Model md) {
        System.out.println("viewGuid");

        String viewGuid = request.getParameter("viewGuid");

        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);

        System.out.println(ticket);

        List<Annotation> anno = repoAnnotation.findAnnotationByguidAndIsActive(viewGuid, 1);
        ticket.setAnnotationList(anno);

        return ResponseEntity.status(HttpStatus.OK).body(ticket);
    }

    @Autowired
    RepoUser userRepo;

    private static final Logger log = LogManager.getLogger(LoginController.class);

    @RequestMapping(value = {"/login"})
    public String login() {

        return "admin/login";
    }

    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginError(Model model) {
        log.info("Login attempt failed");
        model.addAttribute("error", "true");

        return "admin/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(SessionStatus session, Model model) {
        SecurityContextHolder.getContext().setAuthentication(null);
        session.setComplete();
        model.addAttribute("logout", "true");

        return "redirect:/login";
    }

    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public String postLogin(Model model, HttpSession session, HttpServletRequest request) {
        log.info("postLogin()");
        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        validatePrinciple(authentication.getPrincipal());
        User loggedInUser = ((PdfUserDetails) authentication.getPrincipal()).getUserDetails();

        model.addAttribute("currentUser", loggedInUser.getEmail());
        session.setAttribute("uid", loggedInUser.getUid());

        System.out.println(loggedInUser.getRoles().toString());
        if (loggedInUser.getRoles().toString().contains("ADMIN")) {
            return "redirect:/admin";

        }
        return "redirect:/login";
    }

    private void validatePrinciple(Object principal) {

        if (!(principal instanceof PdfUserDetails)) {
            throw new IllegalArgumentException("Principal can not be null!");
        }
    }
}
