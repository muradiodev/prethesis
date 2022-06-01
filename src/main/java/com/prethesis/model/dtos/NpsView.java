package com.prethesis.model.dtos;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NpsView {

    long detractors;
    long passives;
    long promoters;
    long all;
    long happy;
    long sad;

    long nps;

}
