package com.prethesis.util.generateresponse;


import com.prethesis.entity.Categories;
import com.prethesis.model.dtos.CatTicketView;
import com.prethesis.model.dtos.CategoryView;
import com.prethesis.model.dtos.NpsView;
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


    public static GenerateResponse<Integer, String, CategoryView, ResponseData<CategoryView>> categoryDetail = (code, message, data) ->
            ResponseData.<CategoryView>builder()
                    .code(code)
                    .message(message)
                    .body(data)
                    .build();

    public static GenerateResponse<Integer, String, List<CategoryView>, ResponseData<List<CategoryView>>> categories = (code, message, list) ->
            ResponseData.<List<CategoryView>>builder()
                    .code(code)
                    .message(message)
                    .body(list)
                    .build();

    public static GenerateResponse<Integer, String, NpsView, ResponseData<NpsView>> npsView = (code, message, data) ->
            ResponseData.<NpsView>builder()
                    .code(code)
                    .message(message)
                    .body(data)
                    .build();

    public static GenerateResponse<Integer, String, List<CatTicketView>, ResponseData<List<CatTicketView>>> catTicket = (code, message, list) ->
            ResponseData.<List<CatTicketView>>builder()
                    .code(code)
                    .message(message)
                    .body(list)
                    .build();

    public static GenerateResponse<Integer, String, Integer, ResponseData<Integer>> ticketCatCount = (code, message, count) ->
            ResponseData.<Integer>builder()
                    .code(code)
                    .message(message)
                    .body(count)
                    .build();

}

