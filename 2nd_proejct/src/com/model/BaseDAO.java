package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDAO {
	
	protected Connection conn;
	protected PreparedStatement psmt;
	protected ResultSet rs;
	
	protected void close() {

		try {


			if (rs != null)
				rs.close(); 
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void getConnection() { 

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.2.7:1521:xe";

			String id = "hr";
			String pw = "hr";

			conn = DriverManager.getConnection(url, id, pw);

			if (conn != null) {
				System.out.println("연결성공!");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
