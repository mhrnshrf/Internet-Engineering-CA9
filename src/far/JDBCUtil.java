package far;

import java.util.*;
import java.sql.*;

public class JDBCUtil {

	public static final String CONN_STR = "jdbc:hsqldb:hsql://localhost/";

	static {
		try {
				Class.forName("org.hsqldb.jdbcDriver");
			} catch (ClassNotFoundException ex) {
				System.err.println("Unable to load HSQL JDBC driver");
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(CONN_STR);
	}
}
