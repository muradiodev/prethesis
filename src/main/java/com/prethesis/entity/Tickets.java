package com.prethesis.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@Table(name = "tickets")
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
    private UUID id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "browserName", nullable = false)
    private String browserName;

    @Column(name = "browserFontSize", nullable = false)
    private String browserFontSize;

    @Column(name = "screenHeight", nullable = false)
    private String screenHeight;

    @Column(name = "screenWidth", nullable = false)
    private String screenWidth;

    @Column(name = "userIp", nullable = false)
    private String userIp;

    @Column(name = "postDate", nullable = false)
    private LocalDate postDate;

    @Column(name = "isActive", nullable = false)
    private int isActive;

    @Column(name = "skillRate", nullable = false)
    private String skillRate;

    @Column(name = "satScore", nullable = false)
    private String satScore;

    @Column(name = "m1", nullable = false)
    private String m1;

    @Column(name = "m2", nullable = false)
    private String m2;

    @Column(name = "m3", nullable = false)
    private String m3;

}
