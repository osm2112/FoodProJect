package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;

public class postCommendCommand implements postCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String post_id = (String)request.getParameter("post_id");
		String write_id = (String)request.getParameter("write_id");
			
		postDAO dao = postDAO.getInstance();
		
		String commend = dao.postCommend(post_id,write_id);  
		
		request.setAttribute("commend", commend);
		
	}
	
	

}
