package com.prethesis.service;

import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.CatTicketView;
import com.prethesis.model.dtos.NpsView;
import com.prethesis.model.dtos.TicketView;

import java.util.List;

public interface TicketService {

    ResponseData<TicketView> create(TicketView ticketView);

    ResponseData<List<TicketView>> getAll();

    ResponseData<TicketView> getTicketDetails(String id);

    ResponseData<NpsView> getRate();


    ResponseData<List<CatTicketView>> getCategoryTickets();

    ResponseData<TicketView> update(TicketView ticketView);

    ResponseData<TicketView> setPriority(TicketView ticketView);

    ResponseData<Integer> getTicketCountByCategory(String catName);
}
