package com.prethesis.service.impl;

import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.TicketService;
import com.prethesis.util.generateresponse.GenerateResponseUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static com.prethesis.util.generateresponse.Constants.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final RepoTicket repoTicket;

    @Override
    public ResponseData<TicketView> create(String name, String email) {
        Tickets ticket = Tickets.builder()
                .screenHeight("833")
                .screenWidth("1688")
                .name(name)
                .email(email)
                .browserName("Chrome 55")
                .browserFontSize("16px")
                .postDate(LocalDate.now())
                .isActive(1)
                .build();
        repoTicket.save(ticket);
        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }

    private TicketView getTicketView(Tickets ticket) {
        return (TicketView) repoTicket.findAll();
    }

    @Override
    public ResponseData<List<TicketView>> getAll() {
        List<Tickets> tickets = repoTicket.findAll();

        List<TicketView> tv = tickets.stream()
                .map(this::getTicketView)
                .collect(Collectors.toList());

        if (tickets.size() == 0) {
            log.info("ticket detail not found : ");
            return GenerateResponseUtility.ticketDetails.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
        }
        log.info("ticket detail found : ");
        return GenerateResponseUtility.ticketDetails.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, tv);
    }

    @Override
    public ResponseData<TicketView> getTicketDetails(int id) {
        Optional<Tickets> tickets = repoTicket.findById(id);

        if (tickets.isPresent()) {
            return GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, tickets.get());
        }


        log.info("ticket detail found : ");
        return GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
    }
}
