package com.prethesis.repo;

import com.prethesis.entity.Annotation;
import com.prethesis.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface RepoAnnotation extends JpaRepository<Annotation,Integer> {

    Annotation findById(int id);

    Long countAllByTicketId(String ticketId);

    List<Annotation> findAnnotationByguidAndIsActive(String guid, int isActive);
}
