<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Databse.*" %>
<%@page import="beans.*" %>
<%-- <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%int n=(int)session.getAttribute("ID"); 
ArrayList list = new DB().appointlist(n);
%>
<table class="table table-striped">
<tr>
    <th>Name</th>
    <th>disease</th>
    <th>Date</th>
    <th>Time</th>
    <th>Bill</th>
  </tr>
<% for(int i=0;i<list.size();i++)
{ %>
  <% appoint det = (appoint)list.get(i); int id=det.getPatientid(); %>
      <tr>
     <td><%= det.getName()%></td>
     <td><%= det.getDisease()%></td>
     <td><%= det.getTime()%></td>
     <td><%= det.getDate()%></td>
          <td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary" onclick="setid('<%=id%>')" data-toggle="modal" data-target="#exampleModal">
  Bills
</button>
</td>
 </tr>
<% } %>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bills</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Bill">
      <div class="modal-body">
        Medicines:
         <input type="text" id="birthdaytime" name="med"><br>
         Bill amount:
         <input type="text" id="amt" name="amount"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
        <input type="hidden" name="number" id="patientid"/>
      </div>
      </form>
    </div>
  </div>
</div>
<script>
function setid(id)
{  
	document.getElementById("patientid").value=id;
}
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html> --%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Appointment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>Welcome Doctor</span></div>
                </a>
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="Doctor.jsp"><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="ChatBoxdoc.jsp">Chat Box</a></li>
                    <li class="nav-item"><a class="nav-link" href="patientlist.jsp"><span>Patient List</span></a></li>
                    <li class="nav-item"><a class="nav-link  active" href="appointmentdoc.jsp"><span>Appointments</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="pbilldoc.jsp"><span>Pending bill</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="psucdoc.jsp"><span>Success bill</span></a></li>
                   <li class="nav-item"><a class="nav-link" href="Logout.jsp">Log out</a></li>
                </ul>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Appointment</h3>
                    </div>
                    <div class="row">
 <%int n=(int)session.getAttribute("ID"); 
ArrayList list = new DB().appointlist(n);
%>
<table class="table table-striped">
<tr>
    <th>Name</th>
    <th>disease</th>
    <th>Date</th>
    <th>Time</th>
    <th>Bill</th>
  </tr>
<% for(int i=0;i<list.size();i++)
{ %>
  <% appoint det = (appoint)list.get(i); int id=det.getPatientid(); %>
      <tr>
     <td><%= det.getName()%></td>
     <td><%= det.getDisease()%></td>
     <td><%= det.getTime()%></td>
     <td><%= det.getDate()%></td>
          <td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary" onclick="setid('<%=id%>')" data-toggle="modal" data-target="#exampleModal">
  Bills
</button>
</td>
 </tr>
<% } %>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bills</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
      <div class="modal-body">
        Medicines:
         <input type="text" id="birthdaytime" name="med"><br>
         Bill amount:
         <input type="text" id="amt" name="amount"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="bill">Submit</button>
        <input type="hidden" name="number" id="patientid"/>
      </div>
      </form>
    </div>
  </div>
</div>                   
</div>
                </div>
            </div>
        </div>
    </div>
 <script>
function setid(id)
{  
	document.getElementById("patientid").value=id;
	
}
$(document).ready(function(){
	  $("#bill").click(function()
			  { 
		  var amt = document.getElementById("amt").value;
		  var id=$('input:hidden[name=number]').val();
		  var med = document.getElementById("birthdaytime").value;
		  var request = $.ajax({
				  url: "/Ehealthcare_Final/Bill",
				  type: "GET",
				  data: {amount:amt,med:med,number:id},
				  success: function(data)
				  {   
					 alert(data);
					 window.location.href = 'appointmentdoc.jsp';
				  }
				});
	  
	  });
	});
</script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="assets/js/theme.js"></script>
</body>
</html>