package food.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.regStoreDTO;
import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class storeInfoViewCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String storeid = (String)request.getParameter("storeid");
		String rsstoreid = (String)request.getParameter("storeid");
		
		storeDAO dao = storeDAO.getInstance();
		
		storeDTO dto = dao.updateStoreView(storeid);
		regStoreDTO dto1 = dao.updateStoreView2(rsstoreid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("dto1", dto1);
	
	}
	
}
