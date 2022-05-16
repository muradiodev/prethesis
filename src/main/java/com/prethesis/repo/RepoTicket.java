package com.prethesis.repo;

import com.prethesis.entity.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepoTicket extends JpaRepository<Tickets, Integer> {


}
