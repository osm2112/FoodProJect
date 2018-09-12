package food.post.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface postCommand {
	
	void execute(HttpServletRequest request, HttpServletResponse response);

}
