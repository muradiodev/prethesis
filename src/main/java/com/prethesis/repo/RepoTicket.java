package com.prethesis.repo;

import com.prethesis.entity.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface RepoTicket extends JpaRepository<Tickets, Integer> {


    List<Tickets> findAllByIsActiveOrderByPostDateDesc(int isActive);

    Tickets findTicketsByviewGuid(String viewGuid);




}
