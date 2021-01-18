package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Databse.DB;
import beans.Doctor;
import beans.Patient;
@WebServlet(name="Signup",
urlPatterns= {"/Signup"}
)
public class Signup extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Doctor doc = new Doctor();
    Patient pat = new Patient();
	String signup= request.getParameter("signup");
  if(signup.equals("Doctor")) 
  {   
	  String name= request.getParameter("name");
      String email= request.getParameter("email");
      String password = request.getParameter("password");
      String phone= request.getParameter("phone");
      String spec= request.getParameter("spec");
      String Address= request.getParameter("add");
      doc.setName(name);
      doc.setEmail(email);
      doc.setPassword(password);
      doc.setPhone(phone);
      doc.setSpecialist(spec);
      doc.setAddress(Address);
     new DB().signupdoc(doc);
     response.getWriter().println("Successful register");
  }
  else 
  {   
	  String name= request.getParameter("name");
      String email= request.getParameter("email");
      String password = request.getParameter("password");
      String phone= request.getParameter("phone");
      String info= request.getParameter("info");
      String disease= request.getParameter("disease");
      pat.setName(name);
      pat.setEmail(email);
      pat.setPassword(password);
      pat.setPhone(phone);
      pat.setInfo(info);
      pat.setDisease(disease);
      new DB().signuppat(pat); 
      response.getWriter().println("Successful recorded");
}
}

}
