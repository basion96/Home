package database;

import objects.Category;
import objects.Fish;
import objects.Tank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FishDatabase extends DAO {
    private String noTank = "No associated tank";

    public void addFish(String type, String sex, int amount, String tank_id, String image_url, String description) {
        try(Connection conn = getConnection(Database.FISH_DATABASE)) {
            PreparedStatement statement = conn.prepareStatement("CALL add_fish(?,?,?,?,?,?)");
            statement.setString(1, type);
            statement.setString(2, sex);
            statement.setInt(3, amount);
            if(tank_id.equals("")){
                statement.setNull(4, 1);
            }
            else{
                statement.setInt(4, Integer.parseInt(tank_id));
            }

            statement.setString(5, image_url);
            statement.setString(6, description);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Fish getSingleFish(int fish_id){
        Fish fish = null;
        try(Connection conn = getConnection(Database.FISH_DATABASE)){
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM fish WHERE fish_id = ?");
            statement.setInt(1, fish_id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                int fishid = rs.getInt("fish_id");
                String fish_name = rs.getString("fish_name");
                String sex = rs.getString("sex");
                int amount = rs.getInt("amount");
                int tank_id = rs.getInt("tank_id");

                PreparedStatement getTankName = conn.prepareStatement("SELECT tank_name FROM fish_tanks WHERE tank_id = ?");
                getTankName.setInt(1, tank_id);
                ResultSet rs1 = getTankName.executeQuery();
                String tank_name = noTank;
                while(rs1.next()){
                    tank_name = rs1.getString("tank_name");
                }
                getTankName.close();
                rs1.close();

                String image_url = rs.getString("image_url");
                String description = rs.getString("fish_description");

                fish = new Fish(fishid, fish_name, sex, amount, tank_name, tank_id, image_url, description);
            }
            statement.close();
            rs.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

        return fish;
    }

    public void updateFish(int fish_id, String fish_name, String sex, int amount, String tank_id, String image_url, String description, boolean deleteFish){
        Connection conn = getConnection(Database.FISH_DATABASE);
        if(deleteFish){
            try{
                PreparedStatement statement = conn.prepareStatement("CALL delete_fish(?)");
                statement.setInt(1, fish_id);
                statement.executeUpdate();
                statement.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            return;
        }
        try {
            PreparedStatement statement = conn.prepareStatement("CALL update_fish(?,?,?,?,?,?,?)");
            statement.setInt(1, fish_id);
            statement.setString(2, fish_name);
            statement.setString(3, sex);
            statement.setInt(4, amount);
            if(tank_id.equals("")){
                statement.setNull(5, 1);
            }
            else
                statement.setInt(5, Integer.parseInt(tank_id));

            statement.setString(6, image_url);
            statement.setString(7, description);

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getNumberFishInTank(int tank_id){
        int numberFish = -1;
        try(Connection conn = getConnection(Database.FISH_DATABASE)) {
            PreparedStatement statement = conn.prepareStatement("SELECT COUNT(amount) FROM fish WHERE tank_id = ?");
            statement.setInt(1, tank_id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                numberFish = rs.getInt(1);
            }
            rs.close();
            statement.close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return numberFish;
    }

    public void addTank(String name, int tank_size, int water_type, int water_temperature, String description, String image_url){
        Connection conn = getConnection(Database.FISH_DATABASE);
        try {
            PreparedStatement statement = conn.prepareStatement("CALL add_tank(?,?,?,?,?,?)");
            statement.setString(1, name);
            statement.setInt(2, tank_size);
            statement.setInt(3, water_type);
            statement.setInt(4, water_temperature);
            statement.setString(5, description);
            statement.setString(6, image_url);
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Fish> getFish() {
        ArrayList<Fish> fish = new ArrayList<>();
        Connection conn = getConnection(Database.FISH_DATABASE);
        try {
            PreparedStatement getfish = conn.prepareStatement("SELECT * FROM fish");
            ResultSet rs = getfish.executeQuery();


            while (rs.next()) {

                int fish_id = rs.getInt("fish_id");
                String fish_name = rs.getString("fish_name");
                String sex = rs.getString("sex");
                int amount = rs.getInt("amount");
                int tank_id = rs.getInt("tank_id");

                PreparedStatement getTankFromFish = conn.prepareStatement("SELECT tank_name FROM fish_tanks WHERE tank_id = ?");
                getTankFromFish.setInt(1, tank_id);
                ResultSet rs1 = getTankFromFish.executeQuery();
                String tank_name = noTank;
                while(rs1.next()){
                    tank_name = rs1.getString(1);
                }
                getTankFromFish.close();
                rs1.close();

                String image_url = rs.getString("image_url");
                String description = rs.getString("fish_description");

                fish.add(new Fish(fish_id, fish_name, sex, amount, tank_name, tank_id, image_url, description));
            }
            getfish.close();
            rs.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fish;
    }

    public ArrayList<Tank> getTanks(){
        ArrayList<Tank> tanks = new ArrayList<>();
        Connection conn = getConnection(Database.FISH_DATABASE);

        try{
            PreparedStatement getTanks = conn.prepareStatement("SELECT * FROM fish_tanks");
            ResultSet rs = getTanks.executeQuery();

            while(rs.next()){
                int tank_id = rs.getInt("tank_id");
                String tank_name = rs.getString("tank_name");
                int tank_size = rs.getInt("tank_size");

                PreparedStatement getWaterType = conn.prepareStatement("SELECT type_name FROM water_types WHERE water_type_id = ?");
                getWaterType.setInt(1, rs.getInt("water_type"));
                ResultSet rs1 = getWaterType.executeQuery();
                String water_type = "";
                while(rs1.next()){
                    water_type = rs1.getString(1);
                }
                getWaterType.close();
                rs1.close();

                PreparedStatement getWaterTemperatureType = conn.prepareStatement("SELECT type_name FROM water_temperature_types WHERE water_temperature_type_id = ?");
                getWaterTemperatureType.setInt(1, rs.getInt("water_temperature"));
                ResultSet rs2 = getWaterTemperatureType.executeQuery();
                String water_temperature_type = "";
                while(rs2.next()){
                    water_temperature_type = rs2.getString(1);
                }
                getWaterTemperatureType.close();
                rs2.close();

                String description = rs.getString("description");
                String image_url = rs.getString("image_url");

                int number_fish = -1;
                PreparedStatement getNumFish = conn.prepareStatement("SELECT count_fish_in_tank(?)");
                getNumFish.setInt(1, tank_id);
                ResultSet rs3 = getNumFish.executeQuery();
                while(rs3.next()){
                    number_fish = rs3.getInt(1);
                }
                rs3.close();
                getNumFish.close();

                tanks.add(new Tank(tank_id, tank_name, tank_size, water_type, water_temperature_type, description, image_url, number_fish));
            }
            getTanks.close();
            rs.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tanks;
    }

    public void updateTank(int tank_id, String tank_name, int tank_size, int water_type, int water_temperature, String description, String image_url, boolean deleteTank){
        Connection conn = getConnection(Database.FISH_DATABASE);
        if(deleteTank){
            try{
                PreparedStatement statement = conn.prepareStatement("CALL delete_tank(?)");
                statement.setInt(1, tank_id);
                statement.executeUpdate();
                statement.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            return;
        }
        try {
            PreparedStatement statement = conn.prepareStatement("CALL update_tank(?,?,?,?,?,?,?)");
            statement.setInt(1, tank_id);
            statement.setString(2, tank_name);
            statement.setInt(3, tank_size);
            statement.setInt(4, water_type);
            statement.setInt(5, water_temperature);
            statement.setString(6, description);
            statement.setString(7, image_url);
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Tank getSingleTank(int tankid) {
        Tank tank = null;

        try (Connection conn = getConnection(Database.FISH_DATABASE)){
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM fish_tanks WHERE tank_id = ?");
            statement.setInt(1, tankid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int tank_id = rs.getInt("tank_id");
                String tank_name = rs.getString("tank_name");
                int tank_size = rs.getInt("tank_size");

                PreparedStatement getWaterType = conn.prepareStatement("SELECT type_name FROM water_types WHERE water_type_id = ?");
                getWaterType.setInt(1, rs.getInt("water_type"));
                ResultSet rs1 = getWaterType.executeQuery();
                String water_type = "";
                while(rs1.next()){
                    water_type = rs1.getString(1);
                }
                getWaterType.close();
                rs1.close();

                PreparedStatement getWaterTemperatureType = conn.prepareStatement("SELECT type_name FROM water_temperature_types WHERE water_temperature_type_id = ?");
                getWaterTemperatureType.setInt(1, rs.getInt("water_temperature"));
                ResultSet rs2 = getWaterTemperatureType.executeQuery();
                String water_temperature_type = "";
                while(rs2.next()){
                    water_temperature_type = rs2.getString(1);
                }
                getWaterTemperatureType.close();
                rs2.close();

                String description = rs.getString("description");
                String image_url = rs.getString("image_url");

                tank = new Tank(tank_id, tank_name, tank_size, water_type, water_temperature_type, description, image_url, 0);
            }
            statement.close();
            rs.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }

        return tank;
    }

    public List<Category> getTankList() throws SQLException {
        List<Category> listCategory = new ArrayList<>();

        try (Connection conn = getConnection(Database.FISH_DATABASE)) {
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM fish_tanks ORDER BY tank_id");
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("tank_id");
                String name = result.getString("tank_name");
                Category category = new Category(id, name);

                listCategory.add(category);
            }
            statement.close();
            result.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }

        return listCategory;
    }

    public List<Category> getWaterTypeList() throws SQLException {
        List<Category> waterTypes = new ArrayList<>();

        try (Connection conn = getConnection(Database.FISH_DATABASE)) {
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM water_types ORDER BY water_type_id");
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("water_type_id");
                String name = result.getString("type_name");
                Category category = new Category(id, name);

                waterTypes.add(category);
            }
            statement.close();
            result.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }

        return waterTypes;
    }

    public List<Category> getWaterTemperatureTypeList() throws SQLException {
        List<Category> waterTemperatureTypes = new ArrayList<>();

        try (Connection conn = getConnection(Database.FISH_DATABASE)) {
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM water_temperature_types ORDER BY water_temperature_type_id");
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("water_temperature_type_id");
                String name = result.getString("type_name");
                Category category = new Category(id, name);

                waterTemperatureTypes.add(category);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }

        return waterTemperatureTypes;
    }

    public int getNumberOfTanks(){
        int numnTanks = 0;
        try(Connection conn = getConnection(Database.FISH_DATABASE)){
            PreparedStatement statement = conn.prepareStatement("SELECT count_tanks()");
            statement.executeQuery();
            System.out.println();
            ResultSet rs = statement.getResultSet();
            while(rs.next()){
                numnTanks = rs.getInt(1);
            }
            rs.close();
            statement.close();

        }catch (SQLException e){
            e.printStackTrace();
        }

        return numnTanks;
    }
}
