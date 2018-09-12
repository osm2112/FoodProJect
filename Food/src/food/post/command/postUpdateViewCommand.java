package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class postUpdateViewCommand implements postCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String post_id = (String)request.getParameter("post_id");
		
		postDAO dao = postDAO.getInstance();
		
		postDTO dto = dao.viewPost(post_id);
		
		request.setAttribute("dto", dto);
		
	}
	
	

}
