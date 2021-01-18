<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Databse.*" %>
<%@page import="beans.*" %>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
<%int n=(int)session.getAttribute("ID");String name= (String)session.getAttribute("name"); %>
<% ArrayList<Doctor> doclist = new DB().chatdoclist(); %>
<table class="table table-striped">
<tr>
<th>Doctor Name</th>
<th>specialist</th>
<th>Chat</th>
</tr>
<%for(int i=0;i<doclist.size();i++) 
{%>    
<%  Doctor doc = (Doctor)doclist.get(i);

%>
<tr>
<%doc.getId();%>
<td><%=doc.getName() %></td>
<td><%=doc.getSpecialist()%></td>
<td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary" onclick="setid('<%= doc.getId()%>')" data-toggle="modal" data-target="#exampleModal">
  Chat
</button>
</td>
</tr>
<%}
%>
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
<input type="hidden" name="number" id="doctorid"/>
<input type="hidden" name="patid" value=""+n+""/>
 </div>
</form>
 </div>
</div>
</div>
<script>
function setid(id)
{   
	var docid=id;
	document.getElementById("doctorid").value=id;
	var patid=<%=n%>;
	var request = $.ajax({
	  url: "/Ehealthcare_Final/ChatHistory",
	  type: "GET",
	  data: {ID : patid,number:id},
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
			  var patid=<%=n%>;
			  var docid=$('input:hidden[name=number]').val();
			  var msg= $('input:text[name=msg]').val();
			var request = $.ajax({
					  url: "/Ehealthcare_Final/Chatbox",
					  type: "GET",
					  data: {ID : patid,number:docid,msg:msg},
					  success: function(data)
					  {   
						 alert(data);
					  }
					});
		  
		  });
		});

}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Chat Box</title>
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
                    <div class="sidebar-brand-text mx-3"><span>Welcome Patient</span></div>
                </a>
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="Patient.jsp"><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link active" href="chatbox.jsp"><span>Chat Box</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="reappointmentpat.jsp"><span>Re-appointment</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="appointmentpat.jsp"><span>Appointments</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="pbillpat.jsp"><span>Pending Bill</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="psucpat.jsp"><span>Success Bill</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout.jsp">Log out</a></li>
               </ul>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Chat Box</h3>
                    </div>
                    <div class="row">
                     <%int n=(int)session.getAttribute("ID");String name= (String)session.getAttribute("name"); %>
<% ArrayList<Doctor> doclist = new DB().chatdoclist(); %>
<table class="table table-striped">
<tr>
<th>Doctor Name</th>
<th>specialist</th>
<th>Chat</th>
</tr>
<%for(int i=0;i<doclist.size();i++) 
{%>    
<%  Doctor doc = (Doctor)doclist.get(i);

%>
<tr>
<%doc.getId();%>
<td><%=doc.getName() %></td>
<td><%=doc.getSpecialist()%></td>
<td><!-- Button trigger modal -->
<button type="button" class="btn btn-primary" onclick="setid('<%= doc.getId()%>')" data-toggle="modal" data-target="#exampleModal">
  Chat
</button>
</td>
</tr>
<%}
%>
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
<input type="hidden" name="number" id="doctorid"/>
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
	var docid=id;
	document.getElementById("doctorid").value=id;
	var patid=<%=n%>;
	var request = $.ajax({
	  url: "/Ehealthcare_Final/ChatHistory",
	  type: "GET",
	  data: {ID : patid,number:id},
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
			  var patid=<%=n%>;
			  var docid=$('input:hidden[name=number]').val();
			  var msg= $('input:text[name=msg]').val();
			var request = $.ajax({
					  url: "/Ehealthcare_Final/Chatbox",
					  type: "GET",
					  data: {ID : patid,number:docid,msg:msg},
					  success: function(data)
					  {   
						 alert(data);
					  }
					});
		  
		  });
		});

}
</script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
</html>