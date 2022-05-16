package com.prethesis.service.impl;

import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.repo.RepoTicket;
import com.prethesis.repo.RepoTicketView;
import com.prethesis.repo.RepoUser;
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

    private final TicketService ticketService;
    private final RepoUser repoUser;
    private final RepoTicket repoTicket;
    private final RepoTicketView repoTicketView;

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
        Optional<TicketView> eventDetailsView = repoTicketView.findById(id);
        log.info("getting even details view from redis. result is : {}", eventDetailsView);

        if (eventDetailsView.isPresent()) {
            return GenerateResponseUtility.ticketDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, eventDetailsView.get());
        }

        return repoTicket.findById(id).map(tickets -> ResponseData.<TicketView>builder()
                .code(SUCCESS_CODE)
                .message(SUCCESS_MESSAGE)
                .body(getTicketView(tickets))
                .build()
        ).orElse(ResponseData.<TicketView>builder()
                .code(NOT_FOUND_CODE)
                .message(NOT_FOUND_MESSAGE)
                .build());


//        log.info("ticket detail found : ");
//        return GenerateResponseUtility.ticketDetail.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, tv);
    }
}
