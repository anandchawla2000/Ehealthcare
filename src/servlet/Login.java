package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import Databse.DB;
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
		String login=request.getParameter("Login");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
         JSONObject obj = new JSONObject();
         
		if(login.equalsIgnoreCase("doctor")) 
		{
		if(new DB().checklogindoc(email,pass))
	    {   int id = new DB().doclogin(email);
	        String doctor = "doctor";
			HttpSession session = request.getSession();
	         session.setAttribute("ID",id);
	         session.setAttribute("name", doctor);
		//	response.sendRedirect("Doctor.jsp");
			obj.put("action", "success");
			obj.put("value", "Doctor.jsp");
			
		}
	     else
	     {   
	    	 //response.sendRedirect("Login.jsp");
		obj.put("action", "error");
		obj.put("value", "invalid information");
	     }
		}
         else 
         {
     		if(new DB().checkloginpat(email,pass))
   	     {  int id = new DB().patlogin(email);
   	         String pat="patient";
			HttpSession session = request.getSession();
	         session.setAttribute("ID",id);
	         session.setAttribute("name", pat);
   			//response.sendRedirect("Patient.jsp");
	         obj.put("action", "success");
				obj.put("value", "Patient.jsp");
   		}
   	     else
   	     {
   	    	//response.sendRedirect("Login.jsp");
   	    	obj.put("action", "error");
   			obj.put("value", "invalid information");	 
   	     }
         }
		PrintWriter pw =
		response.getWriter();
		pw.print(obj.toString());
	}

}
