package com.prethesis.repo;

import com.prethesis.entity.Tickets;
import com.prethesis.model.dtos.CatTicketView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RepoTicket extends JpaRepository<Tickets, String> {
    int countAllByRateGreaterThanEqualAndRateLessThanEqual(int min, int max);

    @Query("Select new com.prethesis.model.dtos.CatTicketView(t.idCategory,count(t)) from Tickets t group by t.idCategory")
    List<CatTicketView> catTicketView();
}
