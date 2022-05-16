package com.prethesis.repo;

import com.prethesis.model.dtos.TicketView;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepoTicketView extends JpaRepository<TicketView, Integer> {
}
