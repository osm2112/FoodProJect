package food.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.eval.ex.evalDTO;
import food.store.ex.regStoreDTO;
import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class storeSearchViewCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String storeid = (String)request.getParameter("storeid");
		
		storeDAO dao = storeDAO.getInstance();
		
		storeDTO dto = dao.storeSearchView(storeid);
		request.setAttribute("dto", dto);
	
	}
}
