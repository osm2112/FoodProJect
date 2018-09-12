package food.post.ex;

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

public class postDAO {

	public static postDAO instance;

	public static postDAO getInstance() {
		if (instance == null)
			instance = new postDAO();
		return instance;
	}

	String sql = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rn = 0;
	DataSource dataSource;

	public postDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public String insertPost(postDTO dto) {

		String check = "Fail";

		try {
			conn = dataSource.getConnection();

			String path = "http://localhost:8181/Food/upload/";

			sql = "insert into post values(post_seq.nextval,?,?,sysdate,?,?,?,null,0,0,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWrite_id());
			pstmt.setString(2, dto.getWrite_name());
			pstmt.setString(3, dto.getPost_title());
			pstmt.setString(4, dto.getPost_sub());
			pstmt.setString(5, dto.getPost_content());
			pstmt.setString(6, dto.getMain_img());
			pstmt.setString(7, path);

			int rn = pstmt.executeUpdate();

			if (rn > 0) {
				System.out.println("post insert 성공");
				check = "input";
			}

			else
				System.out.println("post insert 실패");

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

	public List<postDTO> postList(String order) {

		List<postDTO> list = new ArrayList<postDTO>();

		postDTO dto = null;
		String orderBy = "order by post_date desc";
		try {
			conn = dataSource.getConnection();
			
			if(("post_like").equals(order)) {
				orderBy = "order by post_like desc";
			}else if (("post_commend").equals(order)){
				orderBy = "order by post_commend desc";
			}
			
			
			sql = "select post_id,write_id, substr(write_name, 1,1)||'*'||substr(write_name, 3,1) write_name,"
					+ " to_char(post_date,'Month DD, RRRR') pdate,"
					+ "post_title, post_sub, post_like,post_commend,main_img,img_path from post "
					+ orderBy ;
			
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new postDTO(); 
				
				dto.setPost_id(rs.getString("post_id"));
				dto.setWrite_id(rs.getString("write_id"));
				dto.setWrite_name(rs.getString("write_name"));
				dto.setPost_date(rs.getString("pdate"));
				dto.setPost_title(rs.getString("post_title"));
				dto.setPost_sub(rs.getString("post_sub"));
				dto.setPost_like(rs.getInt("post_like"));
				dto.setPost_commend(rs.getInt("post_commend"));
				dto.setMain_img(rs.getString("main_img"));
				dto.setImg_path(rs.getString("img_path") + rs.getString("main_img"));

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

	public postDTO viewPost(String id) {

		postDTO dto = null;

		System.out.println(id);

		try {
			conn = dataSource.getConnection();

			sql = "select post_id,write_id, substr(write_name, 1,1)||'*'||substr(write_name, 3,1) write_name,"
					+ " to_char(post_date,'Month DD, RRRR') post_date,"
					+ "post_title, post_sub, post_content, post_like,post_commend,main_img,img_path from post where post_id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new postDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setWrite_id(rs.getString("write_id"));
				dto.setWrite_name(rs.getString("write_name"));
				dto.setPost_date(rs.getString("post_date"));
				dto.setPost_title(rs.getString("post_title"));
				dto.setPost_sub(rs.getString("post_sub"));
				dto.setPost_content(rs.getString("post_content"));
				dto.setPost_like(rs.getInt("post_like"));
				dto.setPost_commend(rs.getInt("post_commend"));
				dto.setMain_img(rs.getString("main_img"));
				dto.setImg_path(rs.getString("img_path") + rs.getString("main_img"));

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

		return dto;

	}

	public List<postDTO> mypostList(String id) {

		postDTO dto = null;

		List<postDTO> list = new ArrayList<postDTO>();

		System.out.println(id);

		try {
			conn = dataSource.getConnection();

			sql = "select post_id,write_id, substr(write_name, 1,1)||'*'||substr(write_name, 3,1) write_name,"
					+ " to_char(post_date,'rrrr-MM-dd HH24:mm:ss') post_date,"
					+ "post_title, post_sub, post_content, post_like,post_commend,main_img,img_path from post where write_id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new postDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setWrite_id(rs.getString("write_id"));
				dto.setWrite_name(rs.getString("write_name"));
				dto.setPost_date(rs.getString("post_date"));
				dto.setPost_title(rs.getString("post_title"));
				dto.setPost_sub(rs.getString("post_sub"));
				dto.setPost_content(rs.getString("post_content"));
				dto.setPost_like(rs.getInt("post_like"));
				dto.setMain_img(rs.getString("main_img"));
				dto.setImg_path(rs.getString("img_path") + rs.getString("main_img"));

				list.add(dto);

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

		return list;

	}

	public String updatePost(postDTO dto) {
		String check = null;
		try {
			
			String path = "http://localhost:8181/Food/upload/";
			
			conn = dataSource.getConnection();

			CallableStatement cstmt = conn.prepareCall("{call updatePost(?,?,?,?,?,?,?)}");

			cstmt.setString(1, dto.getPost_id());
			cstmt.setString(2, dto.getPost_title());
			cstmt.setString(3, dto.getPost_sub());
			cstmt.setString(4, dto.getPost_content());
			cstmt.setString(5, dto.getMain_img());
			cstmt.setString(6, path);
			cstmt.registerOutParameter(7, java.sql.Types.INTEGER);

			cstmt.executeUpdate();

			rn  = cstmt.getInt(7);
			
			if(rn>0) {
				System.out.println("post update 성공");
				check = "update";
			}
				

			
			System.out.println("Update try 안의 check : " + check);

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
	
	public String deletePost(String id) {
		
		String check = null;
		
			try {
				conn = dataSource.getConnection();
				
				sql = "delete from post where post_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rn = pstmt.executeUpdate();
				
				if(rn>0) {
					
					System.out.println("post delete Ok");
					check = "delete";
				}
				else {
					
					System.out.println("post delete 실패");
					
				}
				
				if (pstmt != null)
					pstmt.close();
				
				sql = "delete from likeCommend where post_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rn = pstmt.executeUpdate();
				
				if(rn>0) {
					
					System.out.println("like delete Ok");
					
				}
				else {
					
					System.out.println("post delete 실패");
					
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
	
	public String postLike(String post_id,String write_id) {
		
		String like = null;
		
		try {
			conn = dataSource.getConnection();
			
			CallableStatement cstmt = conn.prepareCall("{call likeUpdate(?,?,?)}");
			
			cstmt.setString(1, post_id);
			cstmt.setString(2, write_id);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			
			cstmt.executeQuery();
			
			like = cstmt.getString(3);
	
		
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		return like;
		
	}
public String postCommend(String post_id,String write_id) {
		
		String commend = null;
		
		try {
			conn = dataSource.getConnection();
			
			CallableStatement cstmt = conn.prepareCall("{call commendUpdate(?,?,?)}");
			
			cstmt.setString(1, post_id);
			cstmt.setString(2, write_id);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			
			cstmt.executeQuery();
			
			commend = cstmt.getString(3);
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		return commend;
		
	}

}
