package com.myspace.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myspace.demo1.Switch;

public class InitDevice {

	static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
	static final String MYSQL_URL = "jdbc:mysql://localhost:3306/DEVICE_DB";
	static final String MYSQL_USER = "jboss";
	static final String MYSQL_PASSWORD = "jboss456";
	static final String SQL = "SELECT assetType, asset_id, attribute, dateTime, site, value " +
			"FROM DEVICE_TABLE LIMIT %d OFFSET %d";


	
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	
	public InitDevice(){

	}
	
	public List<Switch> readData(int limit, int offset) {
		List<Switch> list = null;
		try {
			Class.forName(MYSQL_DRIVER);
			connection = DriverManager.getConnection(MYSQL_URL, MYSQL_USER, MYSQL_PASSWORD);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(String.format(SQL, limit, offset));
			list = getResultSet(resultSet);
		} catch(Exception e) { 
			System.out.println(e);
		}
		return list;

	}
	
	private List<Switch> getResultSet(ResultSet resultSet) throws Exception {
		List<Switch> list = new ArrayList<Switch>();
		while(resultSet.next()){
			Timestamp ts = resultSet.getTimestamp("dateTime");
			Date date = new java.util.Date(ts.getTime());
			LocalDateTime ldt = LocalDateTime.ofInstant(date.toInstant(),
                    ZoneId.systemDefault());
			list.add(new Switch(
					resultSet.getString("assetType"),
					resultSet.getInt("asset_id"),
					resultSet.getString("attribute"),
					ldt,
					resultSet.getString("site"),
					resultSet.getBoolean("value")
				));
		}
		return list;
	}
	
	public void close(){
		try {
			if(resultSet!=null) resultSet.close();
			if(statement!=null) statement.close();
			if(connection!=null) connection.close();
		} catch(Exception e){}
	}
	
	

	
	public static void main(String[] args) throws Exception {

		int LIMIT = 5;

		int i = 0;
		List<Switch> list = null;
		InitDevice init = new InitDevice();
		do {
			list = null; // reset list before continuing
			list = init.readData(LIMIT, LIMIT * i++);
			System.out.println("Size of list returned: " + list.size());
			for (Switch sw : list) {
				System.out.println(sw.getDateTime() + ": " + sw.getSite() + "." + sw.getAssetType() + "." + sw.getAsset_id() +
						"." + sw.getAttribute() + "." + sw.isValue());
			}
		} while (list.size() == LIMIT);
	}
}
