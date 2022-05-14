package com.prethesis.service.impl;

import com.prethesis.entity.Tickets;
import com.prethesis.service.ResponseData;
import com.prethesis.service.TicketService;
import com.prethesis.util.generateresponse.GenerateResponseUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static com.prethesis.util.generateresponse.Constants.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final TicketService ticketService;

    @Override
    public ResponseData<Tickets> create(String name, String email) {
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
        ticketService.save(ticket);

        return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, ticket);
    }

    @Override
    public ResponseData<List<Tickets>> getAll() {
        List<Tickets> tickets = ticketService.findAll();

        if (tickets.size() == 0) {
            log.info("ticket detail not found : ");
            return GenerateResponseUtility.ticketDetails.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
        }
        log.info("ticket detail found : ");
        return GenerateResponseUtility.ticketDetails.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, tickets);

    }

    @Override
    public ResponseData<Tickets> getTicketDetails(int id) {
        Optional<Tickets> ticket = ticketService.findById(id);
        if (!ticket.isPresent()) {
            log.info("ticket detail not found : ");
            return GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
        }
        log.info("ticket detail found : ");

        return ticketService.findById(id).map(event -> ResponseData.<Tickets>builder()
                .code(SUCCESS_CODE)
                .message(SUCCESS_MESSAGE)
                .body(ticket.get())
                .build()).orElse(ResponseData.<Tickets>builder()
                .code(NOT_FOUND_CODE)
                .message(NOT_FOUND_MESSAGE)
                .build());
    }
}
