package com.azshop.dao;


import com.azshop.models.BookModel;

public interface IBookDAO {
	BookModel findbyId(int id);
}
