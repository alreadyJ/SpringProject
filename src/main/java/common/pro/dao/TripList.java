package common.pro.dao;

public class TripList extends ItemList {
    private String source, destination;
    private String purpose;
    private String departureDate, arrivalDate;
    private int isRound;

    public TripList() {super();}

    @Override
    public User getUserInfo() {
        return super.getUserInfo();
    }

    @Override
    public void setUserInfo(User userInfo) {
        super.setUserInfo(userInfo);
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) { this.departureDate = departureDate;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getPurpose() {
        return purpose;
    }

    @Override
    public int getStatus() {
        return super.getStatus();
    }

    @Override
    public void setStatus(int status) {
        super.setStatus(status);
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

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getSchedule() {
        return super.getDetail();
    }

    public void setSchedule(String schedule) {
        super.setDetail(schedule);
    }

    public int getIsRound() {
        return isRound;
    }

    public void setIsRound(int isRound) {
        this.isRound = isRound;
    }
}
