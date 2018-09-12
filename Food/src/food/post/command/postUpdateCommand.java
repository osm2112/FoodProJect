package food.post.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.ex.postDAO;
import food.post.ex.postDTO;

public class postUpdateCommand implements postCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");

			postDTO dto = new postDTO();

			dto.setPost_id((String) request.getParameter("post_id"));
			dto.setPost_title((String) request.getParameter("title"));
			dto.setPost_sub((String) request.getParameter("subtitle"));
			dto.setMain_img((String) request.getParameter("mainImg"));
			System.out.println(dto.getMain_img());
			dto.setPost_content((String) request.getParameter("content"));

			postDAO dao = postDAO.getInstance();

			String check = dao.updatePost(dto);

			request.setAttribute("check", check);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
