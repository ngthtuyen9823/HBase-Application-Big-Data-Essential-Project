package com.azshop.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.TableExistsException;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.ColumnFamilyDescriptorBuilder;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.TableDescriptorBuilder;
import org.apache.hadoop.hbase.util.Bytes;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;
import com.azshop.models.UserBookModel;
import com.azshop.models.UserModel;

public class UserBookJoin {
	private static final byte[] INFO = Bytes.toBytes("personal");
	private static final byte[] DETAIL = Bytes.toBytes("bookinfo");
	
	static IBookDAO bookDAO = new BookDAOImpl();

    private static String familyA = "Identity";
    private static String familyB = "Details";

    private static String qualifierA1 = "UserId";
    private static String qualifierA2 = "GivenName";
    private static String qualifierA3 = "MiddleInitial";
    private static String qualifierA4 = "Surname";
    
    private static String qualifierB1 = "BookId";
    private static String qualifierB2 = "Title";

    public static void main(String[] args) throws IOException {
    	createTable();
    	singlePassJoin();
    }	
	public static void createTable() throws IOException {
        Configuration conf = new Configuration();

		try (Connection connection = ConnectionFactory.createConnection(conf); Admin admin = connection.getAdmin()) {
			TableName tableName = TableName.valueOf("user_book");
			TableDescriptorBuilder tableDescriptorBuilder = TableDescriptorBuilder.newBuilder(tableName);
			tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of(familyA));
			tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of(familyB));
			try {
				admin.createTable(tableDescriptorBuilder.build());
				System.out.println("Create sucessfully!");
			} catch (TableExistsException e) {
				System.out.println("Table already exists: " + e.getMessage());
			}
		}
    }    
	public static void singlePassJoin() {
		Configuration conf = new Configuration();

		try (Connection connection = ConnectionFactory.createConnection(conf);
				Table table = connection.getTable(TableName.valueOf("user"))) {

			Scan scan = new Scan();
			scan.addFamily(INFO);
			scan.addFamily(DETAIL);

			try (ResultScanner scanner = table.getScanner(scan)) {
				for (Result result : scanner) {
										
					UserModel usermodel = new UserModel();
					usermodel.setId(Bytes.toString(result.getValue(INFO, Bytes.toBytes("Id"))));
					usermodel.setGivenName(Bytes.toString(result.getValue(INFO, Bytes.toBytes("GivenName"))));
					usermodel.setMiddleInitial(Bytes.toString(result.getValue(INFO, Bytes.toBytes("MiddleInitial"))));
					usermodel.setSurname(Bytes.toString(result.getValue(INFO, Bytes.toBytes("Surname"))));
					usermodel.setBookID(Bytes.toString(result.getValue(DETAIL, Bytes.toBytes("BookID"))));
					
					BookModel bookmodel = new BookModel();
					bookmodel = bookDAO.findOne(usermodel.getBookID());
					System.out.println(bookmodel.getIsbn10());
					join(usermodel, bookmodel);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private static void join(UserModel usermodel, BookModel bookmodel) {
		UserBookModel userbook = new UserBookModel();
		userbook.setId(usermodel.getId());
		userbook.setGivenName(usermodel.getGivenName());
		userbook.setMiddleInitial(usermodel.getMiddleInitial());
		userbook.setSurname(usermodel.getSurname());
		userbook.setIsbn10(bookmodel.getIsbn10());
		userbook.setTitle(bookmodel.getTitle());
		
		insert(userbook);
		
	}
	private static void insert(UserBookModel model) {
		try {
			if (model != null) {

				Configuration conf = new Configuration();
				Connection connection = ConnectionFactory.createConnection(conf);
				Table table = connection.getTable(TableName.valueOf("user_book"));

				Put put = new Put(Bytes.toBytes(model.getId()));
				put.addColumn(Bytes.toBytes(familyA), Bytes.toBytes(qualifierA1), Bytes.toBytes(model.getId()));
				put.addColumn(Bytes.toBytes(familyA), Bytes.toBytes(qualifierA2), Bytes.toBytes(model.getGivenName()));
				put.addColumn(Bytes.toBytes(familyA), Bytes.toBytes(qualifierA3), Bytes.toBytes(model.getMiddleInitial()));
				put.addColumn(Bytes.toBytes(familyA), Bytes.toBytes(qualifierA4), Bytes.toBytes(model.getSurname()));
				put.addColumn(Bytes.toBytes(familyB), Bytes.toBytes(qualifierB1), Bytes.toBytes(model.getIsbn10()));
				put.addColumn(Bytes.toBytes(familyB), Bytes.toBytes(qualifierB2), Bytes.toBytes(model.getTitle()));

				table.put(put);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
