package common.pro.dao;

import java.util.ArrayList;

abstract public class ItemList {
    private int serial, user;
    private User userInfo;
    private String detail, location;
    private String registerDate, expiration;
    private int price, status;
    private ArrayList<String> images;
    ItemList() {
        images = new ArrayList<>();
        userInfo = new User();
    }

    public User getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(User userInfo) {
        this.userInfo = userInfo;
    }

    public void addImage(String img) {
        images.add(img);
    }

    public String getImage(int index) {
        return images.get(index);
    }

    public int imageSize() {
        return this.images.size();
    }

    public int getSerial() {
        return serial;
    }

    public void setSerial(int serial) {
        this.serial = serial;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;

    }

    public void setDetail(String details) {
        this.detail = details;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
