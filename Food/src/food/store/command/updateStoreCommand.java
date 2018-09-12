package food.store.command;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.ex.regStoreDTO;
import food.store.ex.storeDAO;
import food.store.ex.storeDTO;

public class updateStoreCommand implements storeCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
				
		try {
			request.setCharacterEncoding("UTF-8");
			
			storeDTO dto = new storeDTO();
			regStoreDTO dto1 = new regStoreDTO();
			
			dto.setStoreid((String)request.getParameter("storeid"));
			dto.setStorename((String)request.getParameter("storename"));
			dto.setCategory((String)request.getParameter("category"));
			dto.setStoreaddrnum((String)request.getParameter("storeaddrnum"));
			dto.setStoreaddr((String)request.getParameter("storeaddr"));
			dto.setStoreaddrdetail((String)request.getParameter("storeaddrdetail"));
			dto.setStoretel1((String)request.getParameter("storetel1"));
			dto.setStoretel2((String)request.getParameter("storetel2"));
			dto.setStoretel3((String)request.getParameter("storetel3"));
			dto.setThumbnailimg((String)request.getParameter("thumbnailimg"));
			
			dto1.setRsstoreid((String)request.getParameter("rsstoreid"));
			dto1.setMenu((String)request.getParameter("menu"));
			dto1.setFilename1((String)request.getParameter("fileName1"));
			dto1.setFilename2((String)request.getParameter("fileName2"));
			dto1.setFilename3((String)request.getParameter("fileName3"));
			dto1.setFilename4((String)request.getParameter("fileName4"));
			dto1.setFilename5((String)request.getParameter("fileName5"));
		
			storeDAO dao = storeDAO.getInstance();
			
			String storeid = (String)request.getParameter("id");
			String rsstoreid = (String)request.getParameter("id");
			
			request.setAttribute("storeid", storeid);
			request.setAttribute("rsstoreid", rsstoreid);
			
			String check = dao.updateStore(dto);
			String check2 = dao.updateStore2(dto, dto1);
			
			request.setAttribute("check", check);
			request.setAttribute("check2", check2);
			
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
}
