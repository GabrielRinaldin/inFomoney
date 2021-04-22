package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dao {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/infomoney?useTimezone=true&serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8";
	private String user = "root";
	private String password = "root";
	


			

	
	public Connection conectar() {
		
		Connection con = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public void TesteConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
          System.out.println(e);
		}
	}
	

}
