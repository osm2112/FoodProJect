package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class postViewCommand implements postCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String id = (String)request.getParameter("post_id");
		
		System.out.println(id);
		postDAO dao = postDAO.getInstance();
		
		postDTO dto = new postDTO();
		
		dto = dao.viewPost(id);
		
		request.setAttribute("dto", dto);
		
	}
	

}
