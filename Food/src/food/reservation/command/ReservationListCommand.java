package food.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import food.reservation.dao.ReservationDAO;
import food.reservation.dto.ReservationDTO;


public class ReservationListCommand implements ReservationCommand {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String userId = req.getSession().getAttribute("id").toString();
		System.out.println(userId);
		ReservationDAO dao = new ReservationDAO();
		List<ReservationDTO> reservationList = new ArrayList<>();
		int page = 1;
		int limit = 5;
		System.out.println(req.getParameter("page"));
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		System.out.println(page);
		int listcount = dao.GetReservationListCount(userId);
		System.out.println("listcount=" + listcount);
		reservationList = dao.GetReservationList(userId, page, limit); 
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		req.setAttribute("page", page); // 현재 페이지 수.
		req.setAttribute("maxpage", maxpage); // 최대 페이지 수.
		req.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수.
		req.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수.
		req.setAttribute("listcount", listcount); // 글 수.
		req.setAttribute("reservationList", reservationList);
	}
}
