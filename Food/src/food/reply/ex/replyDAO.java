package food.reply.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class replyDAO {
	
	public static replyDAO instance;

	public static replyDAO getInstance() {
		if (instance == null)
			instance = new replyDAO();
		return instance;
	}

	String sql = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	int rn = 0;
	DataSource dataSource;

	public replyDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public void replyInput(replyDTO dto){
		
		String reply_id = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "insert into reply (reply_id, write_id, re_date, re_content, re_level,post_id)"
				+ " values(reply_seq.nextval, ?,sysdate,?,0,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWrite_id());
			pstmt.setString(2, dto.getRe_content());
			pstmt.setString(3, dto.getPost_id());
			
			rn = pstmt.executeUpdate();
			
			if(rn>0) {
				System.out.println("reply insert 성공");
				/*check = "reInput";*/
			}else {
				System.out.println("reply insert 실패");
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

	}
	public void rrInput(replyDTO dto){
		
		try {
			conn = dataSource.getConnection();
			
			sql = "insert into reply (reply_id, write_id, re_date, re_content, re_level,post_id,top_levelId)"
				+ " values(reply_seq.nextval, ?,sysdate,?,1,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWrite_id());
			pstmt.setString(2, dto.getRe_content());
			pstmt.setString(3, dto.getPost_id());
			pstmt.setString(4, dto.getReply_id());
			
			rn = pstmt.executeUpdate();
			
			if(rn>0) {
				System.out.println("rr insert 성공 ");
				
			}else {
				System.out.println("rr insert 실패");
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
	
	}
	public List<replyDTO> replyList(String post_id){
		
		List<replyDTO> list = new ArrayList<replyDTO>();
		replyDTO dto = null;
			
		try {
			conn = dataSource.getConnection();
			
			sql = "select reply_id, RPAD(substr(write_id, 1,3),8,'*') write_id, to_char(re_date,'rrrr-MM-dd HH24:mm:ss') re_date, re_content, re_level "
					+ " from reply where post_id = ? and re_level = 0 order by reply_id desc";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, post_id);
			
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					
					dto = new replyDTO();
					
					dto.setReply_id(rs.getString("reply_id"));
					dto.setWrite_id(rs.getString("write_id"));
					dto.setRe_date(rs.getString("re_date"));
					dto.setRe_content(rs.getString("re_content"));
					dto.setRe_level(rs.getInt("re_level"));
					dto.setPost_id(post_id);
					
					list.add(dto);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
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
public List<replyDTO> rrList(String reply_id){
		
		List<replyDTO> list = new ArrayList<replyDTO>();
		replyDTO dto = null;
			
		try {
			conn = dataSource.getConnection();
			
			sql = "select reply_id, RPAD(substr(write_id, 1,3),8,'*') write_id, re_date, re_content, re_level ,post_id from reply "
					+ " where top_levelId = ? order by reply_id desc";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reply_id);
			
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					
					dto = new replyDTO();
					
					dto.setReply_id(rs.getString("reply_id"));
					dto.setWrite_id(rs.getString("write_id"));
					dto.setRe_date(rs.getString("re_date"));
					dto.setRe_content(rs.getString("re_content"));
					dto.setRe_level(rs.getInt("re_level"));
					dto.setPost_id(rs.getString("post_id"));
					
					list.add(dto);
				}
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
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
	public replyDTO replyOne(String post_id) {
		
		replyDTO dto = new replyDTO();
				
		try {
				conn = dataSource.getConnection();
				
				sql = "select reply_id,RPAD(substr(write_id, 1,3),8,'*') write_id, to_char(re_date,'rrrr-MM-dd HH24:mm:ss') re_date, re_content from reply "
					  + "where reply_id = (select max(reply_id) from reply where post_id = ?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, post_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto.setReply_id(rs.getString("reply_id"));
					dto.setWrite_id(rs.getString("write_id"));
					dto.setRe_date(rs.getString("re_date"));
					dto.setRe_content(rs.getString("re_content"));
					
				}
					
										
		}catch (SQLException e) {
				e.printStackTrace();
		}finally {
				try {
					if(rs != null)
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
	public replyDTO rrOne(String reply_id) {
		
		replyDTO dto = new replyDTO();
				
		try {
				conn = dataSource.getConnection();
				
				sql = "select reply_id,RPAD(substr(write_id, 1,3),8,'*') write_id, to_char(re_date,'rrrr-MM-dd HH24:mm:ss') re_date, re_content from reply "
					  + "where reply_id = (select max(reply_id) from reply where top_levelId = ?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, reply_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto.setReply_id(reply_id);
					dto.setWrite_id(rs.getString("write_id"));
					dto.setRe_date(rs.getString("re_date"));
					dto.setRe_content(rs.getString("re_content"));
					
				}
					
										
		}catch (SQLException e) {
				e.printStackTrace();
		}finally {
				try {
					if(rs != null)
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
}
