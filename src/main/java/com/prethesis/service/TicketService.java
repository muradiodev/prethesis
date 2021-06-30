package com.prethesis.service;

import com.prethesis.entity.BasicAnnotation;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface TicketService {

    void addTicket(HttpServletRequest request, List<BasicAnnotation> annotations);

    void getAll(Model md);

    void getTicketDetails(String viewGuid, Model md);

    void deleteTicketByViewGuid(String viewGuid);

    void deleteAnnotationByViewGuid(int id, String viewGuid);
}
