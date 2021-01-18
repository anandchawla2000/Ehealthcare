<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Databse.*" %>
<%@page import="beans.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Box</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Chat Box</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
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
                     <li class="nav-item"><a class="nav-link " href="Doctor.jsp"><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link active" href="ChatBoxdoc.jsp"><span>Chat Box</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="patientlist.jsp"><span>Patient List</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="appointmentdoc.jsp"><span>Appointments</span></a></li>
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
                        <h3 class="text-dark mb-0">Chat-Box</h3>
                    </div>
                    <div class="row">
                     <%int n=(int)session.getAttribute("ID");
                    ArrayList<Patient> List = new DB().chatpatlist(n); %>
                     <table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Disease</th>
   <th>Chat</th>
  </tr>
<% for(int i=0;i<List.size();i++)
{ %>
  <%  Patient det = (Patient)List.get(i); %>
      <tr>
      <%det.getId();%>
     <td ><%= det.getName()%></td>
     <td><%= det.getDisease() %></td>
     <td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary" onclick="setid('<%= det.getId()%>')" data-toggle="modal" data-target="#exampleModal">
  Chat
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
        <h5 class="modal-title" id="exampleModalLabel">Chats</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
      <div class="modal-body">
      <%// chats%>
<div id="Chats"></div>      
<br><br><br>
   <input type="text" name="msg">
   <button type="submit" id="but">Send</button>
<input type="hidden" name="number" id="patid"/>
<input type="hidden" name="patid" value=""+n+""/>
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
	var patid=id;
	document.getElementById("patid").value=id;
	var docid=<%=n%>;
	var request = $.ajax({
		  url: "/Ehealthcare_Final/ChatHistorydoc",
		  type: "GET",
		  data: {ID : docid,number:patid},
		  success: function(data)
		  {  
			  var msg = JSON.parse(data);  
			  $("#Chats").empty();
			  for(var i=0;i<msg.msg.length;i++)
			  {
			   document.getElementById("Chats").innerHTML += msg.msg[i].msg+"</br>";
			  }
	      }
		});
	
	$(document).ready(function(){
		  $("#but").click(function(){
			  var docid=<%=n%>;
			  var patid=$('input:hidden[name=number]').val();
			  var msg= $('input:text[name=msg]').val();
			var request = $.ajax({
					  url: "/Ehealthcare_Final/Chatboxdoc",
					  type: "GET",
					  data: {ID : docid,number:patid,msg:msg},
					  success: function(data)
					  {   
						 alert(data);
					  }
					});
		  
		  });
		});

}
</script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
</html>
</body>
</html>