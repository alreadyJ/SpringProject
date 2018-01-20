package common.pro.dao;

public class SalesList extends ItemList {
    private String title, category;
    private int quantity, remainQuantity;
    private int maxPurchase, price;

    public SalesList() {
        super();
    }

    @Override
    public void addImage(String img) {
        super.addImage(img);
    }

    @Override
    public String getImage(int index) {
        return super.getImage(index);
    }

    public int getSerial() {
        return super.getSerial();
    }

    public void setSerial(int serial) {
        super.setSerial(serial);
    }

    public int getUser() {
        return super.getUser();
    }

    public void setUser(int user) {
        super.setUser(user);
    }

    public String getDetail() {
        return super.getDetail();
    }

    public void setDetail(String detail) {
        super.setDetail(detail);
    }

    public String getLocation() {
        return super.getLocation();
    }

    public void setLocation(String location) {
        super.setLocation(location);
    }

    public String getRegisterDate() {
        return super.getRegisterDate();
    }

    public void setRegisterDate(String registerDate) {
        super.setRegisterDate(registerDate);
    }

    public String getExpiration() {
        return super.getExpiration();
    }

    public void setExpiration(String expiration) {
        super.setExpiration(expiration);
    }

    public int getStatus() {
        return super.getStatus();
    }

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

    public int getRemainQuantity() {
        return remainQuantity;
    }

    public void setRemainQuantity(int remainQuantity) {
        this.remainQuantity = remainQuantity;
    }

    public int getMaxPurchase() {
        return maxPurchase;
    }

    public void setMaxPurchase(int maxPurchase) {
        this.maxPurchase = maxPurchase;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
