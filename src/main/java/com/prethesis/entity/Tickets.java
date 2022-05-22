package com.prethesis.entity;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

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
    private String skillRate;
    private String satScore;
    private String m1;
    private String m2;
    private String m3;
    private int userSkillRate;
    private String idCategory;
    private int rate;

}
