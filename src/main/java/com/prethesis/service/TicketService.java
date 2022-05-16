package com.prethesis.service;

import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.TicketView;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TicketService {

    ResponseData<TicketView> create(String name, String email);

    ResponseData<List<TicketView>> getAll();

    ResponseData<TicketView> getTicketDetails(int id);
}
