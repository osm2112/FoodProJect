package food.reservation.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import javax.servlet.http.HttpSession;
import food.reservation.command.ReservationCommand;
import food.reservation.command.ReservationDeleteCommand;
import food.reservation.command.ReservationDetailCommand;
import food.reservation.command.ReservationInsertCommand;
import food.reservation.command.ReservationListCommand;
import food.reservation.command.ReservationStoreLIstCommand;
import food.reservation.dto.ReservationDTO;

@WebServlet("*.re")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	@SuppressWarnings("deprecation")
	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String viewPage = null;
		ReservationCommand command = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		if (com.equals("/ReservationForm.re")) {

			viewPage = "/reservation/view/ReservationForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationSeatCheckProc.re")) {

			viewPage = "/reservation/proc/ReservationSeatCheckProc.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationCalendar.re")) {

			viewPage = "/reservation/view/ReservationCalendar.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationListForm.re")) {

			viewPage = "/reservation/view/ReservationListForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationConfirmForm.re")) {

			viewPage = "/reservation/view/ReservationConfirmForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationCalendarProc.re")) {

			viewPage = "/reservation/proc/ReservationCalendarProc.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationDetailForm.re")) {

			viewPage = "/reservation/view/ReservatonDetailForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservatonStoreListForm.re")) {

			viewPage = "/reservation/view/ReservatonStoreListForm.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationInsert.re")) {

			command = new ReservationInsertCommand();
			command.execute(request, response);
			ReservationDTO dto = (ReservationDTO) request.getAttribute("ReserveConfirm");
			String reservationId = URLEncoder.encode(dto.getReservationId());
			String storeName = URLEncoder.encode(dto.getStoreName());
			String storeAddr = URLEncoder.encode(dto.getStoreAddr());
			String reserveName = URLEncoder.encode(dto.getReserveName());
			String reserveDate = URLEncoder.encode(dto.getReserveDate());
			String reserveTime = URLEncoder.encode(dto.getReserveTime());
			String reserveSeat = URLEncoder.encode(dto.getReserveSeat());
			String reserveTel = URLEncoder.encode(dto.getReserveTel());
			String reserveEmail = URLEncoder.encode(dto.getReserveEmail());
			String reserveComment = URLEncoder.encode(dto.getReserveComment());
			viewPage = "ReservationConfirmForm.re?reservationId=" + reservationId + "&storeName=" + storeName
					+ "&storeAddr=" + storeAddr + "&reserveName=" + reserveName + "&reserveDate=" + reserveDate
					+ "&reserveTime=" + reserveTime + "&reserveSeat=" + reserveSeat + "&reserveTel=" + reserveTel
					+ "&reserveEmail=" + reserveEmail + "&reserveComment=" + reserveComment;
			response.sendRedirect(viewPage);

		} else if (com.equals("/ReservationList.re")) {

			command = new ReservationListCommand();
			command.execute(request, response);
			viewPage = "ReservationListForm.re";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationDetail.re")) {

			command = new ReservationDetailCommand();
			command.execute(request, response);
			viewPage = "ReservationDetailForm.re";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);

		} else if (com.equals("/ReservationDelete.re")) {

			String page = request.getParameter("page");
			command = new ReservationDeleteCommand();
			command.execute(request, response);
			viewPage = "ReservationList.re?page=" + page;
			response.sendRedirect(viewPage);

		} else if (com.equals("/ReservatonStoreList.re")) {
			command = new ReservationStoreLIstCommand();
			command.execute(request, response);
			viewPage = "ReservatonStoreListForm.re";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);    
 		}
		
	}
}
