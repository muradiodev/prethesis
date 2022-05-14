package com.prethesis.model.dtos;

import lombok.*;
import lombok.experimental.FieldDefaults;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TicketView implements Serializable {

    @Id
    String id;

    String name;

    String email;

    String browserName;

    String browserFontSize;

    String screenHeight;

    String screenWidth;

    String userIp;

    LocalDate postDate;

    int isActive;

    String skillRate;

    String satScore;

    String m1;

    String m2;

    String m3;
}
