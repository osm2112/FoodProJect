package food.store.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class storeDAO {
	
	private static storeDAO instance;
	
	public static storeDAO getInstance() {
		if (instance == null)
			instance = new storeDAO();
		return instance;
	}
	
	DataSource dataSource;
	Connection conn = null;
	Connection conn2 = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	int rn = 0;
	int rn2 = 0; 
	
	public storeDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//매장등록 신청목록(관리자)
	public List<storeDTO> applyList(String pageNum) {
		
		int i = 1;
				
		storeDTO dto = null;
		List<storeDTO> list = new ArrayList<>();

		try {
			conn = dataSource.getConnection();

			int page;

			if (pageNum == null) {
				page = 1;
			} else {
				page = Integer.parseInt(pageNum);
			} 

			int countPage = 10;

			int query_startPage = (page - 1) * countPage + 1; 
			int query_endPage = page * countPage; 
			
			String sql = "select * "
						+ "from (select rownum as rnum, A.count, A.storeid, A.id, A.name, A.storename, A.category, A.storeaddrnum, A.storeaddr, A.storeaddrdetail, A.storetel, A.permit "
						+ 		"from (select count, storeid, id, name, storename, category, storeaddrnum, storeaddr, storeaddrdetail, storetel, permit "
						+ 			  "from store order by count desc) A "
						+ 		"where rownum <= " + query_endPage +") X "       
						+ "where X.rnum >= " + query_startPage;
			
			pstmt2 = conn.prepareStatement(sql);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				dto = new storeDTO();
				dto.setCount(rs2.getString("count"));
				dto.setStoreid(rs2.getString("storeid"));
				dto.setId(rs2.getString("id"));
				dto.setName(rs2.getString("name"));
				dto.setStorename(rs2.getString("storename"));
				dto.setCategory(rs2.getString("category"));
				dto.setStoreaddrnum(rs2.getString("storeaddrnum"));
				dto.setStoreaddr(rs2.getString("storeaddr"));
				dto.setStoreaddrdetail(rs2.getString("storeaddrdetail"));
				dto.setStoretel(rs2.getString("storetel"));
				dto.setPermit(rs2.getString("permit"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;

	}
	
	//매장 관리 목록(점주)
	public List<storeDTO> manageStoreList(String pageNum, String id) {
		
		storeDTO dto = null;
		List<storeDTO> list = new ArrayList<>();

		int page;

		if (pageNum == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageNum);
		} 

		int countPage = 5;

		int query_startPage = (page - 1) * countPage + 1; 
		int query_endPage = page * countPage; 
		
		try {

			conn = dataSource.getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			String sql = "select * " + 
						 "from (select rownum as rnum, A.count, A.storeid, A.id, A.storename, A.permit " +
						       "from (select count, storeid, id, storename, permit " +
						       		 "from store where id = ? order by count desc) A " +
						       "where rownum <= " + query_endPage + " ) X " +       
						 "where X.rnum >= " + query_startPage;
		
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setString(1, id);
			
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()) {
				dto = new storeDTO();
				dto.setCount(rs2.getString("count"));
				dto.setStoreid(rs2.getString("storeid"));
				dto.setId(id);
				dto.setStorename(rs2.getString("storename"));
				dto.setPermit(rs2.getString("permit"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;

	}
	
	//applyList의 총 개수
	public String CountList() {
		
		String cnt = null;
		
		String sql = "select count(*) as cnt from store";
		
		try {

			conn = dataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			cnt=rs.getString("cnt");

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
		
	}
	
	//manageStoreList의 총 개수
		public String mCountList(String id) {

			String cnt = null;

			storeDTO dto = null;

			try {

				conn = dataSource.getConnection();
				
				String sql = "select count(*) as cnt from store where id=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();

				rs.next();
							
				cnt=rs.getString("cnt");

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return cnt;

		}
	
	//매장등록 신청하기(점주)
	public String applyStore(storeDTO dto) {
		
		String check = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into store (count, storeid, id, name, storename, category, storeaddrnum, storeaddr, storeaddrdetail, storetel) "
						+ "values(store_seq.nextval, 'store'||lpad(store_seq.currval, 4, 0), ?, ?, ?, ?, ?, ?, ?, ?)";
			
			String tel = dto.getStoretel1()+"-"+dto.getStoretel2()+"-"+dto.getStoretel3();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getStorename());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getStoreaddrnum());
			pstmt.setString(6, dto.getStoreaddr());
			pstmt.setString(7, dto.getStoreaddrdetail());
			pstmt.setString(8, tel);
			
			rn = pstmt.executeUpdate();
			
			if(rn > 0) { 
				System.out.println("applyStore INSERT");
				check = "Ok";
			} else
				System.out.println("applyStore FAIL");
	
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}
	//매장등록 신청 허가(관리자)
	public String permission(storeDTO dto) {

		String check = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "update store set permit='P' "
									+ "where count = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCount());
			rn = pstmt.executeUpdate();

			if(rn > 0) {
				System.out.println("'Permission' INSERT");
				check = "ok";
			} else
				System.out.println("'Permisson' FAIL");
			
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
		return check;
	}
	// 매장 등록 신청 거부(관리자)
	public String rejection(storeDTO dto) {

		String check = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "update store set permit='R' "
									+ "where count = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCount());
			rn = pstmt.executeUpdate();

			if(rn > 0) {
				System.out.println("'Rejection' INSERT");
				check = "ok";
			} else
				System.out.println("'Rejection' FAIL");
			
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
		return check;
	}
	
	//매장정보 업데이트시 보여주는 창(기본 정보)
	public storeDTO updateStoreView(String storeid) {
		
		storeDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select storeid, storename, category, storeaddrnum, storeaddr, storeaddrdetail, storetel, "
							+	"trim('-' from substr(storetel,1,3)) as storetel1, replace(substr(storetel,4,5), '-') as storetel2, substr(storetel, -4, 4) as storetel3, "
							+	"thumbnailimg "
							+	"from store where storeid=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,storeid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new storeDTO();
				
				dto.setStoreid(rs.getString("storeid"));
				dto.setStorename(rs.getString("storename"));
				dto.setCategory(rs.getString("category"));
				dto.setStoreaddrnum(rs.getString("storeaddrnum"));
				dto.setStoreaddr(rs.getString("storeaddr"));
				dto.setStoreaddrdetail(rs.getString("storeaddrdetail"));
				dto.setStoretel(rs.getString("storetel"));
				dto.setStoretel1(rs.getString("storetel1"));
				dto.setStoretel2(rs.getString("storetel2"));
				dto.setStoretel3(rs.getString("storetel3"));
				dto.setThumbnailimg(rs.getString("thumbnailimg"));
			}
			
		} catch (SQLException e) {
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
	
	//매장정보 업데이트시 보여주는 창(기타 정보)
	public regStoreDTO updateStoreView2(String rsstoreid) {

		regStoreDTO dto1 = null;

		try {
			conn = dataSource.getConnection();

			String sql = "select * from reg_store where storeid=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,rsstoreid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto1 = new regStoreDTO();

				dto1.setRsstoreid(rs.getString("storeid"));
				dto1.setMenu(rs.getString("menu"));
				dto1.setFilename1(rs.getString("filename1"));
				dto1.setFilename2(rs.getString("filename2"));
				dto1.setFilename3(rs.getString("filename3"));
				dto1.setFilename4(rs.getString("filename4"));
				dto1.setFilename5(rs.getString("filename5"));
				dto1.setImg_path(rs.getString("img_path"));
			}

		} catch (SQLException e) {
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

		return dto1;
	}

	//매장 등록or수정-(기본 정보)
	public String updateStore(storeDTO dto) {
		
		String check = null;
		
		try {
			conn = dataSource.getConnection();

			String path = "http://localhost:8181/Food/upload/";
			
			String sql = "update store set storename=?, category=?, storeaddrnum=?, storeaddr=?, storeaddrdetail=?, storetel=?, "
							+ "thumbnailimg=?, tn_img_path=? "
							+ "where storeid=?";
			
			String tel = dto.getStoretel1()+"-"+dto.getStoretel2()+"-"+dto.getStoretel3();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getStorename());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getStoreaddrnum());
			pstmt.setString(4, dto.getStoreaddr());
			pstmt.setString(5, dto.getStoreaddrdetail());
			pstmt.setString(6, tel);
			pstmt.setString(7, dto.getThumbnailimg());
			pstmt.setString(8, path);
			pstmt.setString(9, dto.getStoreid());

			rn = pstmt.executeUpdate();

			if(rn > 0) {
				System.out.println("store info UPDATE");
				check = "ok";
			} else
				System.out.println("store info update FAIL");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}
	
	//매장 등록or수정2-(기타 정보)
	public String updateStore2(storeDTO dto, regStoreDTO dto1) {

		String check2 = null;

		try {
			conn = dataSource.getConnection();

			String path = "http://localhost:8181/Food/upload/";
			
			String sql2 = "merge into reg_store " + 
						  "using dual " + 
						  "on (storeid = ?) " + 
						  "when matched then " + 
						  		"update set menu=?, filename1=?, filename2=?, filename3=?, filename4=?, filename5=?, img_path=? " + 
						  "when not matched then " + 
						  		"insert (storeid, menu, filename1, filename2, filename3, filename4, filename5, img_path) " + 
						  		"values (?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt2 = conn.prepareStatement(sql2);
			
			pstmt2.setString(1, dto.getStoreid());
			pstmt2.setString(2, dto1.getMenu());
			pstmt2.setString(3, dto1.getFilename1());
			pstmt2.setString(4, dto1.getFilename2());
			pstmt2.setString(5, dto1.getFilename3());
			pstmt2.setString(6, dto1.getFilename4());
			pstmt2.setString(7, dto1.getFilename5());
			pstmt2.setString(8, path);
			pstmt2.setString(9, dto.getStoreid());
			pstmt2.setString(10, dto1.getMenu());
			pstmt2.setString(11, dto1.getFilename1());
			pstmt2.setString(12, dto1.getFilename2());
			pstmt2.setString(13, dto1.getFilename3());
			pstmt2.setString(14, dto1.getFilename4());
			pstmt2.setString(15, dto1.getFilename5());
			pstmt2.setString(16, path);
			
			rn2 = pstmt2.executeUpdate();

			if(rn2 > 0) {
				System.out.println("reg_store info UPDATE");
				check2 = "ok";
			} else
				System.out.println("reg_store info update FAIL");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check2;
	}
	
	//////////////////////////////evaluate//////////////////////////////
	//evalInputViewCommand에서 사용함	
	public storeDTO evalStoreView(String storeid) {
			
			storeDTO dto = null;
			String path = "http://localhost:8181/Food/upload/";
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select storeid, storename, category, storeaddrnum, storeaddr, storeaddrdetail, storetel, "
								+	"thumbnailimg "
								+	"from store where storeid=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,storeid);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					dto = new storeDTO();
					
					dto.setStoreid(rs.getString("storeid"));
					dto.setStorename(rs.getString("storename"));
					dto.setCategory(rs.getString("category"));
					dto.setStoreaddrnum(rs.getString("storeaddrnum"));
					dto.setStoreaddr(rs.getString("storeaddr"));
					dto.setStoreaddrdetail(rs.getString("storeaddrdetail"));
					dto.setStoretel(rs.getString("storetel"));
					dto.setThumbnailimg(path + rs.getString("thumbnailimg"));
				}
				
			} catch (SQLException e) {
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
		
/*---------------------searchView----------------------------------------------------------*/
	public storeDTO storeSearchView(String storeid) {
		storeDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select * from store";
			
			
			
		} catch(SQLException e) {
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














}

