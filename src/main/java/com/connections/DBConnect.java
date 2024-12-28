package com.connections;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn = null;

	public static Connection getConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/passenger_detail", "root", "Rous123@.com");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
