package com.prethesis.controller;


import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.TicketView;
import com.prethesis.service.TicketService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("api/v1/")
public class ControllerTicket {

    private final TicketService ticketService;


    @PostMapping("/tickets/name/{name}/email/{email}")
    public ResponseEntity<ResponseData<TicketView>> create(@PathVariable String name, @PathVariable String email) throws IOException {
        log.info("starting get name: {} and email: {}", name, email);
        return ResponseEntity.ok(ticketService.create(name, email));
    }

    @GetMapping("/tickets")
    public ResponseEntity<ResponseData<List<TicketView>>> getAll() {
        log.info("starting getAll:");
        return ResponseEntity.ok(ticketService.getAll());
    }

    @GetMapping("/viewTicket/{id}")
    public ResponseEntity<ResponseData<TicketView>> getTicketDetails(@PathVariable String id) {
        log.info("starting getTicketDetails:");
        return ResponseEntity.ok(ticketService.getTicketDetails(Integer.parseInt(id)));
    }

}
