package dao;
import vo.*;
import java.sql.*;
import java.util.ArrayList;

import commons.*;
public class OrdersDao {
	
	public void insertOrders(Orders orders) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into orders(product_id,orders_amount,orders_price,member_email,orders_addr,orders_state,orders_date) values(?,?,?,?,?,'�����Ϸ�',now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeUpdate();
		conn.close();
	}
	public ArrayList<OrdersAndProduct> selectOrdersList(String loginMemberEmail) throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT orders.orders_id, orders.orders_date, orders.product_id, product.product_name, orders.orders_amount, orders.orders_price, orders.member_email, orders.orders_addr, orders.orders_state FROM orders INNER JOIN product ON orders.product_id=product.product_id where orders.member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginMemberEmail);
		System.out.println(loginMemberEmail+" <-- loginMemberEmail");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.product = new Product();
			oap.orders = new Orders();
			oap.orders.setOrdersId(rs.getInt("orders.orders_id"));
			oap.orders.setOrdersDate(rs.getString("orders.orders_date"));
			oap.product.setProductName(rs.getString("product.product_name"));
			oap.orders.setOrdersAmount(rs.getInt("orders.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("orders.orders_price"));
			oap.orders.setMemberEmail(rs.getString("orders.member_email"));
			oap.orders.setOrdersAddr(rs.getString("orders.orders_addr"));
			oap.orders.setOrdersState(rs.getString("orders.orders_state"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
}
