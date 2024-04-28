package com.azshop.service.impl;

import java.util.List;

import com.azshop.dao.IProductDAO;
import com.azshop.dao.impl.ProductDAOImpl;
import com.azshop.models.ProductModel;
import com.azshop.service.IProductService;

public class ProductServiceImpl implements IProductService {

	IProductDAO productDAO = new ProductDAOImpl();

	@Override
	public List<ProductModel> findAllProduct() {
		return productDAO.findAllProduct();
	}

	@Override
	public List<ProductModel> findByCategoryID(int cateId) {
		return productDAO.findByCategoryID(cateId);
	}
	
	@Override
	public List<ProductModel> findWithCount(int count) {
		return productDAO.findWithCount(count);
	}

	@Override
	public ProductModel findOne(int id) {
		return productDAO.findOne(id);
	}

	@Override
	public void insertProduct(ProductModel model) {
		productDAO.insertProduct(model);
	}

	@Override
	public void deleteProduct(int ProId) {
		productDAO.deleteProduct(ProId);
	}

	@Override
	public void updateProduct(ProductModel model) {
		productDAO.updateProduct(model);
	}

	@Override
	public int CreateProductID(int Id) {
		List<ProductModel> Prod = productDAO.findAllOfCategory(Id);
		int proid = Prod.get(Prod.size()-1).getProductID();
		return proid + 1;
	}
	
	@Override
	public List<ProductModel> searchProductByName(String key) {
		return productDAO.searchProductByName(key);
	}

	@Override
	public List<ProductModel> filterByPrice(int minPrice, int maxPrice) {
		return productDAO.filterByPrice(minPrice, maxPrice);
	}

	@Override
	public List<ProductModel> filterByRating(int rate) {
		return productDAO.filterByRating(rate);
	}

	@Override
	public List<ProductModel> sortByPrice() {
		return productDAO.sortByPrice();
	}

	@Override
	public List<ProductModel> findAll() {
		
		return productDAO.findAll();
	}

	@Override
	public ProductModel findOneProduct(int id) {
		return productDAO.findOneProduct(id);
	}
	@Override
	public List<ProductModel> findBySupplierID(int supplierId) {
		return productDAO.findBySupplierID(supplierId);
	}

	@Override
	public List<List<Object>> ProductRating() {
		return productDAO.ProductRating();
	}
}
