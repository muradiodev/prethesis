package com.prethesis.entity;

import javax.persistence.*;

@Table(name = "alternativesselections")
@Entity
public class AlternativesSelections {
    @Column(name = "name")
    private String name;
    @Column(name = "email")
    private String email;
    @Column(name = "url")
    private String url;
    @Column(name = "sent")
    private String sent;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "projectId")
    private String projectId;
    @Column(name = "viewedAt")
    private String viewedAt;
    @Column(name = "viewGuid")
    private String viewGuid;


    public AlternativesSelections() {
    }

    public AlternativesSelections(String name, String email, String url, String sent, int id, String projectId, String viewedAt, String viewGuid) {
        this.name = name;
        this.email = email;
        this.url = url;
        this.sent = sent;
        this.id = id;
        this.projectId = projectId;
        this.viewedAt = viewedAt;
        this.viewGuid = viewGuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSent() {
        return sent;
    }

    public void setSent(String sent) {
        this.sent = sent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getViewedAt() {
        return viewedAt;
    }

    public void setViewedAt(String viewedAt) {
        this.viewedAt = viewedAt;
    }

    public String getViewGuid() {
        return viewGuid;
    }

    public void setViewGuid(String viewGuid) {
        this.viewGuid = viewGuid;
    }
}
