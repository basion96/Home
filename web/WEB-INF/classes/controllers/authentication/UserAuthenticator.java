package controllers.authentication;

import database.DAO;
import database.Database;
import objects.User;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserAuthenticator extends DAO {

    public boolean validateLogin(String username, String password){
        if(!usernameExists(username, false))
            return false;

        String salt = "", pass = "";
        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("SELECT salt, user_pass FROM users WHERE user_name = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()){
                salt = resultSet.getString("salt");
                pass = resultSet.getString("user_pass");
            }
            resultSet.close();
            statement.close();

        } catch (SQLException e){
            e.printStackTrace();
        }
        String hashedPassword = getSHAString(salt + getSHAString(password));

        if(hashedPassword.equals(pass))
            return true;
        else
            return false;

    }

    public boolean usernameExists(String username, boolean includePending){
        boolean isValid = false;

        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement;
            if(includePending){
                statement = conn.prepareStatement("SELECT user_name FROM users WHERE user_name = ? UNION ALL (SELECT  user_name FROM pending_users WHERE user_name = ?)");
                statement.setString(1, username);
                statement.setString(2, username);
            }
            else{
                statement = conn.prepareStatement("SELECT user_name FROM users WHERE user_name = ?");
                statement.setString(1, username);
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                if(resultSet.getString(1).equals(username)) {
                    isValid = true;
                    break;
                }
            }
            resultSet.close();
            statement.close();

        } catch (SQLException e){
            e.printStackTrace();
        }
        return isValid;
    }

    private static String getSHAString(String s){
        MessageDigest messageDigest = null;
        try{
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }

        byte[] digestedMessage = messageDigest.digest(s.getBytes(StandardCharsets.UTF_8));

        BigInteger number = new BigInteger(1, digestedMessage);
        StringBuilder hexString = new StringBuilder(number.toString(16));
        while (hexString.length() < 32)
        {
            hexString.insert(0, '0');
        }
        return hexString.toString();
    }

    private String generateSalt(){
        return Long.toString(System.currentTimeMillis());
    }

    public List<String> getRoles(String username){
        List<String> roles = new ArrayList<>();

        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("SELECT role_name FROM user_roles WHERE user_name = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()){
                roles.add(resultSet.getString("role_name"));
            }
            resultSet.close();
            statement.close();

        } catch (SQLException e){
            e.printStackTrace();
        }

        return roles;
    }
    
    public void insertPendingUser(String username, String password){
        String salt = generateSalt();
        String hashedPassword = getSHAString(salt + getSHAString(password));
        try (Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("CALL addPendingUser(?,?,?)");
            statement.setString(1, username);
            statement.setString(2, salt);
            statement.setString(3, hashedPassword);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String> getAllPendingUsers(){
        List<String> users = new ArrayList<>();

        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("SELECT user_name FROM pending_users");
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                users.add(rs.getString(1));
            }
            rs.close();
            statement.close();

        } catch (SQLException e){
            e.printStackTrace();
        }

        return users;
    }

    public void verifyPendingUser(boolean accept, String username, String role){
        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement;
            if(accept){
                statement = conn.prepareStatement("CALL acceptPendingUser(?,?)");
                statement.setString(1, username);
                statement.setString(2, role);
            }
            else{
                statement = conn.prepareStatement("CALL denyPendingUser(?)");
                statement.setString(1, username);
            }
            statement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public User getUserDetails(String username){
        User user = new User();
        try(Connection conn = getConnection(Database.USER_STORE)){
            PreparedStatement statement = conn.prepareStatement("SELECT user_name, creation_date FROM users WHERE user_name = ?");
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                user.setName(rs.getString("user_name"));
                user.setAccountCreation(rs.getString("creation_date"));

                PreparedStatement statement2 = conn.prepareStatement("SELECT role_name FROM user_roles WHERE user_name = ?");
                statement2.setString(1, username);
                ResultSet rs2 = statement2.executeQuery();
                while(rs2.next()){
                    user.addRole(rs2.getString("role_name"));
                }
                statement2.close();
                rs2.close();
            }
            statement.close();
            rs.close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }
}
