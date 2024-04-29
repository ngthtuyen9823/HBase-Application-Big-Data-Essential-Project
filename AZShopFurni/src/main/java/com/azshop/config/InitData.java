package com.azshop.config;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.TableExistsException;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.ColumnFamilyDescriptorBuilder;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.TableDescriptorBuilder;
import org.apache.hadoop.hbase.util.Bytes;

public class InitData {
    public void init() {
        String dataFileName = "etc/books.csv";

        Configuration conf = new Configuration();

        try (Connection connection = ConnectionFactory.createConnection(conf);
            Admin admin = connection.getAdmin()) {
            TableName tableName = TableName.valueOf("books");
            TableDescriptorBuilder tableDescriptorBuilder = TableDescriptorBuilder.newBuilder(tableName);
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("info"));
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("detail"));
            try {
                admin.createTable(tableDescriptorBuilder.build());
            } catch (TableExistsException e) {
                System.out.println("Table already exists: " + e.getMessage());
            }

            try (Table table = connection.getTable(tableName);
                 BufferedReader reader = new BufferedReader(new FileReader(new File(dataFileName)))) {

                String line;
                while ((line = reader.readLine()) != null) {
                    String[] values = line.split(","); 
                    if (values.length < 11) {
//                        System.err.println("Invalid data format. Skipping line: " + line);
                        continue;
                    }

                    String isbn13 = values[0];
                    String isbn10 = values[1];
                    String title = values[2];
                    String authors = values[3];
                    String categories = values[4];
                    String thumbnail = values[5];
                    String description = values[6];
                    String publishedYear = values[7];
                    String averageRating = values[8];
                    String numbers = values[9];
                    String ratingsCount = values[10];

                    String rowKey = isbn10;

                    Put put = new Put(Bytes.toBytes(rowKey));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("isbn13"), Bytes.toBytes(isbn13));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("isbn10"), Bytes.toBytes(isbn10));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("title"), Bytes.toBytes(title));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("authors"), Bytes.toBytes(authors));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("categories"), Bytes.toBytes(categories));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("thumbnail"), Bytes.toBytes(thumbnail));
                    put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("description"), Bytes.toBytes(description));
                    put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("published_year"),
                            Bytes.toBytes(publishedYear));
                    put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("average_rating"),
                            Bytes.toBytes(averageRating));
                    put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("numbers"), Bytes.toBytes(numbers));
                    put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("ratings_count"), Bytes.toBytes(ratingsCount));

                    table.put(put);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
