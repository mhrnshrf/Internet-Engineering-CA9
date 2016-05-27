package far;

import java.io.*;
import java.util.*;
import java.sql.*;
import com.sun.net.httpserver.*;
import java.util.zip.*;

public class Database{
	private static Database theRepository = new Database();
	public static final String CONN_STR = "jdbc:hsqldb:hsql://localhost";


	public static Database getDB() {
		return theRepository;
	}

	static {
		try {
				Class.forName("org.hsqldb.jdbcDriver");
			} catch (ClassNotFoundException ex) {
		 		System.err.println("Unable to load HSQLDB JDBC driver");
		 }
	}

	public void updateCustCash(Customer c, int cash) throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		System.err.println("cash: " + cash);
		st.executeUpdate("update customers set cash = " + cash + " where id = " + c.getID());
		con.close();
	}
	public void insertCust(Customer c) throws SQLException {
		c.set_ID(nextIdCust());
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		st.executeUpdate("insert into customers values(" + c.get_ID() + ", "
			+ c.getID()
			+", '" +c.getPass()+"' "
			+", " +c.getCash()
			+", '" +c.getName()+"' "
			+", '" + c.getFamily()+"' "
			+", '" + c.getEmail()+"' "
			+ ")");
			st.executeUpdate("insert into cust_roles values(" + c.getID() + ", 'member')");
		con.close();
	}

	//how to throw 2 Exceptions
	public void changeRole(Customer c, String r) throws Exception{
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from roles where user_role = " + r);
		if(!rs.next())
			throw new IOException("invalid role");
		else
			st.executeUpdate("insert into user_roles values(" + c.get_ID() + ", '" + r + "')");
		con.close();
	}

	public ArrayList<Profile> getProfilesByID(int id) throws SQLException{
		//check the roles
		Connection con = DriverManager.getConnection(CONN_STR);
		Customer c = findCustByID(id);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from customers natural join user_roles where id = " + id );
		//build corresponding profiles
		ArrayList<Profile> p = new ArrayList<Profile>();
		while(rs.next()){
			if(rs.getString("user_role").equals("member"))
				p.add(new MemberProfile(c));
			else if(rs.getString("user_role").equals("owner"))
				p.add(new OwnerProfile(c));
			else if(rs.getString("user_role").equals("officer"))
				p.add(new OfficerProfile(c));
		}
		//return profiles
		con.close();
		return p;
	}

	public int nextIdCust() throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(code) as max_code from customers");
		int maxId = 0;
		if (rs.next()) {
			maxId = rs.getInt("max_code");
		}
		con.close();
		return maxId + 1;
	}

	public Customer findCustByID(int id)  throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from customers where id = " + id);
		Customer c;
		if (rs.next()){
			c = new Customer(rs.getInt("code"), rs.getInt("id"), rs.getString("name"), rs.getString("family"), rs.getString("pass"), rs.getString("email"));
			c.setCash(rs.getInt("cash"));
			con.close();
			return c;
		}
		else{
			con.close();
			return null;
		}
	}

	public void insertSymbol(Symbol s) throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		try{
			st.executeUpdate("insert into symbols values('" +s.getName()+"') ");
		}
		catch (Exception e){
			System.err.println("old symbol... no new symbol added");
		}
		con.close();
	}

	public void insertShare(int id, Symbol s, int count) throws SQLException{
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		try{
			st.executeUpdate("insert into has_share values(" + id + ",'" +s.getName() + "'," + count +") ");
		}
		catch (Exception e){
			System.err.println("share has not added.");
		}
		con.close();
	}

	public Map<String, Integer> findShareByID(int id) throws SQLException	{
		Map<String, Integer> stocks = new HashMap<String, Integer>();
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from has_share where id = " + id);
		while(rs.next()){
			if(!stocks.containsKey(rs.getString("name")))
				stocks.put(rs.getString("name"), rs.getInt("share_count"));
			else
				stocks.put(rs.getString("name"), stocks.get(rs.getString("name")) + rs.getInt("share_count"));
		}
		con.close();
		return stocks;
	}
	public ArrayList<String> getAllSymbols()  throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		// select * from poll join poll_choices on code = poll_code where code = '" + code + "'");
		ResultSet rs = st.executeQuery("select * from symbols");
		ArrayList<String> list = new ArrayList<String>();
		while (rs.next())
			list.add(rs.getString("name"));
		return list;
	}

	public Symbol findSymbolByName(String n)  throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		// select * from poll join poll_choices on code = poll_code where code = '" + code + "'");
		ResultSet rs = st.executeQuery("select * from symbols natural join requests	where name = '" + n + "' and req_pro = 'processing' order by req_value desc");
		ArrayList<Request> sell= new ArrayList<Request>();
		ArrayList<Request> buy = new ArrayList<Request>();
		// boolean flag = false;
		Symbol s = null;
// //
		if (rs.next()) {
			s = new Symbol(rs.getString("name"), buy, sell);
			// flag = true;
			if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("GTC"))
				sell.add(0, new GTCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("MPO"))
				sell.add(0, new MPORequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("IOC"))
				sell.add(0, new IOCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
																	 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("GTC"))
				buy.add(buy.size(), new GTCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("MPO"))
				buy.add(buy.size(), new MPORequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("IOC"))
				buy.add(buy.size(), new IOCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		}
		// while (rs.next()) {
// 	choices.add(rs.getString("choice"));
// 	votes.add(rs.getInt("vote_count"));
// }

		while (rs.next()){

			if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("GTC"))
				sell.add(0, new GTCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("MPO"))
				sell.add(0, new MPORequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("sell") && rs.getString("req_type").equals("IOC"))
				sell.add(0, new IOCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
																	 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("GTC"))
				buy.add(buy.size(), new GTCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("MPO"))
				buy.add(buy.size(), new MPORequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		 else if(rs.getString("status").equals("buy") && rs.getString("req_type").equals("IOC"))
				buy.add(buy.size(), new IOCRequest(rs.getInt("id"), rs.getString("name"), rs.getInt("req_count"),
				 													 rs.getInt("req_value"), rs.getInt("cust_id"),
																	 rs.getString("req_type")));
		}
		con.close();
		return s;
		// return null;

	}

	public int nextIdReq() throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select max(req_id) as max_code from requests");
		int maxId = 0;
		if (rs.next()) {
			maxId = rs.getInt("max_code");
		}
		con.close();
		return maxId + 1;
	}
	// create table requests (
	//     id integer not null,
	//     name varchar(100) not null,
	//     req_id integer not null,
	//     status varchar(100) not null,
	//     req_value integer default 0,
	//     req_count integer default 0,
	//     req_time timestamp,
	//     req_type varchar(100) not null,
	//     req_pro varchar(100) not null,
	//     cust_id integer not null,

	public void insertReq(Request r) throws SQLException {
		r.setCode(nextIdReq());
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		long time = System.currentTimeMillis();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(time);
		try{

			st.executeUpdate("insert into requests values("
			  + r.getID()
				+", '" + r.getSymbol()+"' "
				+", " + r.getCode()
				+", '" +r.getType()+"' "
				+", " + r.getPrice()
				+", " + r.getQuant()
				+", '"+timestamp+"' "
				+", '" +r.getStat()+"' "
				+", 'processing' "
				+", " + r.getID()
				+ ")");
		}
		catch (SQLException s){
			System.err.println(s.getMessage());
		}
		con.close();
	}

	public void changeStat(Request r, String s) throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		st.executeUpdate("update requests set req_pro = '" + s + "' where id = " + r.getCode());


		con.close();

	}

	public Request findReqByID(int i)  throws SQLException {
		Connection con = DriverManager.getConnection(CONN_STR);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from requests where req_id = " + i);
		con.close();
		if (rs.next()){
			if(rs.getString("status").equals("GTC"))
				return new GTCRequest(rs.getInt("req_id"),
									  rs.getString("name"),
									  rs.getInt("req_count"),
									  rs.getInt("req_value"),
									  rs.getInt("cust_id"),
									  rs.getString("type"));
			else if(rs.getString("status").equals("MPO"))
				return new MPORequest(rs.getInt("req_id"),
									  rs.getString("name"),
									  rs.getInt("req_count"),
									  rs.getInt("req_value"),
									  rs.getInt("cust_id"),
									  rs.getString("type"));
			else if(rs.getString("status").equals("IOC"))
				return new IOCRequest(rs.getInt("req_id"),
									  rs.getString("name"),
									  rs.getInt("req_count"),
									  rs.getInt("req_value"),
									  rs.getInt("cust_id"),
									  rs.getString("type"));
			else
				return null;
		}
		else
			return null;
	}

}
