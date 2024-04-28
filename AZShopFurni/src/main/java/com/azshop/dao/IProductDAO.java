package com.azshop.dao;

import java.util.List;

import com.azshop.models.ProductModel;

public interface IProductDAO {
	List<ProductModel> findAll();
	List<ProductModel> findAllProduct();
	List<ProductModel> findAllOfCategory(int Id);

	List<ProductModel> findByCategoryID(int cateId);

	List<ProductModel> findWithCount(int count);

	ProductModel findOne(int id);
	ProductModel findOneProduct(int id);
	void insertProduct (ProductModel model);
	void deleteProduct (int ProId);
	void updateProduct (ProductModel model);
	List<ProductModel> searchProductByName(String key);

	List<ProductModel> filterByPrice(int minPrice, int maxPrice);

	List<ProductModel> filterByRating(int rate);

	List<ProductModel> sortByPrice();

	List<ProductModel> findBySupplierID(int supplier);
	List<List<Object>> ProductRating();
}