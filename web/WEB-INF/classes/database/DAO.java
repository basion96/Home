package database;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DAO {
    protected Connection getConnection(Database database) {

        String db = null;
        switch (database){
            case HOUSE_DATABASE: db = "houseDB";
                break;
            case USER_STORE: db = "user-store";
                break;
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

