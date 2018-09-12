package food.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.reservation.dao.ReservationDAO;
import food.reservation.dto.ReservationDTO;

public class ReservationDetailCommand implements ReservationCommand {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String userId 			= "osm2112"; //req.getSession().getAttribute("");
		String reservationId 	= req.getParameter("reservationId").toString();
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = new ReservationDTO(); 
		dto = dao.SelectReserveDetail(reservationId, userId);
		req.setAttribute("ReservationDetail", dto);
	}

}
