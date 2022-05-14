package com.prethesis.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface TicketService {

    void addTicket(HttpServletRequest request);

    void getAll(Model md);

    void getTicketDetails(String viewGuid, Model md);

    void deleteTicketByViewGuid(String viewGuid);

    void deleteAnnotationByViewGuid(int id, String viewGuid);
}
