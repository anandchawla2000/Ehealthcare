package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Databse.DB;
import beans.appoint;

/**
 * Servlet implementation class Appoint
 */
@WebServlet("/Appoint")
public class Appoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String timeanddate = request.getParameter("birthdaytime");
        int patientid = Integer.parseInt(request.getParameter("number"));
        int doctorid =Integer.parseInt(request.getParameter("docid"));
        String[] words=timeanddate.split("T");
        String date = words[0]; 
        String time = words[1]; 
        String disease = new DB().disease(patientid);
        appoint app = new appoint();
        app.setDoctorid(doctorid);
        app.setPatientid(patientid);
        app.setDate(date);
        app.setTime(time);
        app.setDisease(disease);
        new DB().appoint(app);
        new DB().status(patientid);
        response.getWriter().println("Patient Schedule Successful");
	}



}
