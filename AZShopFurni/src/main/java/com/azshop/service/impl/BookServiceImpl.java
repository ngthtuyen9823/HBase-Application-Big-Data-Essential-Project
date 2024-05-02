package com.azshop.service.impl;

import java.io.IOException;
import java.util.List;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;
import com.azshop.service.IBookService;

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
	public List<BookModel> filterByRating(int rate) {
		// TODO Auto-generated method stub
		return null;
	}

}
