package com.prethesis.mapper;

import com.prethesis.entity.Tickets;
import com.prethesis.model.dtos.TicketView;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.NullValueMappingStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueMappingStrategy = NullValueMappingStrategy.RETURN_DEFAULT)
public interface TicketMapper {
    TicketMapper INSTANCE = Mappers.getMapper(TicketMapper.class);

    @Mappings({
            @Mapping(source = "screenWidth", target = "screenResolution.width"),
            @Mapping(source = "screenHeight", target = "screenResolution.height"),
            @Mapping(source = "idCategory", target = "category.id")

    })
    TicketView toTicketView(Tickets tickets);


}
