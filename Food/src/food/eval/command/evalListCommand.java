package food.eval.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.eval.ex.evalDAO;
import food.eval.ex.evalDTO;

public class evalListCommand implements evalCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String store_id = (String)request.getParameter("store_id");
		
		System.out.println("store:"+store_id);
	
		evalDAO edao = evalDAO.getInstance();
		evalDTO edto = edao.evalAVG(store_id);
	
		request.setAttribute("edto", edto);
	}

}
