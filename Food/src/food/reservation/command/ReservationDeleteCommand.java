package food.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import food.reservation.dao.ReservationDAO;

public class ReservationDeleteCommand implements ReservationCommand {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String userId 			= "osm2112"; //req.getSession().getAttribute("");
		String reservationId 	= req.getParameter("reservationId").toString();
		ReservationDAO dao = new ReservationDAO(); 
		int msg = dao.DeleteReservation(reservationId, userId);
		req.setAttribute("msg", msg);
	}

}
