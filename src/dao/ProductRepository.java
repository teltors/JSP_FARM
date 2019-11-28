package dao; //Database Access Object

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Product;
import mvc.database.DBConnection;
import mvc.model.BoardDTO;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository(); 
	
		
	
	public static ProductRepository getInstance() {
		return instance;
	}


	public ProductRepository() {
	
	}
	
	//product 테이블의 레코드 가져오기
		public ArrayList<Product> getAllProducts() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql;

			sql = "select * from product";
			
			ArrayList<Product> listOfProducts = new ArrayList<Product>();

			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					Product product = new Product();
					product.setProductId(rs.getString("p_id"));
					product.setPname(rs.getString("p_name"));
					product.setUnitPrice(rs.getInt("p_unitPrice"));
					product.setDescription(rs.getString("p_description"));
					product.setManufacturer(rs.getString("p_manufacturer"));
					product.setCategory(rs.getString("p_category"));
					product.setUnitsInStock(rs.getLong("p_unitsInStock"));
					product.setCondition(rs.getString("p_condition"));
					product.setFilename(rs.getString("p_fileName"));
					listOfProducts.add(product);
					
				}
				return listOfProducts;
			} catch (Exception ex) {
				System.out.println("getMemberList() 에러 : " + ex);
			} finally {
				try {
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}			
			}
			return null;
		}
	
	
	public Product getProductById(String productId) { 
		Product productById = null;
		
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
