package food.member.ex;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	String sql = null;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rn = 0;
	DataSource dataSource;
	
	
	public memberDAO() {		

			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			} catch (Exception e) {

				e.printStackTrace();
			}		
	}
	
	public String insertMember(memberDTO dto)  {
		
		String joinOk = null;
		
		try {
			conn = dataSource.getConnection();
			
			System.out.println(dto.getId());
			
			sql = "insert into member values(?,?,?,?,?,?,?,sysdate,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			String tel = dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3();
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getBirthday());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, tel);
			pstmt.setString(8, dto.getAddrnum());
			pstmt.setString(9, dto.getAddr());
			pstmt.setString(10, dto.getAddrdetail());
			pstmt.setString(11, dto.getUserState());
			
			rn = pstmt.executeUpdate();
			
			if(rn>0) {
				System.out.println("member insert �꽦怨� ");
				joinOk = "ok";
			}	
			else {
				System.out.println("member insert �떎�뙣");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		return joinOk;
		
	}
	
public int userCheck(String id,String pwd) {
		
		int check = 0;
	
		try {
			
			conn = dataSource.getConnection();
			
			CallableStatement cstmt = conn.prepareCall("{call pro_log(?,?,?)}");
			
			cstmt.setString(1, id);
			cstmt.setString(2, pwd);
			cstmt.registerOutParameter(3,java.sql.Types.FLOAT);
			
			rn = cstmt.executeUpdate();
			
			check = cstmt.getInt(3);	
			System.out.println("userCheck check : " + check);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		
		return check;
	}

	public memberDTO idCheck(String id) {
		memberDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select id,password,name,user_state from member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new memberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setUserState(rs.getString("user_state"));
				
			}
			else
				System.out.println("id媛� �뾾�뒿�땲�떎. ");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		
		
		
		
		return dto;
	}
	
	public memberDTO memberInfo(String id) {
		
		memberDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select id, password, name, gender, to_char(birthday,'rrrr/MM/dd') birthday, email, phone_num, to_char(reg_date,'rrrr-MM-dd') reg_date, addr_num, addr, addr_detail, user_state"
				+" from member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new memberDTO();
				
				dto.setId(id);
				dto.setPwd(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirthday(rs.getString("birthday"));
				dto.setEmail(rs.getString("email"));
				dto.setPhoneNum(rs.getString("phone_num"));
				dto.setRegDate(rs.getString("reg_date"));
				dto.setAddrnum(rs.getString("addr_num"));
				dto.setAddr(rs.getString("addr"));
				dto.setAddrdetail(rs.getString("addr_detail"));
				dto.setUserState(rs.getString("user_state"));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		return dto;
	}
	public int updateMember(memberDTO dto) {
		int check = 0;
		System.out.println("dao update password : " + dto.getPwd());
		
		try {
			conn = dataSource.getConnection();
			
			CallableStatement cstmt = conn.prepareCall("{call updateMember(?,?,?,?,?,?,?,?,?,?)}");
			String tel = dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3();
			cstmt.setString(1, dto.getId());
			cstmt.setString(2, dto.getPwd());
			cstmt.setString(3, dto.getGender());
			cstmt.setString(4, dto.getBirthday());
			cstmt.setString(5, dto.getEmail());
			cstmt.setString(6, tel);
			cstmt.setString(7, dto.getAddrnum());
			cstmt.setString(8, dto.getAddr());
			cstmt.setString(9, dto.getAddrdetail());
			cstmt.registerOutParameter(10,java.sql.Types.INTEGER);
			
			int rn = cstmt.executeUpdate();
			
			if(rn>0)
				System.out.println("update");
			
			check = cstmt.getInt(10);
			System.out.println("Update try �븞�쓽 check : " + check);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		System.out.println("try 諛뽰쓽 check : " + check);
		return check;
	}
	
	public int pwdCheck(String id, String pwd) {

		int CheckNum = 0;
		String Pwd;



		try {
			conn = dataSource.getConnection();

			String sql = "select password from member where id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				Pwd = rs.getString("password");
				if(Pwd.equals(pwd)) {
					CheckNum = 1;		
				} else {
					CheckNum = 0;		
				}
			} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return CheckNum;
	}
	
	public int deleteMember(String id) {   

		try {
			conn = dataSource.getConnection();
			String sql = "delete from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rn = pstmt.executeUpdate();
			
			if(rn > 0 )
				System.out.println(rn+"媛쒖쓽 �뻾 �궘�젣 �꽦怨�");
			else
				System.out.println("�떎�뙣");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return rn;
	}

	

}
