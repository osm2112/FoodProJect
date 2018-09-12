package food.eval.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.eval.ex.evalDAO;
import food.eval.ex.evalDTO;

public class evalInputCommand implements evalCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
			evalDTO dto = new evalDTO();
			
			dto.setStore_id((String)request.getParameter("store_id"));
			dto.setWrite_id((String)request.getParameter("write_id"));
			System.out.println(dto.getWrite_id());
			dto.setTotal(Integer.parseInt((String)request.getParameter("total")));
			dto.setTasty(Integer.parseInt((String)request.getParameter("tasty")));
			dto.setPrice(Integer.parseInt((String)request.getParameter("price")));
			dto.setService(Integer.parseInt((String)request.getParameter("service")));
			dto.setEval_content((String)request.getParameter("content"));
			
			dto.setFilename1((String)request.getParameter("fileName1"));
			dto.setFilename2((String)request.getParameter("fileName2"));
			dto.setFilename3((String)request.getParameter("fileName3"));
			
			evalDAO dao = evalDAO.getInstance();
			
			String check = dao.evalInput(dto);
			
		
			request.setAttribute("check", check);
			request.setAttribute("storeid",dto.getStore_id());
			
	}
	
	
		
}
