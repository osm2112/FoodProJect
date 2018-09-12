package food.reservation.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import food.reservation.dto.ReservationCalendarDTO;
import food.reservation.dto.ReservationDTO;

public class ReservationDAO {
	Connection conn = null;
	ResultSet rs = null;
	public Connection getConnection() {
		try {
			String user = "hr";
			String pw = "hr";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("Database에 연결되었습니다.\n");

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :" + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		return conn;
	}

	public List<ReservationDTO> SelectCheckSeat(String storeId, String reserveDate) {
		getConnection();
		
		List<ReservationDTO> list = new ArrayList<>();
		String sql = " SELECT STORE_ID, TO_CHAR(RESERVE_DATE,'yyyy')||'년'	" + 
		             "        ||TO_CHAR(RESERVE_DATE,'mm')||'월 '			" +
		             "        ||TO_CHAR(RESERVE_DATE,'dd')||'일' 			" +
		             "		  AS RESERVE_DATE, RESERVE_TIME,				" + 
				     "		  RESERVE_SEAT, RESERVE_PERMIT_SEAT				" + 
				     "   FROM RESERVE_SEAT_CHECK							" + 
				     "  WHERE STORE_ID = ? AND RESERVE_DATE= ? 				" ;
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, storeId);
			pstmt.setString(2, reserveDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setReserveDate(rs.getString("RESERVE_DATE"));
				dto.setReserveTime(rs.getString("RESERVE_TIME"));
				dto.setReserveSeat(rs.getString("RESERVE_SEAT"));
				dto.setReservePermitSeat(rs.getString("RESERVE_PERMIT_SEAT"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	
	public String InsertReservation( String userId, 	 String reserseStoreId, String reserveName, 
								  	 String reserveDate, String reserveTime, 	String reserveSeat,
								  	 String reserveTel,  String reserveEmail, 	String reserveComment) {
		getConnection();
		String result = null;
		CallableStatement cstmt = null;
		try {
			  cstmt = conn.prepareCall("{ call INSERT_RESERVATION( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) }"); 
			  cstmt.setString(1, userId);
			  cstmt.setString(2, reserseStoreId);
			  cstmt.setString(3, reserveName);
			  cstmt.setString(4, reserveDate);
			  cstmt.setString(5, reserveTime);
			  cstmt.setString(6, reserveSeat);
			  cstmt.setString(7, reserveTel);
			  cstmt.setString(8, reserveEmail);
			  cstmt.setString(9, reserveComment);
			  cstmt.registerOutParameter(10, oracle.jdbc.OracleTypes.VARCHAR ); 
			  cstmt.executeQuery();
			  result = cstmt.getString(10);
			  System.out.println(result);
		}  catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (cstmt != null) {
					cstmt.close();
					cstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}	
	
	public int DeleteReservation(String reservationId, String userId) {
		getConnection();
		int result = 0;
		CallableStatement cstmt = null;
		try {
			cstmt = conn.prepareCall("{ call DELETE_RESERVATION( ?, ?, ? ) }");
			cstmt.setString(1, reservationId);
			cstmt.setString(2, userId);
			cstmt.registerOutParameter(3, oracle.jdbc.OracleTypes.INTEGER);
			cstmt.executeQuery();
			result = cstmt.getInt(3);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (cstmt != null) {
					cstmt.close();
					cstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}
	
	public ReservationDTO SelectReserveDetail( String reservationId, String userId ) {
		getConnection();
		ReservationDTO dto = new ReservationDTO();
		PreparedStatement pstmt = null;
		try {
			String sql = "SELECT RESERVATION.RESERVATION_ID,			" + 
						 "       STORE.STORENAME AS STORE_NAME,			" +
						 "       STORE.STORETEL	 AS STORE_TEL,			" +
						 "       STORE.STOREADDR AS STORE_ADDR,			" +
						 "       RESERVATION.RESERVE_NAME,				" + 
						 "       RESERVATION.RESERVE_DATE,				" + 
						 "       RESERVATION.RESERVE_TIME,				" + 
						 "       RESERVATION.RESERVE_SEAT,				" + 
						 "       RESERVATION.RESERVE_TEL,				" + 
						 "       RESERVATION.RESERVE_EMAIL,				" + 
						 "       RESERVATION.RESERVE_COMMENT			" + 
						 "  FROM RESERVATION JOIN STORE 				" + 
						 "	  ON RESERVATION.STORE_ID = STORE.STOREID	" + 
						 " WHERE RESERVATION.RESERVATION_ID = ?			" + 
						 " 	 AND RESERVATION.USER_ID = ?				" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservationId);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setReservationId(rs.getString("RESERVATION_ID"));
				dto.setStoreName(rs.getString("STORE_NAME"));
				dto.setStoreTel(rs.getString("STORE_TEL"));
				dto.setStoreAddr(rs.getString("STORE_ADDR"));
				dto.setReserveName(rs.getString("RESERVE_NAME"));
				dto.setReserveDate(rs.getString("RESERVE_DATE"));
				dto.setReserveTime(rs.getString("RESERVE_TIME"));
				dto.setReserveSeat(rs.getString("RESERVE_SEAT"));
				dto.setReserveTel(rs.getString("RESERVE_TEL"));
				dto.setReserveEmail(rs.getString("RESERVE_EMAIL"));
				dto.setReserveComment(rs.getString("RESERVE_COMMENT"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return dto;
	}
	
	public int GetReservationListCount( String userId) {
		int count = 0;
		getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = " SELECT COUNT(*) FROM RESERVATION WHERE USER_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return count;

	}
	
	public List<ReservationDTO> GetReservationList(String userId, int page, int limit) {
		getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReservationDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM (   																   		" + 
				"				     SELECT ROWNUM RNUM, RESERVATION_ID, STORENAME,RESERVE_DATE,RESERVE_TIME	" + 
				"				   	   FROM ( SELECT * 													   		" + 
				"				   	          	FROM RESERVATION A JOIN STORE B									" + 
				"                             	  ON A.STORE_ID = B.CODE										" + 
				"                              WHERE USER_ID= ?													" + 
				"				   		       ORDER BY RESERVE_DATE DESC, RESERVE_TIME ASC 					" + 
				"                     		 )						  											" + 
				"				    ) WHERE RNUM >= ? AND RNUM <= ?";

		int startrow = (page - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setReservationId(rs.getString("RESERVATION_ID"));
				dto.setStoreName(rs.getString("STORENAME"));
				dto.setReserveDate(rs.getString("RESERVE_DATE"));
				dto.setReserveTime(rs.getString("RESERVE_TIME"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	public  List<ReservationCalendarDTO> GetCalendarEvent(String storeId, String startDate, String endDate) {
		getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReservationCalendarDTO> list = new ArrayList<ReservationCalendarDTO>();
		String sql = " SELECT RESERVE_NAME||'( '||RESERVE_SEAT||'명 연락처 : '||RESERVE_TEL||' 요청사항 :'||RESERVE_COMMENT||' )' AS RESULT1,			" + 
					 "        TO_CHAR(RESERVE_DATE,'yyyy-mm-dd')||' '||SUBSTR(RESERVE_TIME,0,5) AS RESULT2,										" + 
					 "		  TO_CHAR(RESERVE_DATE,'yyyy-mm-dd')||' '||SUBSTR(RESERVE_TIME,9,11) AS RESULT3										" + 
					 "	FROM RESERVATION 																										" + 
					 " WHERE STORE_ID = ?																										" + 
					 "   AND RESERVE_DATE BETWEEN ? AND ?																							" ;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeId);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservationCalendarDTO dto = new ReservationCalendarDTO();
				dto.setTitle(rs.getString("RESULT1"));
				dto.setStart(rs.getString("RESULT2"));
				dto.setEnd(rs.getString("RESULT3"));
				list.add(dto);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;
	}
	
	
	
}
