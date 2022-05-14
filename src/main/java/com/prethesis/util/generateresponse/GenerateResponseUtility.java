package com.prethesis.util.generateresponse;


import com.prethesis.entity.Tickets;
import com.prethesis.service.ResponseData;

import java.util.List;

public class GenerateResponseUtility {

    public static GenerateResponse<Integer, String, Tickets, ResponseData<Tickets>> ticketDetail = (code, message, data) ->
            ResponseData.<Tickets>builder()
                    .code(code)
                    .message(message)
                    .body(data)
                    .build();


    public static GenerateResponse<Integer, String, List<Tickets>, ResponseData<List<Tickets>>> ticketDetails = (code, message, list) ->
            ResponseData.<Tickets>builder()
                    .code(code)
                    .message(message)
                    .body(list)
                    .build();

}

