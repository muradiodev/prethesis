package com.prethesis.controller;


import com.prethesis.service.impl.TicketServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
//import javax.ws.rs.Path;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
//@RequestMapping("/tickets")
public class ControllerTicket {

//    private final RepoTicket repoTicket;
//    private final RepoAnnotation repoAnnotation;

    private final TicketServiceImpl ticketService;


    @PostMapping("/tickets")
    public String addTicket(HttpServletRequest request) throws IOException {
        System.out.println("Tickets geldi");
        ticketService.addTicket(request);
        return "main/index";
    }

    @GetMapping("/tickets")
    public String getAll(Model md) {
        ticketService.getAll(md);
        return "admin/tickets";
    }

    @GetMapping("/viewTicket")
    public String getTicketDetails(@RequestParam String viewGuid, Model md) {
        ticketService.getTicketDetails(viewGuid, md);
        return "admin/viewticket";
    }

    @GetMapping("/deleteTicket")
    public String deleteTicketByViewGuid(@RequestParam String viewGuid) {
        ticketService.deleteTicketByViewGuid(viewGuid);
        return "redirect:/tickets";
    }

    @GetMapping("/openTicket")
    public String openTicket(@RequestParam String viewGuid, Model md) {
        ticketService.getTicketDetails(viewGuid, md);
        System.out.println("test " +  ticketService);
        return "";
    }

    @GetMapping("/deleteAnnotation")
    public String deleteAnnotationByViewGuid(@RequestParam int id, @RequestParam String viewGuid) {
        ticketService.deleteAnnotationByViewGuid(id, viewGuid);
        return "redirect:/viewTicket?viewGuid=" + viewGuid;
    }

}
