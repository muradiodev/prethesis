package com.prethesis.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;


@Table(name = "annotation")
@Entity
@Getter
@Setter
public class Annotation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "guid")
    private String guid;
    @Column(name = "comment")
    private String comment;
    @Column(name = "topX")
    private String top;
    @Column(name = "leftX")
    private String left;
    @Column(name = "ticketId")
    private String ticketId;
    @Column
    private int isActive;

    public Annotation( String guid, String comment, String top, String left, String ticketId,int isActive) {
        this.guid = guid;
        this.comment = comment;
        this.top = top;
        this.left = left;
        this.ticketId = ticketId;
        this.isActive = isActive;
    }

    public Annotation() {
    }
}
