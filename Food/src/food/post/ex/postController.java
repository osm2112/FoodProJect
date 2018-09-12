package food.post.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.post.command.mypostListCommand;
import food.post.command.postCommand;
import food.post.command.postCommendCommand;
import food.post.command.postDeleteCommand;
import food.post.command.postInputCommand;
import food.post.command.postLikeCommand;
import food.post.command.postListCommand;
import food.post.command.postUpdateCommand;
import food.post.command.postUpdateViewCommand;
import food.post.command.postViewCommand;


/**
 * Servlet implementation class postController
 */
@WebServlet("*.po")
public class postController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postController() {
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
		postCommand pc = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(com);
		
		if(com.equals("/postInput.po")) {
			pc = new postInputCommand();
			pc.execute(request, response);
			viewPage = "upsertDCheck.jsp";
		}else if(com.equals("/postList.po")) {
			pc = new postListCommand();
			pc.execute(request, response);
			viewPage = "postList.jsp";
		}else if(com.equals("/postView.po")) {
			pc = new postViewCommand();
			pc.execute(request, response);
			viewPage ="postView.jsp";
		}else if(com.equals("/MyPostList.po")) {
			pc = new mypostListCommand();
			pc.execute(request, response);
			viewPage = "mypostList.jsp";
		}else if(com.equals("/postUpdate.po")) {
			pc = new postUpdateCommand();
			pc.execute(request, response);
			viewPage = "upsertDCheck.jsp";
		}else if(com.equals("/postUpdateView.po")) {
			pc = new postUpdateViewCommand();
			pc.execute(request, response);
			viewPage = "postUpdate.jsp";
		}else if(com.equals("/postDelete.po")) {
			pc = new postDeleteCommand();
			pc.execute(request, response);
			viewPage = "upsertDCheck.jsp";
		}else if(com.equals("/postLike.po")) {  
			pc = new postLikeCommand();
			pc.execute(request, response);
			String like = (String)request.getAttribute("like");
			out.print("{\"like\":" + like + "}");
			return;  
		}else if(com.equals("/postCommend.po")) {
			pc = new postCommendCommand();
			pc.execute(request, response);
			String commend = (String)request.getAttribute("commend");
			out.print("{\"commend\":" + commend + "}");
			return;  
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/post/" + viewPage);
		dispatcher.forward(request, response);
	}


}
