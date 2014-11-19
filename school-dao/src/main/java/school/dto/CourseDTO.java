package school.dto;

public class CourseDTO {
    private long id;
    private String name;
    private int year;
    private String additional;
    private int rate;
    private String from;
    private String till;
    private int groups;
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    public String getAdditional() {
        return additional;
    }
    public void setAdditional(String additional) {
        this.additional = additional;
    }
    public int getRate() {
        return rate;
    }
    public void setRate(int rate) {
        this.rate = rate;
    }
    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }
    public String getTill() {
        return till;
    }
    public void setTill(String till) {
        this.till = till;
    }
    public int getGroups() {
        return groups;
    }
    public void setGroups(int groups) {
        this.groups = groups;
    }
    
}
