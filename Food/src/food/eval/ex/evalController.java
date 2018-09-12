package food.eval.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.eval.command.evalCommand;
import food.eval.command.evalInputCommand;
import food.eval.command.evalInputViewCommand;
import food.eval.command.evalListCommand;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class replyController
 */
@WebServlet("*.ev")
public class evalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public evalController() {
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
		evalCommand ev = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(com);
		
		if(com.equals("/evalInput.ev")) {
			ev = new evalInputCommand();
			ev.execute(request, response);
			viewPage = "upsertDCheck.jsp";
		}else if(com.equals("/evalList.ev")) {
			ev = new evalListCommand();
			ev.execute(request, response);
			viewPage = "evalList.jsp";
		}else if(com.equals("/evalListDO.ev")) {
			evalDAO edao = evalDAO.getInstance();
			String store_id = (String)request.getParameter("store_id");
			System.out.println(store_id);
			List<evalDTO> list = edao.evalList(store_id);
			out.print(JSONArray.fromObject(list).toString());
			return;
		}else if(com.equals("/evalInputView.ev")) {
			ev = new evalInputViewCommand();
			ev.execute(request, response);
			viewPage = "evalInput.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/eval/" + viewPage);
		dispatcher.forward(request, response);
	}


}
