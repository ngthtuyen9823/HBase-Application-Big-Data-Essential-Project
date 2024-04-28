package com.azshop.connection;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.hadoop.conf.Configuration;

import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

public class DBConnection {
	private static Configuration conf;
	private static Connection connection;

	static {
		conf = new Configuration();
		try {
			connection = ConnectionFactory.createConnection(conf);
		} catch (IOException e) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	public static Connection getConnection() {
		return connection;
	}

	public static void closeConnection() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (IOException e) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	public static void main(String[] args) {
		Connection connection = null;
		try {
			connection = DBConnection.getConnection();
			if (connection != null) {
				System.out.println("Connection successful!");
			} else {
				System.out.println("Failed to establish connection.");
			}
		} catch (Exception e) {
			System.err.println("Exception occurred while trying to establish connection: " + e.getMessage());
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception e) {
					System.err.println("Exception occurred while trying to close connection: " + e.getMessage());
				}
			}
		}
	}
}
