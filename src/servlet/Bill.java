package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Databse.DB;
import beans.appoint;
@WebServlet("/Bill")
public class Bill extends HttpServlet 
{
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
     int Bill= Integer.parseInt(request.getParameter("amount"));
	 String  medi = request.getParameter("med");
	 int patid= Integer.parseInt(request.getParameter("number"));
	 appoint app = new appoint();
	 app.setBill(Bill);
	 app.setMedicines(medi);
	 app.setPatientid(patid);
	 new DB().updateappoint(app);
	 response.getWriter().println("Successfully Done");
	}
}
