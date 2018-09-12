package food.blog.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.blog.ex.blogDAO;

public class blogApiListCommand implements blogCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String keyword = (String)request.getParameter("keyword");
		
		String start = (String)request.getParameter("start");
		
		System.out.println(start);
		
		int s = 5;
		
		if(start != null)
			s += Integer.parseInt(start);
				
		
		blogDAO dao = new blogDAO();
		
		String result = dao.Api(keyword,s);
		
		request.setAttribute("result", result);
		
	}

}
