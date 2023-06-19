package com.coursedesign.model;

public class UserBean {
    private String email;
    private String name;
    private String telephone;
    private String password;
    private String socialClub;

    public String getSocialClub() {
        return socialClub;
    }

    public void setSocialClub(String socialClub) {
        this.socialClub = socialClub;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
