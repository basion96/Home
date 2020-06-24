package objects.hardwareDatabaseObjects;

public class Part {

    private String part_name, year_released, condition;
    private int part_id;

    public Part(){
        this.part_id  = -1;
        this.part_name = "empty";
        this.year_released = "0000";
        this.condition = "Doesn't exist";
    }

    public Part(int part_id, String part_name, String year_released, String condition) {
        this.part_id = part_id;
        this.part_name = part_name;
        this.year_released = year_released;
        this.condition = condition;
    }

    public String getPart_name() {
        return part_name;
    }

    public String getYear_released() {
        return year_released;
    }

    public String getCondition() {
        return condition;
    }

    public int getPart_id() {
        return part_id;
    }
}
