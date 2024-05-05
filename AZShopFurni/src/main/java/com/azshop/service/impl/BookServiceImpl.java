package com.azshop.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.hadoop.hbase.wal.EntryBuffers;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;
import com.azshop.service.IBookService;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.hadoop.hbase.wal.EntryBuffers;

public class BookServiceImpl implements IBookService {
	IBookDAO bookDAO = new BookDAOImpl();

	@Override
	public List<BookModel> findAll() {
		try {
			return bookDAO.findAll();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public BookModel findOne(String id) throws IOException {
		return bookDAO.findOne(id);
	}

	@Override
	public List<BookModel> findByName(String key) throws IOException {
		// TODO Auto-generated method stub
		return bookDAO.findByName(key);
	}

	@Override
	public List<BookModel> findByCategory(String cate) throws IOException {
		// TODO Auto-generated method stub
		return bookDAO.findByCategory(cate);
	}

	@Override
	public List<BookModel> findByAuthor(String key)throws IOException {
		// TODO Auto-generated method stub
		return bookDAO.findByAuthor(key);
	}

	@Override
	public List<BookModel> findWithCount(int count) {
		// TODO Auto-generated method stub
		return bookDAO.findWithCount(count);
	}

	@Override
	public void insert(BookModel model) {
		bookDAO.insert(model);
	}

	@Override
	public void delete(String id) {
		bookDAO.delete(id);

	}

	@Override
	public void update(BookModel model) {
		bookDAO.update(model);

	}

	@Override
	public List<BookModel> filterByRating(int rate) throws IOException {
		// TODO Auto-generated method stub
		return bookDAO.filterByRating(rate);
	}
	
	@Override
	public List<Object> findTop() throws IOException{
		List<BookModel> listBook = bookDAO.findAll();
		
		List<BookModel> listTopRatingBook = listBook
				.stream()
				.sorted((b2,b1)->Float.compare(b1.getAverage_rating(),b2.getAverage_rating()))
				.limit(5)
				.collect(Collectors.toList());
		List<BookModel> listTopRatingCountBook = listBook
				.stream()
				.sorted((b2,b1)->Integer.compare(b1.getRatings_count(),b2.getRatings_count()))
				.limit(5)
				.collect(Collectors.toList());
		List<Object> list = new ArrayList<Object>();
		list.add(listTopRatingBook);
		list.add(listTopRatingCountBook);
		return list;
	}
	
	@Override
	public List<String> findTopAuthor() throws IOException {
		 Map<String, Long> AuthorandCount = bookDAO.findAuthor().stream()
				 .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
		 
		 return AuthorandCount.entrySet().stream()
		 		.sorted(Map.Entry.<String, Long>comparingByValue()
	            .reversed())
		 		.limit(5)
		 		.map(e -> e.getKey())
		 		.collect(Collectors.toList());
	}
	
	@Override
	public List<Object> findToReport() throws IOException {
		List<BookModel> listBook = bookDAO.findAll();
		List<Entry<Integer, Long>> countPubYear = listBook
				.stream()
				.collect(Collectors.groupingBy(BookModel::getPublished_year, Collectors.counting()))
				.entrySet().stream()
				.sorted(Map.Entry.<Integer, Long>comparingByKey())
		 		.collect(Collectors.toList());
		
		List<Entry<Integer, Long>> countRatingPubYear = listBook
				.stream()
				.collect(Collectors.groupingBy(BookModel::getPublished_year, Collectors.summingLong(BookModel::getRatings_count)))
				.entrySet().stream()
				.sorted(Map.Entry.<Integer, Long>comparingByKey())
		 		.collect(Collectors.toList());
		
		int one = 1;
		listBook
		.stream()
		.forEach(e -> e.setAverage_rating(e.getAverage_rating() / one));
		
		List<Entry<Float, Long>> avgRatingPubYear = listBook
				.stream()
				.collect(Collectors.groupingBy(BookModel::getAverage_rating, Collectors.summingLong(BookModel::getRatings_count)))
				.entrySet().stream()
				.sorted(Map.Entry.<Float, Long>comparingByKey())
		 		.collect(Collectors.toList());
		
		List<Object> list = new ArrayList<Object>();
		
		
		list.add(countPubYear);
		list.add(countRatingPubYear);
		list.add(avgRatingPubYear);
		
		return list;
	}
	

	@Override
	public List<BookModel> findSameCategory(String categories) {
		// TODO Auto-generated method stub
		return bookDAO.findSameCategory(categories);
	}
	@Override

	public List<String> findAllCategories() {
		return bookDAO.findAllCategories();
		// TODO Auto-generated method stub
	}
}
