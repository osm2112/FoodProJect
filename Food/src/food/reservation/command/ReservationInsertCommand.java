package food.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.reservation.dao.ReservationDAO;
import food.reservation.dto.ReservationDTO;

public class ReservationInsertCommand implements ReservationCommand{
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String userId 			= (String) req.getSession().getAttribute("id");
		String reserseStoreId 	= req.getParameter("reserseStoreId");
		String reserveName 		= req.getParameter("reserveName");
		String reserveDate 		= req.getParameter("reserveDate");
		String reserveTime 		= req.getParameter("reserveTime");
		String reserveSeat 		= req.getParameter("reserveSeat");
		String reserveTel 		= req.getParameter("reserveTel");
		String reserveEmail 	= req.getParameter("reserveEmail");
		String reserveComment   = req.getParameter("reserveComment");
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = new ReservationDTO(); 
		String reservationId = dao.InsertReservation( userId, reserseStoreId, reserveName, reserveDate, reserveTime, 
	     			           reserveSeat, reserveTel, reserveEmail, reserveComment );
		dto = dao.SelectReserveDetail(reservationId, userId);
		req.setAttribute("ReserveConfirm", dto);
	}
}
