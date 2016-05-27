package far;

import java.sql.*;

public class UserRepository {
	private static UserRepository theRepository = new UserRepository();

	public static UserRepository getRepository() {
		return theRepository;
	}

	public User findByUsername(String username) throws SQLException {
		Connection con = JDBCUtil.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where username='" + username + "'");
		if (rs.next()) {
			return new User(username, rs.getString("first_name"), rs.getString("last_name"));
		} else
			return null;
	}
}

 
