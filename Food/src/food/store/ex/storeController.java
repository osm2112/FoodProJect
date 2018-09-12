package food.store.ex;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.store.command.applyListCommand;
import food.store.command.applyStoreCommand;
import food.store.command.manageStoreCommand;
import food.store.command.permissionCommand;
import food.store.command.rejectionCommand;
import food.store.command.storeCommand;
import food.store.command.updateStoreCommand;
import food.store.command.updateStoreViewCommand;
import food.store.command.storeInfoViewCommand;

/**
 * Servlet implementation class storeController
 */
@WebServlet("*.sto")
public class storeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public storeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;	
		storeCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println(com);
		
		if(com.equals("/applyList.sto")) {
			command = new applyListCommand();
			command.execute(request, response);
			viewPage = "/store/applyList.jsp";
		} else if(com.equals("/applyStore.sto")) {
			command = new applyStoreCommand();
			command.execute(request, response);
			viewPage = "/store/applyOk.jsp";			
		} else if(com.equals("/permission.sto")) {
			command = new permissionCommand();
			command.execute(request, response);
			viewPage = "/store/permissionOk.jsp";
		} else if(com.equals("/rejection.sto")) {
			command = new rejectionCommand();
			command.execute(request, response);
			viewPage = "/store/rejectionOk.jsp";
		} else if(com.equals("/manageStore.sto")) {
			command = new manageStoreCommand();
			command.execute(request, response);
			viewPage = "/store/manageStore.jsp";
		} else if(com.equals("/updateStore.sto")) {
			command = new updateStoreCommand();
			command.execute(request, response);
			viewPage = "/store/updateStoreOk.jsp";
		} else if(com.equals("/updateStoreView.sto")) {
			command = new updateStoreViewCommand();
			command.execute(request, response);
			viewPage = "/store/updateStore.jsp";
		} else if(com.equals("/storeInfoView.sto")) {
			command = new storeInfoViewCommand();
			command.execute(request, response);
			viewPage = "/store/storeInfoView.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
