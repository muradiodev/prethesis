package com.prethesis.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Table(name = "ticket")
@Entity
@Getter
@Setter
public class Ticket {
    @Column(name = "closed")
    private String closed;
    @Column(name = "isPublic")
    private String isPublic;
    @Column(name = "screenHeight")
    private String screenHeight;
    @Column(name = "screenWidth")
    private String screenWidth;
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @Column(name = "navigatorString")
    private String navigatorString;
    @Column(name = "browserFontSize")
    private String browserFontSize;
    @Column(name = "url")
    private String url;
    @Column(name = "sent")
    private String sent;
    @Column
    private Date postDate;
    @Column
    private int isActive;

    @Transient
    private Long annotationCount;

    @Transient
    private List<Annotation> annotationList = new ArrayList<>();

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "viewGuid")
    private String viewGuid;
    @Column(name = "viewedAt")
    private String viewedAt;

    public Ticket() {
    }

    public Ticket(String closed, String isPublic, String screenHeight, String screenWidth, String name, String email,
                  String navigatorString, String browserFontSize, String url, String sent, String viewGuid,
                  String viewedAt, Date postDate, int isActive) {
        this.closed = closed;
        this.isPublic = isPublic;
        this.screenHeight = screenHeight;
        this.screenWidth = screenWidth;
        this.name = name;
        this.email = email;
        this.navigatorString = navigatorString;
        this.browserFontSize = browserFontSize;
        this.sent = sent;
        this.viewGuid = viewGuid;
        this.viewedAt = viewedAt;
        this.postDate = postDate;
        this.isActive = isActive;
    }

}
