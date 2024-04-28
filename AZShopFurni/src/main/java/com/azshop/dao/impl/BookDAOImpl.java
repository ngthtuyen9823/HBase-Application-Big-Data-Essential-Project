package com.azshop.dao.impl;

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
import com.azshop.models.BookModel;

public class BookDAOImpl implements IBookDAO {
	private static final byte[] INFO_CF = Bytes.toBytes("info");
	private static final byte[] DETAIL_CF = Bytes.toBytes("detail");

	@Override
	public List<BookModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookModel findOne(int id) {
//		Configuration conf = new Configuration();
//		try (Connection connection = ConnectionFactory.createConnection(conf);
//				Table table = connection.getTable(TableName.valueOf("fakenames"))) {
//
//			Get get = new Get(Bytes.toBytes(id)); // get theo rowkey;
//			BookModel bookmodel = null;
//			try {
//				Result result = table.get(get);
//				if (!result.isEmpty()) {
//					bookmodel = new BookModel();
//					bookmodel.setTitle(Bytes.toString(result.getValue(null, null))); // Family - qualifier
////	    				movieTO = new MovieTO();
////	    				movieTO.setTitle(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_ORIGINAL_TITLE))));
////	    				movieTO.setPosterPath(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_POSTER_PATH))));
////	    				movieTO.setPopularity(Bytes.toDouble(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_POPULARITY))));				
////	    				movieTO.setDate(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_RELEASE_DATE))));				
////	    				movieTO.setRunTime(Bytes.toInt(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_RUNTIME))));
////	    				
////	    				movieTO.setOverview(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_OVERVIEW))));
////	    				movieTO.setVoteCount(Bytes.toInt(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
////	    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_VOTE_COUNT))));
////	    				movieTO.setId(movieId);
//				}
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//			return movieTO;
//
//			List<Cell> cells = result.listCells();
//			List<BookModel> books = new ArrayList<BookModel>();
//			System.out.printf("ROW%s%sCOLUMN+CELL\n", TABS, TABS);
//			for (Cell cell : cells) {
//				BookModel model = new BookModel();
//
//				model.setIsbn(0);
//
//				System.out.printf("%s%scolumn=%s:%s, timestamp=%d, value=%s\n", Bytes.toString(CellUtil.cloneRow(cell)),
//						TABS, Bytes.toString(CellUtil.cloneFamily(cell)), Bytes.toString(CellUtil.cloneQualifier(cell)),
//						cell.getTimestamp(), Bytes.toString(CellUtil.cloneValue(cell)));
//			}
//		}
		return null;
	}

	@Override
	public List<BookModel> findByName(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookModel> findByCategory(int cateId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookModel> findByAuthor(String key) {
		// TODO Auto-generated method stub
		return null;
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
		book.setSubtitle(Bytes.toString(result.getValue(INFO_CF, Bytes.toBytes("subtitle"))));
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

		byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("num_pages"));
		if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
			book.setNum_pages(Bytes.toInt(numPagesBytes));
		} else {
			// Handle null value or insufficient byte array length
			book.setNum_pages(0); // Set a default value or log a message
		}

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
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(BookModel model) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BookModel> filterByRating(int rate) {
		// TODO Auto-generated method stub
		return null;
	}

}
