package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Product;

public class ProductDao {
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select * from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductPic(rs.getString("product_pic"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		conn.close();
		return product;
	}
	
	public ArrayList<Product> selectProductList() throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, product_pic, product_name, product_price from product limit 0, 6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> selectProductByCategoryList(String categoryName) throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "";
		PreparedStatement stmt = null;
		if (categoryName == "all") {
			sql = "SELECT product.product_id, product.category_id, category.category_name, product.product_name, product.product_price, product.product_soldout "
					+ "FROM product INNER JOIN category ON product.category_id=category.category_id WHERE category.category_name";
			stmt = conn.prepareStatement(sql);
		}
		else {
			sql = "SELECT product.product_id, product.category_id, category.category_name, product.product_name, product.product_price, product.product_soldout "
				+ "FROM product INNER JOIN category ON product.category_id=category.category_id WHERE category.category_name LIKE ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, categoryName);
		}
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setCategoryName(rs.getString("category_name"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
}
