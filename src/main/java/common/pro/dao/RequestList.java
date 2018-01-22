package common.pro.dao;

public class RequestList extends ItemList {
    private String title, category;
    private int quantity, serviceFee;



    public RequestList() {
        super();
    }

    @Override
    public User getUserInfo() {
        return super.getUserInfo();
    }

    @Override
    public void setUserInfo(User userInfo) {
        super.setUserInfo(userInfo);
    }
    @Override
    public void addImage(String img) {
        super.addImage(img);
    }

    @Override
    public String getImage(int index) {
        return super.getImage(index);
    }

    @Override
    public int getSerial() {
        return super.getSerial();
    }

    @Override
    public void setSerial(int serial) {
        super.setSerial(serial);
    }

    @Override
    public int getUser() {
        return super.getUser();
    }

    @Override
    public void setUser(int user) {
        super.setUser(user);
    }

    @Override
    public int getPrice() {
        return super.getPrice();
    }

    @Override
    public void setPrice(int price) {
        super.setPrice(price);
    }

    @Override
    public String getDetail() {
        return super.getDetail();
    }

    @Override
    public void setDetail(String details) {
        super.setDetail(details);
    }

    @Override
    public String getLocation() {
        return super.getLocation();
    }

    @Override
    public void setLocation(String location) {
        super.setLocation(location);
    }

    @Override
    public String getRegisterDate() {
        return super.getRegisterDate();
    }

    @Override
    public void setRegisterDate(String registerDate) {
        super.setRegisterDate(registerDate);
    }

    @Override
    public String getExpiration() {
        return super.getExpiration();
    }

    @Override
    public void setExpiration(String expiration) {
        super.setExpiration(expiration);
    }

    @Override
    public int getStatus() {
        return super.getStatus();
    }

    @Override
    public void setStatus(int status) {
        super.setStatus(status);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(int serviceFee) {
        this.serviceFee = serviceFee;
    }
}
