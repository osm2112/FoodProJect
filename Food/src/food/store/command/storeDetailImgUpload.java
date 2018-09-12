package food.store.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class BoardFileUpload ?��?�� ?��미�? ?��블릿
 */
@WebServlet("/storeDetailImgUpload")
@MultipartConfig(location = "c:/tmp", maxFileSize = 1024000L, maxRequestSize = -1, fileSizeThreshold = 1024)
public class storeDetailImgUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public storeDetailImgUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<Part> parts = request.getParts();
		String filename = "";
		String filepath = request.getServletContext().getRealPath("/upload"); // 경로
		System.out.println(filepath);
		for (Part part : parts) {
			filename = part.getSubmittedFileName();
			System.out.println("filename: " + part.getSubmittedFileName());
			System.out.println("filesize: " + part.getSize());
			System.out.println("parameter name: " + part.getName());
			part.write(filepath + "/" + part.getSubmittedFileName()); // 경로/?��?���??
		}
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("opener.insertImg('" + filename +"');");//+opener.form.fileName.value= '" + filename + "';");
		out.println("window.close();");
		out.println("</script>");
	}

}
