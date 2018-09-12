package food.eval.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class evalInputViewCommand implements evalCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String code = (String)request.getParameter("storeid");
		System.out.println("evalInput code:"+code);
		storeDAO dao = storeDAO.getInstance();
		storeDTO dto = dao.evalStoreView(code);
	
		request.setAttribute("dto", dto);
	}
  
}  
