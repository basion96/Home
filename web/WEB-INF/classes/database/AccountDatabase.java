package database;

import objects.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDatabase extends DAO{

    public boolean checkIfUsernameAvailable(String name){
        boolean avail = true;

        try (Connection conn = getConnection(Database.USER_STORE)) {
            PreparedStatement statement = conn.prepareStatement("SELECT user_name FROM users");
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                if(result.getString(1).equals(name)){
                    avail = false;
                }
            }
            statement.close();
            result.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return avail;
    }

    public void insertPendingUser(String username, String password){
        try (Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("INSERT INTO pending_users VALUES (?,?)");
            statement.setString(1, username);
            statement.setString(2, password);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
