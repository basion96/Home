package database;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DAO {
    protected Connection getConnection(Database database) {

        String db = "";
        switch (database){
            case FISH_DATABASE: db = "houseDB";
                break;
            case HARDWARE_DATABASE: db = "hardware_database";
                break;
            case FINANCE_DATABASE: db = "finance_database";
                break;
            case USER_STORE: db = "user_store";
        }

        DataSource datasource;
        Connection connection = null;
        try {
            datasource = (DataSource) new InitialContext().lookup("java:/comp/env/" + db);
            connection = datasource.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}

