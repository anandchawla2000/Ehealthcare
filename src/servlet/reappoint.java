package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Databse.DB;

/**
 * Servlet implementation class reappoint
 */
@WebServlet("/reappoint")
public class reappoint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String info = request.getParameter("info");
	 String dis = request.getParameter("disease");
	 int patid = Integer.parseInt(request.getParameter("pat"));
	 new DB().reschedule(patid,info,dis);
     response.getWriter().println("Schedule Successful");

	}

}
