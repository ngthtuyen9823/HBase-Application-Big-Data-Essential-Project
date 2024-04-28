package com.azshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;

public class BookController {
	private static final byte[] INFO_CF = Bytes.toBytes("info");
	private static final byte[] DETAIL_CF = Bytes.toBytes("detail");
	public static void main(String[] args) throws IOException {
		Configuration conf = new Configuration();
        Connection connection = ConnectionFactory.createConnection(conf);
        Table table = connection.getTable(TableName.valueOf("books"));
        List<BookModel> listBook = new ArrayList<>();
        try {
            Scan scan = new Scan();
            scan.addFamily(INFO_CF);
            scan.addFamily(DETAIL_CF);
            ResultScanner scanner = table.getScanner(scan);
            for (Result result : scanner) {
                // Process each row and create a BookModel
            	BookModel bookModel = new BookModel();
                bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
                bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
                bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
                bookModel.setSubtitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("subtitle"))));
                bookModel.setAuthors(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));
                bookModel.setCategories(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("categories"))));
                bookModel.setThumbnail(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("thumbnail"))));
                bookModel.setDescription(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("description"))));
                
                byte[] publishedYearBytes = result.getValue(DETAIL_CF, Bytes.toBytes("published_year"));
        		if (publishedYearBytes != null && publishedYearBytes.length >= Bytes.SIZEOF_INT) {
        			bookModel.setPublished_year(Bytes.toInt(publishedYearBytes));
        		} else {
        			// Handle null value or insufficient byte array length
        			bookModel.setPublished_year(0); // Set a default value or log a message
        		}

        		byte[] averageRatingBytes = result.getValue(DETAIL_CF, Bytes.toBytes("average_rating"));
        		if (averageRatingBytes != null && averageRatingBytes.length >= Bytes.SIZEOF_FLOAT) {
        			bookModel.setAverage_rating(Bytes.toFloat(averageRatingBytes));
        		} else {
        			// Handle null value or insufficient byte array length
        			bookModel.setAverage_rating(0.0f); // Set a default value or log a message
        		}

        		byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("num_pages"));
        		if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
        			bookModel.setNum_pages(Bytes.toInt(numPagesBytes));
        		} else {
        			// Handle null value or insufficient byte array length
        			bookModel.setNum_pages(0); // Set a default value or log a message
        		}

        		byte[] ratingsCountBytes = result.getValue(DETAIL_CF, Bytes.toBytes("ratings_count"));
        		if (ratingsCountBytes != null && ratingsCountBytes.length >= Bytes.SIZEOF_INT) {
        			bookModel.setRatings_count(Bytes.toInt(ratingsCountBytes));
        		} else {
        			// Handle null value or insufficient byte array length
        			bookModel.setRatings_count(0); // Set a default value or log a message
        		}

                // Print or use the bookModel object
                listBook.add(bookModel);
            }
        } finally {
            table.close();
            connection.close();
        }
        System.out.println(listBook.get(2).getAuthors());

	}

}
