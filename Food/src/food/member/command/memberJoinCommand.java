package food.member.command;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.member.ex.memberDAO;
import food.member.ex.memberDTO;

public class memberJoinCommand implements memberCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		memberDTO dto = new memberDTO();
		memberDAO dao = new memberDAO();
		
		try {
			request.setCharacterEncoding("UTF-8");
				
			dto.setId((String)request.getParameter("id"));
			dto.setPwd((String)request.getParameter("pwd"));
			dto.setName((String)request.getParameter("name"));
			dto.setGender((String)request.getParameter("gender"));
			dto.setBirthday((String)request.getParameter("bday"));
			dto.setEmail((String)request.getParameter("email"));
			dto.setTel1((String)request.getParameter("tel1"));
			dto.setTel2((String)request.getParameter("tel2"));
			dto.setTel3((String)request.getParameter("tel3"));
			dto.setAddr((String)request.getParameter("addr"));
			dto.setAddrnum((String)request.getParameter("addrnum"));
			dto.setAddrdetail((String)request.getParameter("addrdetail"));
			dto.setUserState((String)request.getParameter("user"));
			
			String joinOk = dao.insertMember(dto);
			
			request.setAttribute("joinOk", joinOk);
			
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
	}
	
	

}
