package common.pro.dao;

public class Comment {
    private int serial;
    private String text, registerDate;
    private User user;

    public Comment(int serial, String text, String registerDate, User user) {
        this.serial = serial;this.text = text;this.registerDate = registerDate;
        this.user = user;
    }
    public int getSerial() {
        return serial;
    }

    public void setSerial(int serial) {
        this.serial = serial;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String registerDate) {
        this.registerDate = registerDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
