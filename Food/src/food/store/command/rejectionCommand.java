package food.store.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class rejectionCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		storeDTO dto = new storeDTO();
		storeDAO dao = new storeDAO();
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			dto.setPermit((String)request.getParameter("permit"));
			dto.setCount((String)request.getParameter("count"));
			dao.rejection(dto);
			
			String check = dao.rejection(dto);
			
			request.setAttribute("permit", dto.getPermit());
			request.setAttribute("check", check);
			
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
}
