package com.prethesis.entity;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
//@FieldDefaults(level = AccessLevel.PRIVATE)
public class Tickets {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(255)")
    private String id;

    private String name;
    private String email;
    private String browserName;
    private String browserFontSize;
    private String screenHeight;
    private String screenWidth;
    private String userIp;
    private LocalDate postDate;
    private int isActive;
    private int skill;
    private int satScore;
    private String m1;
    private String m2;
    private String m3;
    private String gender;
    private int priority;
    private String idCategory;
    private LocalDateTime startTime;
    private LocalDateTime endTime;

}
