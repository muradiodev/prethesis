package com.prethesis.controller;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.prethesis.entity.Annotation;
import com.prethesis.entity.BasicAnnotation;
import com.prethesis.entity.Ticket;
import com.prethesis.repo.RepoAnnotation;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.TicketService;
import com.prethesis.service.impl.TicketServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
//import javax.ws.rs.Path;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
//@RequestMapping("/tickets")
public class ControllerTicket {

//    private final RepoTicket repoTicket;
//    private final RepoAnnotation repoAnnotation;

    private final TicketServiceImpl ticketService;


    @PostMapping("/tickets")
    public String addTicket(HttpServletRequest request, @RequestBody List<BasicAnnotation> annotations) throws IOException {
        ticketService.addTicket(request, annotations);
        return "main/index";
    }

    @GetMapping("/tickets")
    public String getAll(Model md) {
        ticketService.getAll(md);
        return "admin/tickets";
    }

    @GetMapping("/viewTicket")
    public String getTicketDetails(@RequestParam("viewGuid") String viewGuid, Model md) {
        ticketService.getTicketDetails(viewGuid, md);
        return "admin/viewticket";
    }

    @GetMapping("/deleteTicket")
    public String deleteTicketByViewGuid(@RequestParam("viewGuid") String viewGuid) {
        ticketService.deleteTicketByViewGuid(viewGuid);
        return "redirect:/tickets";
    }

    @GetMapping("/deleteAnnotation")
    public String deleteAnnotationByViewGuid(@RequestParam int id, @RequestParam("viewGuid") String viewGuid) {
        ticketService.deleteAnnotationByViewGuid(id, viewGuid);
        return "redirect:/viewTicket?viewGuid="+viewGuid;
    }

}
