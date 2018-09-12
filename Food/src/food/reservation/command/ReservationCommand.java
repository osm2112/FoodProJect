package food.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ReservationCommand {
	void execute(HttpServletRequest req, HttpServletResponse resp);
}
