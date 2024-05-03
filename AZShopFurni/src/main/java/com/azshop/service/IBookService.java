package com.azshop.service;

import java.io.IOException;
import java.util.List;

import com.azshop.models.BookModel;

public interface IBookService {
	List<BookModel> findAll();

	BookModel findOne(String id) throws IOException;

	List<BookModel> findByName(String key) throws IOException;

	List<BookModel> findByCategory(String cate) throws IOException;

	List<BookModel> findByAuthor(String key) throws IOException;

	List<BookModel> findWithCount(int count);

	void insert(BookModel model);

	void delete(String id);

	void update(BookModel model);

	List<BookModel> filterByRating(int rate)  throws IOException;
}
