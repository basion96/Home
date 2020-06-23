package objects;

public class Tank {

    private String tank_name, water_type, water_temperature, description, image_url;
    private int tank_id, tank_size, number_fish;

    public Tank(int tank_id, String tank_name, int tank_size, String water_type, String water_temperature, String description, String image_url, int number_fish){
        this.tank_id = tank_id;
        this.tank_name = tank_name;
        this.tank_size = tank_size;
        this.water_type = water_type;
        this.water_temperature = water_temperature;
        this.description = description;
        this.image_url = image_url;
        this.number_fish = number_fish;
    }

    public String getTank_name() {
        return tank_name;
    }

    public String getWater_type() {
        return water_type;
    }

    public String getWater_temperature() {
        return water_temperature;
    }

    public String getDescription() {
        return description;
    }

    public int getTank_id() {
        return tank_id;
    }

    public int getTank_size() {
        return tank_size;
    }

    public int getNumber_fish() {
        return number_fish;
    }

    public String getImage_url() {
        return image_url;
    }
}
