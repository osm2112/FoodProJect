package food.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.regStoreDTO;
import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class updateStoreViewCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String storeid = (String)request.getParameter("id");
		String rsstoreid = (String)request.getParameter("id");
		
		storeDAO dao = storeDAO.getInstance();
		
		storeDTO dto = dao.updateStoreView(storeid);
		regStoreDTO dto1 = dao.updateStoreView2(rsstoreid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto1", dto1);
	
	}
	
}
