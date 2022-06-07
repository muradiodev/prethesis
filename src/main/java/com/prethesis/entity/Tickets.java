package com.prethesis.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Tickets {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(255)")
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
    int skill;
    int satScore;
    String m1;
    String m2;
    String m3;
    String gender;
    int priority;
    String idCategory;
    LocalDateTime startTime;
    LocalDateTime endTime;
    String finaldesc;
    String m1desc;
    String m2desc;
    String m3desc;

}
