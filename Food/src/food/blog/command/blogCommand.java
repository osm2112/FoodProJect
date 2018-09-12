package food.blog.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface blogCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
