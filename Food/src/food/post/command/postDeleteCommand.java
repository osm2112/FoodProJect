package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;

public class postDeleteCommand implements postCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String post_id = (String)request.getParameter("post_id");
		
		postDAO dao = postDAO.getInstance();
		
		String check = dao.deletePost(post_id);
		
		
		request.setAttribute("check", check);
		
	}
	
	

}
