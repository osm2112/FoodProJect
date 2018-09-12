package food.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface storeCommand {
	
	void execute(HttpServletRequest request, HttpServletResponse response);

}