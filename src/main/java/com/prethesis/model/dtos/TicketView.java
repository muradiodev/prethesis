package com.prethesis.model.dtos;

import com.prethesis.entity.Categories;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TicketView {

    String id;

    String name;
    String email;
    String browserName;
    String browserFontSize;
    ScreenResolution screenResolution;
    String userIp;
    LocalDate postDate;
    int isActive;
    String skillRate;
    String satScore;
    String m1;
    String m2;
    String m3;
    String gender;
    int priority;
    LocalDateTime startTime;
    LocalDateTime endTime;
    Categories category;


}
