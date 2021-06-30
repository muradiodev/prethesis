package com.prethesis.service.impl;

import com.prethesis.entity.Annotation;
import com.prethesis.entity.BasicAnnotation;
import com.prethesis.entity.Ticket;
import com.prethesis.repo.RepoAnnotation;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.TicketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final RepoTicket repoTicket;
    private final RepoAnnotation repoAnnotation;

    protected static SecureRandom random = new SecureRandom();

    public static String generateToken() {
        long longToken = Math.abs(random.nextLong());
        String random = Long.toString(longToken, 16);
        return ("asdfg:" + random);
    }

    @Override
    public void addTicket(HttpServletRequest request, List<BasicAnnotation> annotations) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Date now = new Date();
        String viewGuid = generateToken();
        Ticket ticket = new Ticket("0", "0", "833", "1688", name, email,
                "Chrome", "16px", null, null, viewGuid,
                null, now, 1);
        repoTicket.save(ticket);

        Annotation an;
        for (int i = 0; i < annotations.size(); i++) {
            an = new Annotation(viewGuid, annotations.get(i).getComment(), annotations.get(i).getTop(), annotations.get(i).getLeft(), viewGuid, 1);
            repoAnnotation.save(an);
        }
    }

    @Override
    public void getAll(Model md) {
        List<Ticket> tickets = repoTicket.findAllByIsActiveOrderByPostDateDesc(1);
        for (Ticket ticket : tickets) {
            Long annotationCount =  repoAnnotation.countAllByTicketId(ticket.getViewGuid());
            ticket.setAnnotationCount(annotationCount);
        }
        md.addAttribute("tickets", tickets);
        System.out.println(tickets);
    }

    @Override
    public void getTicketDetails(String viewGuid, Model md) {
        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
        List<Ticket> t_list = new ArrayList<>();
        t_list.add(ticket);
        md.addAttribute("ticket", t_list);

        List<Annotation> anno = repoAnnotation.findAnnotationByguidAndIsActive(viewGuid, 1);
        md.addAttribute("anns", anno);
    }

    @Override
    public void deleteTicketByViewGuid(String viewGuid) {
        Ticket ticket = repoTicket.findTicketsByviewGuid(viewGuid);
        ticket.setIsActive(0);
        repoTicket.save(ticket);
    }

    @Override
    public void deleteAnnotationByViewGuid(int id, String viewGuid) {
        Annotation annotation = repoAnnotation.findById(id);
        annotation.setIsActive(0);
        repoAnnotation.save(annotation);
    }


}
