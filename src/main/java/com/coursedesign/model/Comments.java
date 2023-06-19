package com.coursedesign.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Comments {
    private String comment;
    private String userName;
    private int club_id;
    private LocalDateTime time;
    private int comment_id;

    public LocalDateTime getTime() {
        return time;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public int getComment_id() {
        return comment_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getClub_id() {
        return club_id;
    }

    public void setClub_id(int club_id) {
        this.club_id = club_id;
    }

}
