package food.member.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.member.command.memberCommand;
import food.member.command.memberInfoCommand;
import food.member.command.memberJoinCommand;


@WebServlet("*.mb")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public memberController() {
        super();
    } 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		memberCommand mc = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println(com);
		if(com.equals("/memberJoin.mb")) {
			mc = new memberJoinCommand();
			mc.execute(request, response);
			viewPage = "/member/joinOk.jsp";
		}else if(com.equals("/main.mb")) {
			viewPage = "main.jsp";
		}else if(com.equals("/memberInfo.mb")) {
			mc = new memberInfoCommand();
			mc.execute(request, response);
			viewPage = "/member/memberInfo.jsp";
		}else if(com.equals("/memberM.mb")) {
			mc = new memberInfoCommand();
			mc.execute(request, response);
			viewPage = "/member/updateMember.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
