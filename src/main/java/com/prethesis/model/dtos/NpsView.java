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

    int detractors;
    int passives;
    int promoters;
    int all;
    int happy;
    int sad;

    int nps;

}
