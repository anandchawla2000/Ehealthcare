<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%int n=(int)session.getAttribute("ID"); %>
<form action="reappoint">
Disease:<select name='disease'>
<option>fever</option>
<option>TB</option></select><br>
Extra Information:<input type='text' name='info'><br>
<button type='submit' class='btn btn-primary'>Reappoint</button>
<input type="hidden" name="patid" value="<%=n%>"/>
</form>
</body>
</html> --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Payment</title>
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
                    <li class="nav-item"><a class="nav-link active" href="Patient.jsp"><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="chatbox.jsp"><span>Chat Box</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="reappointmentpat.jsp"><span>Re-appointment</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="appointmentpat.jsp"><span>Appointments</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="pbillpat.jsp"><span>Pending Bill</span></a></li>
                    <li class="nav-item"><a class="nav-link active" href="psucpat.jsp"><span>Success Bill</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout.jsp">Log out</a></li>
               </ul>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Success Payment Status</h3>
                    </div>
                    <div class="row">
<%int n=(int)session.getAttribute("ID"); %>
<form  name="form1">
Disease:<select name='disease'>
<option>fever</option>
<option>TB</option></select><br>
Extra Information:<input type='text' name='info'><br>
<button type="button" class='btn btn-primary' id="rep">Reappoint</button>
</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
  $(document).ready(function(){
	  $("#rep").click(function()
			  {
		  var patid=<%=n%>;
		  var dis = document.form1.disease.value;  
		  var info = document.form1.info.value;  
		  var request = $.ajax({
				  url: "/Ehealthcare_Final/reappoint",
				  type: "GET",
				  data: {pat:patid,disease:dis,info:info},
				  success: function(data)
				  {   
					 alert(data);
					 window.location.href = 'reappointmentpat.jsp';

				  }
				});
	  
	  });
	}); </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
</html>