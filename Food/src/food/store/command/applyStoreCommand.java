package food.store.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class applyStoreCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		storeDTO dto = new storeDTO();
		storeDAO dao = new storeDAO();
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			dto.setId((String)request.getParameter("id"));
			dto.setName((String)request.getParameter("name"));
			dto.setStorename((String)request.getParameter("storename"));
			dto.setCategory((String)request.getParameter("category"));
			dto.setStoreaddrnum((String)request.getParameter("storeaddrnum"));
			dto.setStoreaddr((String)request.getParameter("storeaddr"));
			dto.setStoreaddrdetail((String)request.getParameter("storeaddrdetail"));
			dto.setStoretel1((String)request.getParameter("storetel1"));
			dto.setStoretel2((String)request.getParameter("storetel2"));
			dto.setStoretel3((String)request.getParameter("storetel3"));
			
			String check = dao.applyStore(dto);
			
			request.setAttribute("check", check);

		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}