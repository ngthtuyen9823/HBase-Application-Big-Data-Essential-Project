package com.azshop.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;

import com.azshop.models.BookModel;

public interface IBookDAO {
	List<BookModel> findAll() throws IOException;

	BookModel findOne(String id) throws IOException;

	List<BookModel> findByName(String key) throws IOException;

	List<BookModel> findByCategory(String cateId) throws IOException;

	List<BookModel> findByAuthor(String key) throws IOException;

	List<BookModel> findWithCount(int count);

	void insert(BookModel model);

	void delete(String id);

	void update(BookModel model);

	List<BookModel> filterByRating(int desiredRating) throws IOException;
	

	List<String> findAuthor() throws IOException;

	List<BookModel> findSameCategory(String categories);

	List<List<Entry<String, Long>>> findToFilter();
}
