package objects;

public class Fish {

    private String fish_name, tank_name, sex, fish_description, image_url;
    private int fish_id, amount, tank_id;

    public Fish(int fish_id, String fish_name, String sex, int amount, String tank_name, int tank_id, String image_url, String fish_description) {
        this.fish_id = fish_id;
        this.fish_name = fish_name;
        this.amount = amount;
        this.sex = sex;
        this.tank_name = tank_name;
        this.tank_id = tank_id;
        this.image_url = image_url;
        this.fish_description = fish_description;
    }

    public int getFish_id(){
        return fish_id;
    }

    public String getFish_name() {
        return fish_name;
    }

    public int getAmount() {
        return amount;
    }

    public String getSex(){
        return sex;
    }

    public String getTank_name(){
        return tank_name;
    }

    public int getTank_id(){
        return tank_id;
    }

    public String getFish_description() {
        return fish_description;
    }

    public String getImage_url() {
        return image_url;
    }
}
