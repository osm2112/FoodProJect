package food.reply.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class postController
 */
@WebServlet("*.rp")
public class replyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		String viewPage = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(com);
		
		if(com.equals("/replyInput.rp")) {
			
			replyDTO dto = new replyDTO();
			
			dto.setWrite_id((String)request.getParameter("write_id"));
			dto.setRe_content((String)request.getParameter("re_content"));
			dto.setPost_id((String)request.getParameter("post_id"));
			
			replyDAO dao = replyDAO.getInstance();
			dao.replyInput(dto);
			
			dto = dao.replyOne(dto.getPost_id());
			
			out.print("{\"reply_id\": " + dto.getReply_id() + ",");
			out.print("\"write_id\":\"" + dto.getWrite_id() + "\",");
			out.print("\"re_date\": \"" + dto.getRe_date() + "\",");
			out.print("\"re_content\": \"" + dto.getRe_content() + "\"}");
			
			return;
			
		}else if(com.equals("/rrInput.rp")) {
			replyDTO dto = new replyDTO();
			
			dto.setWrite_id((String)request.getParameter("write_id"));
			dto.setRe_content((String)request.getParameter("re_content"));
			dto.setReply_id((String)request.getParameter("reply_id"));
			dto.setPost_id((String)request.getParameter("post_id"));
			
			System.out.println(dto.getReply_id());
			replyDAO dao = replyDAO.getInstance();
			
			dao.rrInput(dto);
			
			dto = dao.rrOne(dto.getReply_id());
			
			out.print("{\"reply_id\": " + dto.getReply_id() + ",");
			out.print("\"write_id\":\"" + dto.getWrite_id() + "\",");
			out.print("\"re_date\": \"" + dto.getRe_date() + "\",");
			out.print("\"re_content\": \"" + dto.getRe_content() + "\"}");
			
			return;
		}else if(com.equals("/replyList.rp")) {
			replyDAO rdao = replyDAO.getInstance();
			String post_id = (String)request.getParameter("post_id");
			System.out.println("replyList post_id :" + post_id);
			List<replyDTO> list = rdao.replyList(post_id);
			out.print(JSONArray.fromObject(list).toString());
			return;
		}else if(com.equals("/rrList.rp")) {
			replyDAO rdao = replyDAO.getInstance();
			String reply_id = (String)request.getParameter("reply_id");
			System.out.println("rrList reply_id:" + reply_id);
			List<replyDTO> list = rdao.rrList(reply_id);
			out.print(JSONArray.fromObject(list).toString());
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/post/" + viewPage);
		dispatcher.forward(request, response);
	}


}
