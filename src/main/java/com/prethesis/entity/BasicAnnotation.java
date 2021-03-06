package com.prethesis.entity;

public class BasicAnnotation {
    private String comment;
    private String top;
    private String left;

    public BasicAnnotation() {
    }

    public BasicAnnotation(String comment, String top, String left) {
        this.comment = comment;
        this.top = top;
        this.left = left;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTop() {
        return top;
    }

    public void setTop(String top) {
        this.top = top;
    }

    public String getLeft() {
        return left;
    }

    public void setLeft(String left) {
        this.left = left;
    }
}
