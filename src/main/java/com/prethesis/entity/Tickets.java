package com.prethesis.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Table(name = "ticket")
@Entity
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Tickets {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id", insertable = false, updatable = false, nullable = false)
    private UUID id;


    private String name;

    private String email;

    private String browserName;

    private String browserFontSize;

    private String screenHeight;

    private String screenWidth;

    private String userIp;

    private Date postDate;

    private int isActive;

    private String skillRate;

    private String satScore;

    private String m1;

    private String m2;

    private String m3;

}
