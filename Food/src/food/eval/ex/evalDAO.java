package food.eval.ex;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import food.store.ex.storeDTO;

public class evalDAO {
		
	public static evalDAO instance;

	public static evalDAO getInstance() {
		if (instance == null)
			instance = new evalDAO();
		return instance;
	}

	String sql = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rn = 0;
	DataSource dataSource;

	public evalDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public String evalInput(evalDTO dto) {
		String check = null;
		
		try {
			conn = dataSource.getConnection();
			
			String path = "http://localhost:8181/Food/upload/";
			
			sql = "insert into eval values(eval_seq.nextval,?,?,sysdate,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getStore_id());
			pstmt.setString(2, dto.getWrite_id());
			pstmt.setInt(3, dto.getTotal());
			pstmt.setInt(4, dto.getTasty());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setInt(6, dto.getService());
			pstmt.setString(7, dto.getEval_content());
			pstmt.setString(8, dto.getFilename1());
			pstmt.setString(9, dto.getFilename2());
			pstmt.setString(10, dto.getFilename3());
			pstmt.setString(11, path);
			
			rn = pstmt.executeUpdate();
			
			if(rn>0) {
				check = "input";
				System.out.println("evaluation input Ok");
			}else {
				System.out.println("evaluation input �떎�뙣");
			}
		
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		
		return check;
	}
	
	public evalDTO evalAVG(String store_id) {
		evalDTO dto = new evalDTO();
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select ROUND(AVG(total),1) total, ROUND(AVG(tasty),1) tasty, ROUND(AVG(price),1) price, ROUND(AVG(service),1) service,"
					+ "count(*) count FROM eval WHERE store_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setStore_id(store_id);
				dto.setAvr_total(rs.getFloat("total"));
				dto.setAvr_tasty(rs.getFloat("tasty"));
				dto.setAvr_price(rs.getFloat("price"));
				dto.setAvr_service(rs.getFloat("service"));
				dto.setEval_count(rs.getInt("count"));
			}
			
			if (conn != null)
				conn.close();
			
			conn = dataSource.getConnection();
			
			CallableStatement cstmt = conn.prepareCall("{call evalCount(?,?,?,?,?,?)}");
			
			cstmt.setString(1, store_id);
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
			cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
			cstmt.registerOutParameter(5, java.sql.Types.INTEGER);
			cstmt.registerOutParameter(6, java.sql.Types.INTEGER);
			
			cstmt.executeQuery();
			
			dto.setFive_count(cstmt.getInt(2));
			dto.setFour_count(cstmt.getInt(3));
			dto.setThree_count(cstmt.getInt(4));
			dto.setTwo_count(cstmt.getInt(5));
			dto.setOne_count(cstmt.getInt(6));
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
	
	return dto;
	}
	
	
	
	
	public List<evalDTO> evalList(String store_id) {
		
		ArrayList<evalDTO> list = new ArrayList<evalDTO>();
		evalDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select eval_id, write_id,to_char(eval_date,'rrrr.MM.dd') eval_date, total, tasty, price, service, eval_content,"
					+ " filename1, filename2, filename3, eval_path"
					+ " From eval where store_id = ? order by eval_id";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				 
				dto = new evalDTO();
				dto.setEval_id(rs.getString("eval_id"));
				dto.setWrite_id(rs.getString("write_id"));
				dto.setEval_date(rs.getString("eval_date"));
				dto.setTotal(rs.getInt("total"));
				dto.setTasty(rs.getInt("tasty"));
				dto.setPrice(rs.getInt("price"));
				dto.setService(rs.getInt("service"));
				dto.setEval_content(rs.getString("eval_content"));
				
				String filename1 = rs.getString("filename1");
				String filename2 = rs.getString("filename2");
				String filename3 = rs.getString("filename3");
				String path = rs.getString("eval_path");
			
				if(filename1 == null) {filename1 = "#";}
				if(filename2 == null) { filename2 = "#";}
				if(filename3 == null) {filename3 = "#";}
				
				dto.setFilename1(path + filename1);
				dto.setFilename2(path + filename2);
				dto.setFilename3(path + filename3);
				
				list.add(dto);
								
			}
			
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		
		return list;
	}

}
