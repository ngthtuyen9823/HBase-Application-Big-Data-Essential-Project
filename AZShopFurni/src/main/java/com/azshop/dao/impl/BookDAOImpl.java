package com.azshop.dao.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.CompareOperator;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.filter.*;

import com.azshop.config.InitData;
import com.azshop.dao.IBookDAO;
import com.azshop.models.BookModel;

public class BookDAOImpl implements IBookDAO {
	private static final byte[] INFO_CF = Bytes.toBytes("info");
	private static final byte[] DETAIL_CF = Bytes.toBytes("detail");

	@Override
	public List<BookModel> findAll() throws IOException {
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
//
//				byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//				if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//					bookModel.setNumbers(Bytes.toInt(numPagesBytes));;
//				} else {
//					// Handle null value or insufficient byte array length
//					bookModel.setNumbers(0); // Set a default value or log a message
//				}

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
		return listBook;
	}

	@Override
	public BookModel findOne(String id) throws IOException {
		Configuration conf = new Configuration();
		Connection connection = ConnectionFactory.createConnection(conf);
		Table table = connection.getTable(TableName.valueOf("books"));

		Get get = new Get(Bytes.toBytes(id)); // get theo rowkey;
		BookModel bookmodel = null;
		try {
			Result result = table.get(get);
			if (!result.isEmpty()) {
				bookmodel = new BookModel();
				bookmodel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
				bookmodel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
				bookmodel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
				bookmodel.setAuthors(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));
				bookmodel.setCategories(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("categories"))));
				bookmodel.setThumbnail(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("thumbnail"))));
				bookmodel.setDescription(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("description")))); // Family
																													// -
																													// qualifier
				byte[] publishedYearBytes = result.getValue(DETAIL_CF, Bytes.toBytes("published_year"));
				if (publishedYearBytes != null && publishedYearBytes.length >= Bytes.SIZEOF_INT) {
					bookmodel.setPublished_year(Bytes.toInt(publishedYearBytes));
				} else {
					// Handle null value or insufficient byte array length
					bookmodel.setPublished_year(0); // Set a default value or log a message
				}

				byte[] averageRatingBytes = result.getValue(DETAIL_CF, Bytes.toBytes("average_rating"));
				if (averageRatingBytes != null && averageRatingBytes.length >= Bytes.SIZEOF_FLOAT) {
					bookmodel.setAverage_rating(Bytes.toFloat(averageRatingBytes));
				} else {
					// Handle null value or insufficient byte array length
					bookmodel.setAverage_rating(0.0f); // Set a default value or log a message
				}

//				byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//				if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//					bookmodel.setNumbers(Bytes.toInt(numPagesBytes));;
//				} else {
//					// Handle null value or insufficient byte array length
//					bookmodel.setNumbers(0); // Set a default value or log a message
//				}

				byte[] ratingsCountBytes = result.getValue(DETAIL_CF, Bytes.toBytes("ratings_count"));
				if (ratingsCountBytes != null && ratingsCountBytes.length >= Bytes.SIZEOF_INT) {
					bookmodel.setRatings_count(Bytes.toInt(ratingsCountBytes));
				} else {
					// Handle null value or insufficient byte array length
					bookmodel.setRatings_count(0); // Set a default value or log a message
				}
			} 
			else {
				System.out.println("Empty");
			}
		}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return bookmodel;
	}
	
	@Override
	public List<BookModel> findByName(String filterValue) throws IOException {
		String tableName = "books";
        String columnFamily = "info";
        String columnName = "title";
		List<BookModel> listBook = new ArrayList<>();

        Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf(tableName))) {
            Scan scan = new Scan();
            SingleColumnValueFilter filter = new SingleColumnValueFilter(
                Bytes.toBytes(columnFamily),
                Bytes.toBytes(columnName),
                CompareOperator.EQUAL,
                new BinaryComparator(
                		filterValue.getBytes())
            );
            scan.setFilter(filter);

		    try (ResultScanner scanner = table.getScanner(scan)) {
		      for (Result result : scanner) {
		    	  BookModel bookModel = new BookModel();
					bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
					bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
					bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
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
	//
//					byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//					if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//						bookModel.setNumbers(Bytes.toInt(numPagesBytes));;
//					} else {
//						// Handle null value or insufficient byte array length
//						bookModel.setNumbers(0); // Set a default value or log a message
//					}

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
		    }
		  } catch (IOException e) {
		    e.printStackTrace();
		  }

		  return listBook;
		}


	@Override
	public List<BookModel> findByCategory(String cate) throws IOException  {
		String tableName = "books";
        String columnFamily = "info";
        String columnName = "categories";
		List<BookModel> listBook = new ArrayList<>();

        Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf(tableName))) {
            Scan scan = new Scan();
            scan.setLimit(20);
            if(cate.equals("Fiction")) {
            	System.out.println("cate1");
            SingleColumnValueFilter filter = new SingleColumnValueFilter(
                Bytes.toBytes(columnFamily),
                Bytes.toBytes(columnName),
                CompareOperator.EQUAL,
                new BinaryComparator(
                		"Fiction".getBytes())
                
            );
            scan.setFilter(filter);
            } else {
            	System.out.println("cate2");

            	SingleColumnValueFilter filter = new SingleColumnValueFilter(
                        Bytes.toBytes(columnFamily),
                        Bytes.toBytes(columnName),
                        CompareOperator.NOT_EQUAL,
                        new BinaryComparator(
                        		"Fiction".getBytes()));
            	scan.setFilter(filter);
            }
            

		    try (ResultScanner scanner = table.getScanner(scan)) {
		      for (Result result : scanner) {
		    	  BookModel bookModel = new BookModel();
					bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
					bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
					bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
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
	//
//					byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//					if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//						bookModel.setNumbers(Bytes.toInt(numPagesBytes));;
//					} else {
//						// Handle null value or insufficient byte array length
//						bookModel.setNumbers(0); // Set a default value or log a message
//					}

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
		    }
		  } catch (IOException e) {
		    e.printStackTrace();
		  }

		  return listBook;

	}


	@Override
	public List<BookModel> findByAuthor(String filterValue) throws IOException {
		String tableName = "books";
        String columnFamily = "info";
        String columnName = "authors";
		List<BookModel> listBook = new ArrayList<>();

        Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf(tableName))) {
            Scan scan = new Scan();
            SingleColumnValueFilter filter = new SingleColumnValueFilter(
                Bytes.toBytes(columnFamily),
                Bytes.toBytes(columnName),
                CompareOperator.EQUAL,
                new BinaryComparator(
                		filterValue.getBytes())
            );
            scan.setFilter(filter);

		    try (ResultScanner scanner = table.getScanner(scan)) {
		      for (Result result : scanner) {
		    	  BookModel bookModel = new BookModel();
					bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
					bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
					bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
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
	//
//					byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//					if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//						bookModel.setNumbers(Bytes.toInt(numPagesBytes));;
//					} else {
//						// Handle null value or insufficient byte array length
//						bookModel.setNumbers(0); // Set a default value or log a message
//					}

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
		    }
		  } catch (IOException e) {
		    e.printStackTrace();
		  }

		  return listBook;
		}
	
	public List<BookModel> findWithCount(int count) {
		List<BookModel> books = new ArrayList<>();
		Configuration conf = new Configuration();

		try (Connection connection = ConnectionFactory.createConnection(conf);
				Table table = connection.getTable(TableName.valueOf("books"))) {

			Scan scan = new Scan();
			scan.addFamily(INFO_CF);
			scan.addFamily(DETAIL_CF);
			scan.setLimit(count);

			try (ResultScanner scanner = table.getScanner(scan)) {
				for (Result result : scanner) {
					BookModel book = constructBookFromResult(result);
					books.add(book);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return books;
	}

	private BookModel constructBookFromResult(Result result) {
		BookModel book = new BookModel();

		book.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
		book.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
		book.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
		book.setAuthors(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));
		book.setCategories(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("categories"))));
		book.setThumbnail(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("thumbnail"))));
		book.setDescription(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("description"))));

		byte[] publishedYearBytes = result.getValue(DETAIL_CF, Bytes.toBytes("published_year"));
		if (publishedYearBytes != null && publishedYearBytes.length >= Bytes.SIZEOF_INT) {
			book.setPublished_year(Bytes.toInt(publishedYearBytes));
		} else {
			// Handle null value or insufficient byte array length
			book.setPublished_year(0); // Set a default value or log a message
		}

		byte[] averageRatingBytes = result.getValue(DETAIL_CF, Bytes.toBytes("average_rating"));
		if (averageRatingBytes != null && averageRatingBytes.length >= Bytes.SIZEOF_FLOAT) {
			book.setAverage_rating(Bytes.toFloat(averageRatingBytes));
		} else {
			// Handle null value or insufficient byte array length
			book.setAverage_rating(0.0f); // Set a default value or log a message
		}

//		byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//		if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//			book.setNumbers(Bytes.toInt(numPagesBytes));
//		} else {
//			// Handle null value or insufficient byte array length
//			book.setNumbers(0); // Set a default value or log a message
//		}

		byte[] ratingsCountBytes = result.getValue(DETAIL_CF, Bytes.toBytes("ratings_count"));
		if (ratingsCountBytes != null && ratingsCountBytes.length >= Bytes.SIZEOF_INT) {
			book.setRatings_count(Bytes.toInt(ratingsCountBytes));
		} else {
			// Handle null value or insufficient byte array length
			book.setRatings_count(0); // Set a default value or log a message
		}

		return book;
	}

	@Override
	public void insert(BookModel model) {
        try {
            if (model != null) {

            	Configuration conf = new Configuration();
            	Connection connection = ConnectionFactory.createConnection(conf);
            	Table table = connection.getTable(TableName.valueOf("books"));
            	
            	
            	Put put = new Put(Bytes.toBytes(model.getIsbn10()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("isbn13"), Bytes.toBytes(model.getIsbn13()));
            	put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("isbn10"), Bytes.toBytes(model.getIsbn10()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("title"), Bytes.toBytes(model.getTitle()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("authors"), Bytes.toBytes(model.getAuthors()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("categories"), Bytes.toBytes(model.getCategories()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("thumbnail"), Bytes.toBytes(model.getThumbnail()));
                put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("description"), Bytes.toBytes(model.getDescription()));
                put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("published_year"),
                        Bytes.toBytes(model.getPublished_year()));
                put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("average_rating"),
                        Bytes.toBytes(model.getAverage_rating()));
//                put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("numbers"), Bytes.toBytes(model.getNumbers()));
                put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("ratings_count"), Bytes.toBytes(model.getRatings_count()));

            	table.put(put);
            }     	
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void delete(String id) {
		try {
			Configuration conf = new Configuration();
        	Connection connection = ConnectionFactory.createConnection(conf);
        	Table table = connection.getTable(TableName.valueOf("books"));
            List list = new ArrayList();
            Delete delete = new Delete(id.getBytes());
            list.add(delete);
            table.delete(list);
            System.out.println("delete row successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

	@Override
	public void update(BookModel model) {
		try {
			if (model != null) {

				Configuration conf = new Configuration();
				Connection connection = ConnectionFactory.createConnection(conf);
				Table table = connection.getTable(TableName.valueOf("books"));
				Put put = new Put(Bytes.toBytes(model.getIsbn10()));
				
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("isbn10"), Bytes.toBytes(model.getIsbn10()));
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("title"), Bytes.toBytes(model.getTitle()));
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("authors"), Bytes.toBytes(model.getAuthors()));
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("categories"), Bytes.toBytes(model.getCategories()));
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("thumbnail"), Bytes.toBytes(model.getThumbnail()));
				put.addColumn(Bytes.toBytes("info"), Bytes.toBytes("description"),
						Bytes.toBytes(model.getDescription()));
				put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("published_year"),
						Bytes.toBytes(model.getPublished_year()));
				put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("average_rating"),
						Bytes.toBytes(model.getAverage_rating()));
//				put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("numbers"), Bytes.toBytes(model.getNumbers()));
				put.addColumn(Bytes.toBytes("detail"), Bytes.toBytes("ratings_count"),
						Bytes.toBytes(model.getRatings_count()));

				table.put(put);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BookModel> filterByRating(int desiredRating) throws IOException {

//	    Configuration conf = new Configuration();
//	    Connection connection = ConnectionFactory.createConnection(conf);
//	    Table table = connection.getTable(TableName.valueOf("books"));
//	    List<BookModel> bookList = new ArrayList<>();
//
//	    try {
//	        // Filter based on the "average_rating" in the "detail" column family
//	        // Use GREATER_THAN_OR_EQUAL for matching whole numbers (e.g., 1.0)
//	        // and LESS_THAN for matching numbers below the next integer (e.g., 2.0)
//	    	Scan scan = new Scan();
//	        float lowerBound = desiredRating - 0.01f; // Adjust for floating-point precision
//	        float upperBound = desiredRating + 0.99f; // Adjust for floating-point precision
//	        scan.setFilter(new FilterList(
//	                FilterList.Operator.MUST_PASS_ALL,
//	                new SingleColumnValueFilter(
//	                        INFO_CF, Bytes.toBytes("average_rating"),
//	                        CompareOperator.GREATER_OR_EQUAL, Bytes.toBytes(lowerBound)),
//	                new SingleColumnValueFilter(
//	                        INFO_CF, Bytes.toBytes("average_rating"),
//	                        CompareOperator.LESS, Bytes.toBytes(upperBound))));
//
//	        ResultScanner scanner = table.getScanner(scan);
//	        for (Result result : scanner) {
//	            bookList.add(constructBookFromResult(result));
//	        }
//	    } finally {
//	        table.close();
//	        connection.close();
//	    }
//
//	    return bookList;
		String tableName = "books";
        String columnFamily = "detail";
        String columnName = "average_rating";
		List<BookModel> listBook = new ArrayList<>();
		
        Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf(tableName))) {
            Scan scan = new Scan();
            SingleColumnValueFilter filter = new SingleColumnValueFilter(
                Bytes.toBytes(columnFamily),
                Bytes.toBytes(columnName),
                CompareOperator.GREATER_OR_EQUAL,
                new BinaryComparator(
                		Integer.toString(desiredRating).getBytes())
            );
            scan.setFilter(filter);

		    try (ResultScanner scanner = table.getScanner(scan)) {
		      for (Result result : scanner) {
		    	  BookModel bookModel = new BookModel();
					bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
					bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
					bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
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
	//
//					byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("numbers"));
//					if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
//						bookModel.setNumbers(Bytes.toInt(numPagesBytes));;
//					} else {
//						// Handle null value or insufficient byte array length
//						bookModel.setNumbers(0); // Set a default value or log a message
//					}

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
		    }
		  } catch (IOException e) {
		    e.printStackTrace();
		  }

		  return listBook;
	}

	public static void main(String[] args) throws IOException {
//		String name = "Gilead";
//		System.out.println("a");
//        Configuration conf = new Configuration();
//        Connection connection = ConnectionFactory.createConnection(conf);
//        Scan scan = new Scan();
//        RowFilter rowFilter = new RowFilter(CompareOperator.EQUAL,
//            		new BinaryComparator(name.getBytes()));
//        System.out.println("a1");
//        
//        scan.setFilter(rowFilter);
//            // Áp dụng bộ lọc vào quét
//            scan.setFilter(rowFilter);
//            
//        
//            // Xác định bảng và cột muốn quét
//            Table table = connection.getTable(TableName.valueOf("books"));
//            ResultScanner scanner = table.getScanner(scan);
//    		System.out.println("a2");
//
//            // Thực hiện quét và in ra kết quả
//        		System.out.println("3");
//
//        		if (scanner == null) {
//        			System.out.println("41");
//        			return;
//        		}
//                for (Result result : scanner) {
//                	System.out.println("4");
//            		System.out.println(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
//
//
//                }
//            
//         
		String tableName = "books";
        String columnFamily = "info";
        String columnName = "authors";
        String filterValue = "Marilynne Robinson";

        Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf(tableName))) {
        	System.out.println("1");
            Scan scan = new Scan();
            SingleColumnValueFilter filter = new SingleColumnValueFilter(
                Bytes.toBytes(columnFamily),
                Bytes.toBytes(columnName),
                CompareOperator.EQUAL,
                new BinaryComparator(
                		filterValue.getBytes())
            );
            scan.setFilter(filter);
            System.out.println("2");
            try (ResultScanner scanner = table.getScanner(scan)) {
            	System.out.println("3");
                for (Result result : scanner) {
                	System.out.println(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
                	System.out.println(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));

                    // Process the result
                    // For example, print the row key
                    byte[] rowKey = result.getRow();
                    System.out.println("Row key: " + Bytes.toString(rowKey));
                }
                System.out.println("5");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
	}
	@Override
	public List<String> findAuthor() throws IOException {
		Configuration conf = new Configuration();
		Connection connection = ConnectionFactory.createConnection(conf);
		Table table = connection.getTable(TableName.valueOf("books"));
		List<String> listAuthor = new ArrayList<>();
		try {
			Scan scan = new Scan();
			scan.addFamily(INFO_CF);
			ResultScanner scanner = table.getScanner(scan);
			for (Result result : scanner) {
				listAuthor.add(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));
			}
		} finally {
			table.close();
			connection.close();
		}
		return listAuthor;
	}

	@Override
	public List<BookModel> findSameCategory(String categories) {
	    String tableName = "books";
	    String columnFamily = "info";
	    String columnName = "categories";
	    List<BookModel> listBook = new ArrayList<>();

	    Configuration conf = new Configuration();
	    try (Connection connection = ConnectionFactory.createConnection(conf);
	         Table table = connection.getTable(TableName.valueOf(tableName))) {
	        Scan scan = new Scan();
	        SingleColumnValueFilter filter = new SingleColumnValueFilter(
	            Bytes.toBytes(columnFamily),
	            Bytes.toBytes(columnName),
	            CompareOperator.EQUAL,
	            new BinaryComparator(Bytes.toBytes(categories))
	        );
	        scan.setFilter(filter);

	        try (ResultScanner scanner = table.getScanner(scan)) {
	            for (Result result : scanner) {
	                BookModel bookModel = new BookModel();
	                bookModel.setIsbn13(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn13"))));
	                bookModel.setIsbn10(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("isbn10"))));
	                bookModel.setTitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("title"))));
	                bookModel.setAuthors(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("authors"))));
	                bookModel.setCategories(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("categories"))));
	                bookModel.setThumbnail(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("thumbnail"))));
	                bookModel.setDescription(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("description"))));

	                byte[] publishedYearBytes = result.getValue(DETAIL_CF, Bytes.toBytes("published_year"));
	                if (publishedYearBytes != null && publishedYearBytes.length >= Bytes.SIZEOF_INT) {
	                    bookModel.setPublished_year(Bytes.toInt(publishedYearBytes));
	                } else {
	                    bookModel.setPublished_year(0);
	                }

	                byte[] averageRatingBytes = result.getValue(DETAIL_CF, Bytes.toBytes("average_rating"));
	                if (averageRatingBytes != null && averageRatingBytes.length >= Bytes.SIZEOF_FLOAT) {
	                    bookModel.setAverage_rating(Bytes.toFloat(averageRatingBytes));
	                } else {
	                    bookModel.setAverage_rating(0.0f);
	                }

	                byte[] ratingsCountBytes = result.getValue(DETAIL_CF, Bytes.toBytes("ratings_count"));
	                if (ratingsCountBytes != null && ratingsCountBytes.length >= Bytes.SIZEOF_INT) {
	                    bookModel.setRatings_count(Bytes.toInt(ratingsCountBytes));
	                } else {
	                    bookModel.setRatings_count(0);
	                }

	                listBook.add(bookModel);
	            }
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return listBook;
	}

        
	}

	

