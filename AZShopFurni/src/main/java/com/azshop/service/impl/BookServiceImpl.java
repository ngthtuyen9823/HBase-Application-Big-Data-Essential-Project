package com.azshop.service.impl;

import java.util.List;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;
import com.azshop.service.IBookService;

public class BookServiceImpl implements IBookService {
	IBookDAO bookDAO = new BookDAOImpl();

	@Override
	public List<BookModel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookModel findOne(String id) throws IOException {
		return bookDAO.findOne(id);
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

	@Override
	public List<BookModel> findWithCount(int count) {
		// TODO Auto-generated method stub
		return bookDAO.findWithCount(count);
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
