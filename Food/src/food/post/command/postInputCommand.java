package food.post.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class postInputCommand implements postCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			postDTO dto = new postDTO();
			
			
			dto.setWrite_id((String)request.getParameter("write_id"));
			dto.setWrite_name((String)request.getParameter("write_name"));
			dto.setPost_title((String)request.getParameter("title"));
			dto.setPost_sub((String)request.getParameter("subtitle"));
			dto.setMain_img((String)request.getParameter("mainImg"));
			dto.setPost_content((String)request.getParameter("content"));
			
			postDAO dao = postDAO.getInstance();
			
			String check = dao.insertPost(dto);
			
			request.setAttribute("check", check);
			
			
			
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}
	
	

}
