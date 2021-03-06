package com.prethesis.repo;

import com.prethesis.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface RepoTicket extends JpaRepository<Ticket, Integer> {


    List<Ticket> findAllByIsActiveOrderByPostDateDesc(int isActive);

    Ticket findTicketsByviewGuid(String viewGuid);




}
