package food.store.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class applyListCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		storeDAO dao = new storeDAO();
		List<storeDTO> list = new ArrayList<storeDTO>();

		String pageNum = (String)request.getParameter("pageNum");

		list = dao.applyList(pageNum);
		String totalCount = dao.CountList();
		
		request.setAttribute("applyList", list);
		request.setAttribute("totalCount", totalCount);
		
	}

}
