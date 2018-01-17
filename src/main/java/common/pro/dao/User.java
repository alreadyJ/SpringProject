package common.pro.dao;

import org.springframework.stereotype.Repository;

public class User {
    String id, password, nickName, email, profileImg;

    public void setId(String id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public String getId() {

        return id;
    }

    public String getPassword() {
        return password;
    }

    public String getNickName() {
        return nickName;
    }

    public String getEmail() {
        return email;
    }

    public String getProfileImg() {
        return profileImg;
    }
}
