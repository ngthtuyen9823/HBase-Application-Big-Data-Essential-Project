package com.azshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azshop.connection.DBConnection;
import com.azshop.dao.IItemDAO;
import com.azshop.dao.IProductDAO;
import com.azshop.models.ProductModel;

public class ProductDAOImpl implements IProductDAO {
	IItemDAO itemDAO = new ItemDAOImpl();
	Connection conn = null;

	@Override
	public List<ProductModel> findAll() {
		String sql = "SELECT p.*, \r\n"
				+ "       SUBSTRING_INDEX(GROUP_CONCAT(ii.Image ORDER BY ii.ItemImageID), ',', 1) AS FirstImage,\r\n"
				+ "       (SELECT MIN(i.PromotionPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinPromotionPrice,\r\n"
				+ "       (SELECT MIN(i.OriginalPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinOriginalPrice,\r\n"
				+ "AVG(rating) as Rating\r\n" + "FROM CATEGORY c\r\n"
				+ "JOIN PRODUCT p ON c.CategoryID = p.CategoryID\r\n" + "JOIN ITEM i ON p.ProductID = i.ProductID\r\n"
				+ "JOIN ITEMIMAGE ii ON ii.ItemID = i.ItemID\r\n" + "LEFT JOIN DETAIL d ON d.ItemID=i.ItemID "
				+ "GROUP BY p.ProductID;";
		List<ProductModel> list = new ArrayList<ProductModel>();

		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				ProductModel model = new ProductModel();
				int productID = rs.getInt("ProductID");

				model.setProductID(productID);
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				model.setAvgRating(rs.getFloat("Rating"));
				model.setDisplayedImage(rs.getString("FirstImage"));
				model.setDisplayedPromotionPrice(rs.getInt("MinPromotionPrice"));
				model.setDisplayedOriginalPrice(rs.getInt("MinOriginalPrice"));

				list.add(model);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductModel> findByCategoryID(int cateId) {
		String sql = "SELECT p.*, \r\n"
				+ "       SUBSTRING_INDEX(GROUP_CONCAT(ii.Image ORDER BY ii.ItemImageID), ',', 1) AS FirstImage,\r\n"
				+ "       (SELECT MIN(i.PromotionPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinPromotionPrice,\r\n"
				+ "       (SELECT MIN(i.OriginalPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinOriginalPrice,\r\n"
				+ "AVG(rating) as Rating\r\n" + "FROM CATEGORY c\r\n"
				+ "JOIN PRODUCT p ON c.CategoryID = p.CategoryID\r\n" + "JOIN ITEM i ON p.ProductID = i.ProductID\r\n"
				+ "JOIN ITEMIMAGE ii ON ii.ItemID = i.ItemID\r\n" + "LEFT JOIN DETAIL d ON d.ItemID=i.ItemID\r\n"
				+ "WHERE c.CategoryID = ?\r\n" + "GROUP BY p.ProductID;";
		List<ProductModel> list = new ArrayList<ProductModel>();

		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cateId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				int productID = rs.getInt("ProductID");

				model.setProductID(productID);
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				model.setAvgRating(rs.getFloat("Rating"));
				model.setDisplayedImage(rs.getString("FirstImage"));
				model.setDisplayedPromotionPrice(rs.getInt("MinPromotionPrice"));
				model.setDisplayedOriginalPrice(rs.getInt("MinOriginalPrice"));

				list.add(model);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductModel> findWithCount(int count) {
		String sql = "Select * from PRODUCT limit ?";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, count);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();

				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));

				list.add(model);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		IProductDAO productDAO = new ProductDAOImpl();

		List<List<Object>> list =  productDAO.ProductRating();
	}

	@Override
	public void insertProduct(ProductModel model) {
		String sql = "Insert into PRODUCT values (?,?,?,?,?,?,?)";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, model.getProductID());
			ps.setString(2, model.getProductName());
			ps.setString(3, model.getDescription());
			ps.setString(4, model.getOrigin());
			ps.setInt(5, model.getSupplierID());
			ps.setInt(6, model.getCategoryID());
			ps.setString(7, model.getMaterial());
			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProduct(int ProId) {
		String sql = "Delete from PRODUCT where ProductID=?";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ProId);
			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProduct(ProductModel model) {
		String sql = "Update PRODUCT Set ProductName= ?, Description = ?, Origin = ?, SupplierID = ?, CategoryID = ?, Material = ? where ProductID = ?";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, model.getProductName());
			ps.setString(2, model.getDescription());
			ps.setString(3, model.getOrigin());
			ps.setInt(4, model.getSupplierID());
			ps.setInt(5, model.getCategoryID());
			ps.setString(6, model.getMaterial());
			ps.setInt(7, model.getProductID());
			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductModel> findAllOfCategory(int Id) {
		String sql = "Select * from PRODUCT where CategoryID =?";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();

				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));

				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ProductModel> searchProductByName(String key) {
		List<ProductModel> listPro = new ArrayList<ProductModel>();
		String sql = "SELECT p.*,\r\n"
				+ "       SUBSTRING_INDEX(GROUP_CONCAT(ii.Image ORDER BY ii.ItemImageID), ',', 1) AS FirstImage,\r\n"
				+ "       (SELECT MIN(i.PromotionPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinPromotionPrice,\r\n"
				+ "       (SELECT MIN(i.OriginalPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinOriginalPrice\r\n"
				+ "FROM CATEGORY c\r\n" + "JOIN PRODUCT p ON c.CategoryID = p.CategoryID\r\n"
				+ "JOIN ITEM i ON p.ProductID = i.ProductID\r\n" + "JOIN ITEMIMAGE ii ON ii.ItemID = i.ItemID\r\n"
				+ "WHERE p.ProductName LIKE ? OR p.Description LIKE ? \r\n" + "GROUP BY p.ProductID";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + key + "%");
			ps.setString(2, key + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				int productID = rs.getInt("ProductID");
				model.setProductID(productID);
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				model.setDisplayedImage(rs.getString("FirstImage"));
				model.setDisplayedPromotionPrice(rs.getInt("MinPromotionPrice"));
				model.setDisplayedOriginalPrice(rs.getInt("MinOriginalPrice"));
				listPro.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPro;
	}

	@Override
	public List<ProductModel> filterByPrice(int minPrice, int maxPrice) {
		List<ProductModel> listPro = new ArrayList<ProductModel>();
		String sql = "SELECT P.ProductID, P.ProductName,  P.Description, P.Origin, P.SupplierID,P.CategoryID,P.Material\r\n"
				+ "FROM PRODUCT as P \r\n" + "INNER JOIN ITEM I ON P.ProductID = I.ProductID\r\n"
				+ "group by P.ProductID\r\n" + "having Max(I.OriginalPrice) > ? and Min(I.OriginalPrice) < ?";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, minPrice);
			ps.setInt(2, maxPrice);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				listPro.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPro;

	}

	@Override
	public List<ProductModel> filterByRating(int rate) {
		List<ProductModel> listPro = new ArrayList<ProductModel>();
		String sql = "SELECT P.ProductID, P.ProductName,  P.Description, P.Origin, P.SupplierID,P.CategoryID,P.Material \r\n"
				+ " FROM PRODUCT as P  \r\n" + " INNER JOIN ITEM I ON P.ProductID = I.ProductID \r\n"
				+ " INNER JOIN DETAIL D on I.ItemID= D.ItemID \r\n" + " WHERE D.Rating >=? \r\n"
				+ " GROUP BY P.ProductID";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rate);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				listPro.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPro;
	}

	@Override
	public List<ProductModel> sortByPrice() {
		List<ProductModel> listPro = new ArrayList<ProductModel>();
		String sql = "SELECT P.ProductID, P.ProductName,  P.Description, P.Origin, P.SupplierID,P.CategoryID,P.Material \r\n"
				+ "FROM PRODUCT as P  \r\n" + "INNER JOIN ITEM I ON P.ProductID = I.ProductID \r\n"
				+ "GROUP BY P.ProductID \r\n" + "order by min(I.OriginalPrice)";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				listPro.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listPro;
	}

	@Override
	public ProductModel findOne(int id) {
		String sql = "SELECT\r\n" + "    p.*,\r\n" + "    c.CategoryID,\r\n" + "    c.CategoryName,\r\n"
				+ "    s.SupplierName,\r\n"
				+ "    (SELECT MIN(i.PromotionPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinPromotionPrice,\r\n"
				+ "    (SELECT MIN(i.OriginalPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinOriginalPrice,\r\n"
				+ "     AVG(rating) as Rating\r\n" + "FROM\r\n" + "    PRODUCT p\r\n" + "JOIN\r\n"
				+ "    ITEM i ON p.ProductID = i.ProductID\r\n" + "JOIN\r\n"
				+ "    CATEGORY c ON c.CategoryID = p.CategoryID\r\n" + "JOIN\r\n"
				+ "    SUPPLIER s ON s.SupplierID = p.SupplierID\r\n" + "LEFT JOIN\r\n"
				+ "    DETAIL d ON d.ItemID = i.ItemID\r\n" + "WHERE\r\n" + "    p.ProductID = ?\r\n" + "GROUP BY\r\n"
				+ "    p.ProductID;";
		ProductModel model = new ProductModel();

		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int productID = rs.getInt("ProductID");

				model.setProductID(productID);
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setCategoryName(rs.getString("CategoryName"));
				model.setSupplierName(rs.getString("SupplierName"));

				model.setAvgRating(rs.getFloat("rating"));

				model.setDisplayedPromotionPrice(rs.getInt("MinPromotionPrice"));
				model.setDisplayedOriginalPrice(rs.getInt("MinOriginalPrice"));
				model.setListItem(itemDAO.findByProductID(productID));

				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@Override
	public List<ProductModel> findAllProduct() {
		String sql = "Select * from PRODUCT";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				ProductModel model = new ProductModel();

				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));

				list.add(model);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductModel findOneProduct(int id) {
		ProductModel model = new ProductModel();
		String sql = "Select * from PRODUCT where ProductID=?";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	public List<ProductModel> findBySupplierID(int supplierId) {
		String sql = "SELECT p.*, \r\n"
				+ "       SUBSTRING_INDEX(GROUP_CONCAT(ii.Image ORDER BY ii.ItemImageID), ',', 1) AS FirstImage,\r\n"
				+ "       (SELECT MIN(i.PromotionPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinPromotionPrice,\r\n"
				+ "       (SELECT MIN(i.OriginalPrice) FROM ITEM i WHERE i.ProductID = p.ProductID) AS MinOriginalPrice,\r\n"
				+ "AVG(rating) as Rating\r\n" + "FROM CATEGORY c\r\n"
				+ "JOIN PRODUCT p ON c.CategoryID = p.CategoryID\r\n" + "JOIN ITEM i ON p.ProductID = i.ProductID\r\n"
				+ "JOIN ITEMIMAGE ii ON ii.ItemID = i.ItemID\r\n" + "LEFT JOIN DETAIL d ON d.ItemID=i.ItemID\r\n"
				+ "WHERE p.SupplierID = ?\r\n" + "GROUP BY p.ProductID LIMIT 5;";
		List<ProductModel> list = new ArrayList<ProductModel>();

		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, supplierId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				int productID = rs.getInt("ProductID");

				model.setProductID(productID);
				model.setProductName(rs.getString("ProductName"));
				model.setDescription(rs.getString("Description"));
				model.setOrigin(rs.getString("Origin"));
				model.setSupplierID(rs.getInt("SupplierID"));
				model.setCategoryID(rs.getInt("CategoryID"));
				model.setMaterial(rs.getString("Material"));
				model.setAvgRating(rs.getFloat("Rating"));
				model.setDisplayedImage(rs.getString("FirstImage"));
				model.setDisplayedPromotionPrice(rs.getInt("MinPromotionPrice"));
				model.setDisplayedOriginalPrice(rs.getInt("MinOriginalPrice"));

				list.add(model);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<List<Object>> ProductRating() {
		List <List<Object>> list = new ArrayList<List<Object>>();
		String sql = "select pr.ProductID, ProductName, round(avg(rating), 1)rate from (select ProductID, dt.ItemID, round(avg(Rating),1) as rating from DETAIL dt join ITEM it on dt.ItemID = it.ItemID group by dt.ItemID) q join PRODUCT pr on q.ProductID = pr.ProductID group by pr.ProductID having rate is not null order by rate desc limit 5";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next())
			{
				List<Object> model = new ArrayList<Object>();
				model.add(rs.getInt("pr.ProductID"));
				model.add(rs.getString("ProductName"));
				model.add(rs.getBigDecimal("rate"));
				list.add(model);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
