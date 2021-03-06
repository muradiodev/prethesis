package com.prethesis.controller;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.prethesis.entity.Annotation;
import com.prethesis.entity.BasicAnnotation;
import com.prethesis.entity.Ticket;
import com.prethesis.repo.RepoAnnotation;
import com.prethesis.repo.RepoTicket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
//@RequestMapping("/tickets")
public class ControllerTicket {


    @Autowired
    private RepoTicket repoTicket;

    @Autowired
    private RepoAnnotation repoAnnotation;

    @PostMapping("/tickets")
    public String addTicket(HttpServletRequest request, @RequestBody List<BasicAnnotation> annotations) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        System.out.println(" name " + name + " email " + email);
        System.out.println(" ");

        Date now = new Date();
        String viewGuid = generateToken();
        Ticket ticket = new Ticket(null, null, null, null, name, email,
                null, null, null, null, viewGuid,
                null, now, 1);
        repoTicket.save(ticket);


//        List<String> comment_list = Arrays.asList(comment.split(","));
//        ArrayList<String> list = new ArrayList<String>();
//        for (int i = 0; i < comment_list.size(); i++) {
//            list.add(comment_list.get(i));
//        }
        Annotation an;
        for (int i = 0; i < annotations.size(); i++) {
            System.out.println(annotations.get(i).getComment());
            System.out.println(annotations.get(i).getTop());
            System.out.println(annotations.get(i).getLeft());
            System.out.println(" --- ");

            an = new Annotation(viewGuid, annotations.get(i).getComment(), annotations.get(i).getTop(), annotations.get(i).getLeft(), viewGuid);
            repoAnnotation.save(an);


        }
        return "main/index";
    }


    protected static SecureRandom random = new SecureRandom();

    public static String generateToken() {

        long longToken = Math.abs(random.nextLong());
        String random = Long.toString(longToken, 16);
//        System.out.println("asdfg:" + random);
        return ("asdfg:" + random);
    }

//    @ResponseBody
//    @RequestMapping("/getNameAj/{viewGuid}")
//    public ResponseEntity getNameAj(@PathVariable("name") String viewGuid) {
//        System.out.println("asdfg");
//        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
////        System.out.println(repoTicket.findTicketsByviewGuid(viewGuid).);
//        return ResponseEntity.status(HttpStatus.OK).body(ticket);
//    }

    @GetMapping("/tickets")
    public String getAll(Model md) {
        List<Ticket> tickets = repoTicket.findAllByIsActiveOrderByPostDateDesc(1);
        for (Ticket ticket : tickets) {
           Long annotationCount =  repoAnnotation.countAllByTicketId(ticket.getViewGuid());
            ticket.setAnnotationCount(annotationCount);
        }
        md.addAttribute("tickets", tickets);
        System.out.println(tickets);
        return "admin/tickets";
    }

    @GetMapping("/viewTicket")
    public String getTicketDetails(@RequestParam("viewGuid") String viewGuid, Model md) {
        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
//        System.out.println(repoTicket.findTicketsByviewGuid(viewGuid).);
        List<Ticket> t_list = new ArrayList<>();
        t_list.add(ticket);
        md.addAttribute("ticket", t_list);
        System.out.println(ticket);

        List<Annotation> anno = repoAnnotation.findAnnotationByguidAndIsActive(viewGuid, 1);
        md.addAttribute("anns", anno);
        return "admin/viewticket";
    }

    @GetMapping("/deleteTicket")
    public String deleteTicketByViewGuid(@RequestParam("viewGuid") String viewGuid) {
        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
        ticket.setIsActive(0);
        repoTicket.save(ticket);
        return "redirect:/tickets";
    }

    @GetMapping("/deleteAnnotation")
    public String deleteAnnotationByViewGuid(@RequestParam int id, @RequestParam("viewGuid") String viewGuid) {
        Annotation annotation = repoAnnotation.findById(id);
        annotation.setIsActive(0);
        repoAnnotation.save(annotation);
        return "redirect:/viewTicket?viewGuid="+viewGuid;
    }

//    @RequestMapping("/getNameReq")
//    public String getNameReq(@RequestParam("viewGuid") String viewGuid) {
//        System.out.println("asdfg");
//        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
//        List<Annotation> annotation = repoAnnotation.findAnnotationByguid(viewGuid);
//        System.out.println(ticket.getName() + "  " + ticket);
//        for (int i = 0; i < annotation.size(); i++) {
//            System.out.println(annotation.get(i).getComment() + "  " + ticket);
//        }
//
//        return "";
//    }
}
