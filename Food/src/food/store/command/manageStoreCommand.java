package food.store.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class manageStoreCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		storeDAO dao = new storeDAO();
		storeDTO dto = new storeDTO();

		List<storeDTO> list = new ArrayList<storeDTO>();
		
		String pageNum = (String)request.getParameter("pageNum");
		String id = (String)request.getParameter("id");
		String cnt = (String)request.getParameter("pageNum");
		
		list = dao.manageStoreList(pageNum, id);
		
		String permit = dto.getPermit();
		System.out.println("퍼밋:" + permit);
		String totalCount = dao.CountList();
		
		request.setAttribute("storeList", list);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("permit", permit);
		
	}
	
}