package com.azshop.config;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.ColumnFamilyDescriptorBuilder;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.TableDescriptorBuilder;
import org.apache.hadoop.hbase.util.Bytes;


import org.apache.hadoop.hbase.NamespaceDescriptor;
import org.apache.hadoop.hbase.NamespaceNotFoundException;
import org.apache.hadoop.hbase.TableExistsException;

public class InitDataUser {
    public static void main(String[] args) {
        init(); // Call the initialization method
        // Print something after initialization
        System.out.println("Completed init data for user!");
    }

    // Method to initialize data in HBase
    public static void init() {
        // Path to the CSV file
        String dataFileName = "data/fakenames.csv";

        // Create HBase configuration
        Configuration conf = HBaseConfiguration.create();

        try (Connection connection = ConnectionFactory.createConnection(conf); 
             Admin admin = connection.getAdmin()) {

            // Create namespace if it doesn't exist
            String namespace = "default";
            try {
                admin.getNamespaceDescriptor(namespace);
            } catch (NamespaceNotFoundException e) {
                // Create a new namespace if not found
                NamespaceDescriptor namespaceDescriptor = NamespaceDescriptor.create(namespace).build();
                admin.createNamespace(namespaceDescriptor);
            }

            // Define table name and descriptor
            TableName tableName = TableName.valueOf(namespace, "user");
            TableDescriptorBuilder tableDescriptorBuilder = TableDescriptorBuilder.newBuilder(tableName);

            // Define column families
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("personal"));
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("contactinfo"));
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("creditcard"));
            tableDescriptorBuilder.setColumnFamily(ColumnFamilyDescriptorBuilder.of("bookinfo"));
            
            try {
                // Create the table
                admin.createTable(tableDescriptorBuilder.build());
            } catch (TableExistsException e) {
                // If table already exists, print a message
                System.out.println("Table already exists: " + e.getMessage());
            }

            try (Table table = connection.getTable(tableName);
                 BufferedReader reader = new BufferedReader(new FileReader(new File(dataFileName)))) {

                String line;
                // Read each line from the CSV file
                while ((line = reader.readLine()) != null) {
                    // Split the line into values
                    String[] values = line.split(",");
                    // Check if the data format is valid
                    if (values.length < 21) {
                        // Invalid data format. Skipping line.
                        continue;
                    }

                    // Assuming the first value is the row key
                    String rowKey = values[0];

                    // Create a Put object for the current row
                    Put put = new Put(Bytes.toBytes(rowKey));
                    // Add columns for each piece of data
                    put.addColumn(Bytes.toBytes("personal"), Bytes.toBytes("Id"), Bytes.toBytes(values[0]));
                    put.addColumn(Bytes.toBytes("personal"), Bytes.toBytes("Gender"), Bytes.toBytes(values[1]));
                    put.addColumn(Bytes.toBytes("personal"), Bytes.toBytes("GivenName"), Bytes.toBytes(values[2]));
                    put.addColumn(Bytes.toBytes("personal"), Bytes.toBytes("MiddleInitial"), Bytes.toBytes(values[3]));
                    put.addColumn(Bytes.toBytes("personal"), Bytes.toBytes("Surname"), Bytes.toBytes(values[4]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("StreetAddress"), Bytes.toBytes(values[5]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("City"), Bytes.toBytes(values[6]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("State"), Bytes.toBytes(values[7]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("ZipCode"), Bytes.toBytes(values[8]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("Country"), Bytes.toBytes(values[9]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("EmailAddress"), Bytes.toBytes(values[10]));
                    put.addColumn(Bytes.toBytes("contactinfo"), Bytes.toBytes("TelephoneNumber"), Bytes.toBytes(values[11]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("MothersMaiden"), Bytes.toBytes(values[12]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("Birthday"), Bytes.toBytes(values[13]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("CCType"), Bytes.toBytes(values[14]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("CCNumber"), Bytes.toBytes(values[15]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("CVV2"), Bytes.toBytes(values[16]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("CCExpires"), Bytes.toBytes(values[17]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("NationalID"), Bytes.toBytes(values[18]));
                    put.addColumn(Bytes.toBytes("creditcard"), Bytes.toBytes("UPS"), Bytes.toBytes(values[19]));
                    put.addColumn(Bytes.toBytes("bookinfo"), Bytes.toBytes("BookID"), Bytes.toBytes(values[20]));

                    // Put the data into the table
                    table.put(put);
                }
            }
        } catch (IOException e) {
            // Handle IO exceptions
            e.printStackTrace();
        }
    }
}
