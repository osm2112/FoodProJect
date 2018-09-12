package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.blog.ex.blogDAO;
import food.post.ex.postDAO;

public class postLikeCommand implements postCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String post_id = (String)request.getParameter("post_id");
		String write_id = (String)request.getParameter("write_id");
			
		postDAO dao = postDAO.getInstance();
		
		String like = dao.postLike(post_id,write_id);  
		
		request.setAttribute("like", like);
		
	}

}
