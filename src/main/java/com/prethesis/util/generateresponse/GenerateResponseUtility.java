package com.prethesis.util.generateresponse;


import com.prethesis.model.dtos.TicketView;
import com.prethesis.entity.Tickets;
import com.prethesis.model.ResponseData;

import java.util.List;

public class GenerateResponseUtility {

    public static GenerateResponse<Integer, String, TicketView, ResponseData<TicketView>> ticketDetail = (code, message, data) ->
            ResponseData.<Tickets>builder()
                    .code(code)
                    .message(message)
                    .body(data)
                    .build();


    public static GenerateResponse<Integer, String, List<Tickets>, ResponseData<List<TicketView>>> ticketDetails = (code, message, list) ->
            ResponseData.<Tickets>builder()
                    .code(code)
                    .message(message)
                    .body(list)
                    .build();

}

