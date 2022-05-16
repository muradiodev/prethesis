package com.prethesis.mapper;

import com.prethesis.entity.Tickets;
import com.prethesis.model.dtos.TicketView;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueMappingStrategy;

@Mapper(nullValueMappingStrategy = NullValueMappingStrategy.RETURN_DEFAULT)
public interface TicketMapper {

    Tickets toUser(TicketView ticketView);

    TicketView toTicketView(Tickets tickets);
}
