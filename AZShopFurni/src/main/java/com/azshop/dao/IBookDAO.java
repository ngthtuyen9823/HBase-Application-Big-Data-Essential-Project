package com.azshop.dao;

import java.util.List;

import com.azshop.models.BookModel;

public interface IBookDAO {
	List<BookModel> findAll();

	BookModel findOne(int id);

	List<BookModel> findByName(String key);

	List<BookModel> findByCategory(int cateId);

	List<BookModel> findByAuthor(String key);

	List<BookModel> findWithCount(int count);

	void insert(BookModel model);

	void delete(int id);

	void update(BookModel model);

	List<BookModel> filterByRating(int rate);
}
