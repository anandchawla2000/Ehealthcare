<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%int n=(int)session.getAttribute("ID"); 
String name= (String)session.getAttribute("name");
%>
<a href="#">Chat Box</a><br>
<a href="patientlist.jsp">Show Patients</a><br>
<a href="appointmentdoc.jsp">Appointment</a><br>
<a href="pbilldoc.jsp">Pending Bill</a><br>
<a href="psucdoc.jsp">payment success</a><br>
</body>
</html> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile</title>
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
                    
                    <div class="sidebar-brand-text mx-3"><span>Welcome Doctor</span></div>
                </a>
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="Doctor.jsp"><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="ChatBoxdoc.jsp"><span>Chat Box</span></a></li>
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
                    <h3 class="text-dark mb-4">Profile</h3>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="assets/img/dogs/image2.jpg" width="160" height="160">
                                    <div class="mb-3"></div>
                                </div>
                            </div>
                            <div class="card shadow mb-4"></div>
                        </div>
                        <div class="col-lg-8">
                               <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 font-weight-bold">Personal Details</p>
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="email"><strong>Email Address</strong></label><input class="form-control" type="email" placeholder="user@example.com" name="email" id="email" disabled></div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="first_name"><strong>Name</strong></label><input class="form-control" type="text" placeholder="John" name="first_name" id="Name" disabled></div>
                                                    </div>
                                                </div>
                                                <!-- <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Save Settings</button></div> -->
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card shadow">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 font-weight-bold">Contact Details</p>
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <div class="form-group"><label for="address"><strong>Address</strong></label><input class="form-control" type="text" placeholder="Sunset Blvd, 38" name="address" id="add" disabled></div>
                                                <!-- <div class="form-group"><button class="btn btn-primary btn-sm" type="submit">Save&nbsp;Settings</button></div> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-5"></div>
                </div>
            </div>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
    <%int n=(int)session.getAttribute("ID"); 
      String name= (String)session.getAttribute("name");
   %>
   <script>
    var id = <%=n%>;
	var request = $.ajax({
		  url: "/Ehealthcare_Final/detail",
		  type: "GET",
		  data: {id:id},
		  success: function(data)
		  {    var det = JSON.parse(data);
			 //alert(det.details[0]);
			 document.getElementById("Name").value=det.details[0];
			 document.getElementById("email").value=det.details[1];
			 document.getElementById("add").value=det.details[2];
		  }
		});
   </script>
</body>
</html>