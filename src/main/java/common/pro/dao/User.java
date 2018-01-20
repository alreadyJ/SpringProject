package common.pro.dao;

public class User {
    private String email, password, nickName, profileImg, signUpDate;



    public void setSignUpDate(String signUpDate) {
        this.signUpDate = signUpDate;
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

    public String getSignUpDate() {
        return signUpDate;
    }
}
