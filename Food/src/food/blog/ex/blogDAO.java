package food.blog.ex;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class blogDAO {

	String sql = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rn = 0;
	DataSource dataSource;

	public blogDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public List<blogDTO> blogList(String store_id){
		
		List<blogDTO> list = new ArrayList<blogDTO>();
		
		blogDTO dto = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select blog_id, blog_name, to_char(blog_date,'rrrr-MM-dd hh24:mm:ss') blog_date, blog_title, blog_content, store_name from blog where store_id = ?  ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, store_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto = new blogDTO();
				
				dto.setB_id(rs.getString("blog_id"));
				dto.setWrite_id(rs.getString("blog_name"));
				dto.setB_date(rs.getString("blog_date"));
				dto.setB_title(rs.getString("blog_title"));
				dto.setB_content(rs.getString("blog_content"));
				dto.setStore_name(rs.getString("store_name"));
				
				list.add(dto);
				
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
				
		
		
		return list;
		
	}
	public blogDTO viewBlog(String id) {
		
		blogDTO dto = null;
		
		System.out.println(id);
		
		try {
			conn = dataSource.getConnection();
			
			sql = "select blog_id, write_id, blog_name, to_char(blog_date, 'rrrr-MM-dd hh24:mm:ss') blog_date,"
					+ " blog_title, blog_content, blog_tag, blog_like, store_id, store_name from blog where blog_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new blogDTO();
				
				dto.setB_id(rs.getString("blog_id"));
				dto.setWrite_id(rs.getString("write_id"));
				dto.setB_name(rs.getString("blog_name"));
				dto.setB_date(rs.getString("blog_date"));
				dto.setB_title(rs.getString("blog_title"));
				dto.setB_content(rs.getString("blog_content"));
				dto.setB_tag(rs.getString("blog_tag"));
				dto.setB_like(rs.getInt("blog_like"));
				dto.setStore_id(rs.getString("store_id"));
				dto.setStore_name(rs.getString("store_name"));
			}
			
		}catch (SQLException e) {

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

		return dto;
	
	}
	
	public String insertBlog(blogDTO dto) {
		
		String check = "Fail";
		
		try {
			conn = dataSource.getConnection();
			
			sql = "insert into blog values(blog_seq.nextval,?,?,sysdate,?,?,null,0,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWrite_id());
			pstmt.setString(2, dto.getB_name());
			pstmt.setString(3, dto.getB_title());
			pstmt.setString(4, dto.getB_content());
			pstmt.setString(5, dto.getStore_id());
			pstmt.setString(6, dto.getStore_name());
			
			int rn = pstmt.executeUpdate();
			
			if(rn>0) {
				System.out.println("blog insert 성공");
				check = "Ok";
			}
				
			else
				System.out.println("blog insert 실패");
			
			
			
			
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
		
		return check;
	}
	
	public String likeUpdate(String id) {
		
		String like = null;
		
		try {
			conn = dataSource.getConnection();
			
			sql = "update blog set blog_like = blog_like + 1 where blog_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rn = pstmt.executeUpdate();
			
			if(rn>0) {
				System.out.println("like update 성공");
			}else 
				System.out.println("like update 실패");
			
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
			
			String sql1 = "select blog_like from blog where blog_id = ?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				like = rs.getString("blog_like");
			}
			
			
			
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
	
	//blog Api 가져오기 (display : 검색 개수, keyword : 검색어)
	public String Api(String keyword, int s) {

		String clientId = "h5z5OSvhy_LHEt7h3S5a";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "TvzvXkgOD_";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response1 = null;
        int display = 5;

        try {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text + "&display=" + display + "&start=" + s; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            System.out.println("url:" + url);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response1 = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response1.append(inputLine);
            }
            br.close();
            System.out.println(response1.toString());
        } catch (Exception e) {
            System.out.println(e);
           
	}
        return response1.toString();
	}
}
