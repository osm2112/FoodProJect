package food.post.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class postListCommand implements postCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String order = (String)request.getParameter("order");
		
		System.out.println(order);
		
		postDAO dao = new postDAO();
		
		List<postDTO> list = dao.postList(order);
		
		
		request.setAttribute("list", list);
		
	}

}
