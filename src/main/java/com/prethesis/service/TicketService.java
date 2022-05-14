package com.prethesis.service;

import com.prethesis.entity.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TicketService extends JpaRepository<Tickets, Integer> {

    ResponseData<Tickets> create(String name, String email);

    ResponseData<List<Tickets>> getAll();

    ResponseData<Tickets> getTicketDetails(int id);
}
