package food.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.member.ex.memberDAO;
import food.member.ex.memberDTO;

public class memberInfoCommand implements memberCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("memberInfo");
		String id = (String)request.getParameter("id");
		
		memberDAO dao = new memberDAO();
		
		memberDTO dto = dao.memberInfo(id);
		
		request.setAttribute("dto", dto);
		
		
	}

}
