<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="assets1/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans">
    <link rel="stylesheet" href="assets1/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets1/css/Advanced-NavBar---Multi-dropdown.css">
    <link rel="stylesheet" href="assets1/css/Footer-Basic-1.css">
    <link rel="stylesheet" href="assets1/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets1/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets1/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets1/css/Pretty-Registration-Form.css">
    <link rel="stylesheet" href="assets1/css/sidebar-1.css">
    <link rel="stylesheet" href="assets1/css/Sidebar-Menu-1.css">
    <link rel="stylesheet" href="assets1/css/Sidebar-Menu.css">
    <link rel="stylesheet" href="assets1/css/sidebar.css">
    <link rel="stylesheet" href="assets1/css/styles.css">
    <link rel="stylesheet" href="assets1/css/Testimonials.css">
    <link rel="stylesheet" href="assets1/css/Top--Right--Left-Navigation-by-Jigar-Mistry.css">
    <link rel="stylesheet" href="assets1/css/Vertical-Left-SideBar-by-Jigar-Mistry.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <!-- <script src="my.js"></script> -->
 </head>

<body>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean">
        <div class="container"><a class="navbar-brand" href="#" style="font-size: xx-large;">E-Health Care</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a>
                        <ul class="nav navbar-nav">
                            <li class="nav-item"></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="Signup.jsp">Sign Up</a></li>
                </ul>
        </div>
        </div>
    </nav>
    <div class="login-dark">
        <form name="form1">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group">
            <select class="bg-dark form-control" name="Login">
            <option value="12" selected="" >Select as a </option>
            <option value="doctor">Doctor</option>
            <option value="Patient">Patient</option>
            </select>
            </div>
            <div class="form-group">
            <input class="form-control" type="email" name="email" placeholder="Email">
            </div>
            <div class="form-group">
            <input class="form-control" type="password" name="pass" placeholder="Password">
            </div>
            <div class="form-group">
            <button class="btn btn-primary btn-block" type="button" id="loginbutton">Log In</button>
            </div>
            <div id="error"></div>
            <a class="forgot" href="#">Forgot your email or password?</a>
            </form>
     </div>
    <script src="assets1/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets1/js/Advanced-NavBar---Multi-dropdown.js"></script>
    <script src="assets1/js/form.js"></script>
    <script src="assets1/js/Sidebar-Menu.js"></script>
    <script >
    function validemail(email,event)
    {
    	if(email==""||email=="null")
    		{alert("email can't be blank"); e.preventDefault();}
    	else
    		{}
    }
    function validpass(pass,event)
    {
    	if(pass==""||pass=="null")
		{alert("pass can't be blank"); e.preventDefault();}
	else
		{}
    }
  $(document).ready(function(){
		  $("#loginbutton").click(function(e){
		  var login= document.form1.Login.value;
	      var email= document.form1.email.value;
          var pass= document.form1.pass.value;
          //validemail(email,e);
          //validpass(pass,e);
          var request = $.ajax({
				  url: "/Ehealthcare_Final/Login",
				  type: "GET",
				  data: {Login:login,email:email,pass:pass},
				  success: function(data)
				  {  var site = JSON.parse(data); 
					//alert(site.value);
					if(site.action=="success")
						{
						window.location = site.value;
						}
					if(site.action=="error")
					{
						alert(site.value);
						
					}
				  } 
				}); 
		  });
		});
    </script>
</body>
</html>