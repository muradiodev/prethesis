package com.prethesis.util.generateresponse;


import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;

import java.util.List;

public class GenerateResponseUtility {

    public static GenerateResponse<Integer, String, TicketView, ResponseData<TicketView>> ticketDetail = (code, message, data) ->
            ResponseData.<TicketView>builder()
                    .code(code)
                    .message(message)
                    .body(data)
                    .build();


    public static GenerateResponse<Integer, String, List<TicketView>, ResponseData<List<TicketView>>> ticketDetails = (code, message, list) ->
            ResponseData.<List<TicketView>>builder()
                    .code(code)
                    .message(message)
                    .body(list)
                    .build();

}

