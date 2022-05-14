package com.prethesis.service.impl;

import com.prethesis.entity.Tickets;
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

    protected static SecureRandom random = new SecureRandom();

    public static String generateToken() {
        long longToken = Math.abs(random.nextLong());
        String random = Long.toString(longToken, 16);
        return (random);
    }

    @Override
    public void addTicket(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Date now = new Date();
        String viewGuid = generateToken();
        Tickets ticket = Tickets.builder()
//                .closed("0")
//                .isPublic("0")
//                .screenHeight("833")
//                .screenWidth("1688")
//                .name(name)
//                .email(email)
//                .navigatorString("Chrome 55")
//                .browserFontSize("16px")
//                .url(null)
//                .sent(null)
//                .viewGuid(viewGuid)
//                .viewedAt(null)
//                .postDate(now)
//                .isActive(1)
                .build();
        repoTicket.save(ticket);


    }

    @Override
    public void getAll(Model md) {
        List<Tickets> tickets = repoTicket.findAllByIsActiveOrderByPostDateDesc(1);

        md.addAttribute("tickets", tickets);
        System.out.println(tickets);
    }

    @Override
    public void getTicketDetails(String viewGuid, Model md) {
        Tickets ticket = repoTicket.findTicketsByviewGuid(viewGuid);
        List<Tickets> t_list = new ArrayList<>();
        t_list.add(ticket);
        md.addAttribute("ticket", t_list);
    }

    @Override
    public void deleteTicketByViewGuid(String viewGuid) {
        Tickets ticket = repoTicket.findTicketsByviewGuid(viewGuid);
        ticket.setIsActive(0);
        repoTicket.save(ticket);
    }

}
