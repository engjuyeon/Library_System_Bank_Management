package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Connection conn=null;
		
		String url = "jdbc:mysql://localhost:3306/jjydb?serverTimezone=UTC&characterEncoding=utf8";
		String user="jjy";
		String password="0431";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}

}
