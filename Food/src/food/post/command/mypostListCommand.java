package food.post.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class mypostListCommand implements postCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = (String)request.getParameter("write_id");
		String pageNum = (String)request.getParameter("pageNum");
		
		postDAO dao = postDAO.getInstance();
		
		List<postDTO> list = dao.mypostList(id,pageNum);
		String totalCount = dao.CountList(id);
		
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
		
	}

}
