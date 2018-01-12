package com.zderko.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Util {

	private static final String url = "jdbc:mysql://localhost:3306/testdb2";
	private static final String username = "root";
	private static final String password = "root";
	private static final String className = "com.mysql.jdbc.Driver";	
	
public static Connection getConnection() {
	Connection con = null;
		try {
			Class.forName(className);
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
