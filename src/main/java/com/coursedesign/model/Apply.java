package com.coursedesign.model;

import java.time.LocalDateTime;

public class Apply {
    private String applyname;
    private LocalDateTime applytime;
    private String applyemail;
    private int applyclub;
    private int applyid;

    public int getApplyid() {
        return applyid;
    }

    public void setApplyid(int applyid) {
        this.applyid = applyid;
    }

    public String getApplyname() {
        return applyname;
    }

    public void setApplyname(String applyname) {
        this.applyname = applyname;
    }

    public LocalDateTime getApplytime() {
        return applytime;
    }

    public void setApplytime(LocalDateTime applytime) {
        this.applytime = applytime;
    }

    public String getApplyemail() {
        return applyemail;
    }

    public void setApplyemail(String applyemail) {
        this.applyemail = applyemail;
    }

    public int getApplyclub() {
        return applyclub;
    }

    public void setApplyclub(int applyclub) {
        this.applyclub = applyclub;
    }
}
