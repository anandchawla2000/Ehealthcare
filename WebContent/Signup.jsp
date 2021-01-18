<%@page import="Databse.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
CSS only
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script>
function check()
{
  var a = document.getElementById("main");
  var b = a.options[a.selectedIndex].text;
  var res =b.match(/Patient/);
  if(res==null)
  {
	  var a="specialist:<input type='text' name='spec'><br>address:<input type='text' name='add'><br> <button type='submit' class='btn btn-primary'>Register</button>";
	  document.getElementById('abc').innerHTML=a;  
  }
  else
	  {var a="Extra Information:<input type='text' name='info'><br>Disease:<select name='disease'><option>fever</option><option>TB</option></select><br><button type='submit' class='btn btn-primary'>Appy For Doctor</button>";
	  document.getElementById('abc').innerHTML=a; }
}
</script>
</head>
<body>
<form action="/Ehealthcare_Final/Signup" method="post">
Sign up:<select id="main" onchange="check()" name="signup">
<option>---</option>
<option value="Doctor">Doctor</option>
<option value="Patient">Patient</option>
</select> <br>
Enter name : <input type="text" name="name"> <br>
Enter Email:<input type="email" name="email" ><br>
Enter Password:<input type="password" name="password"><br>
Confirm Password:<input type="password" name="Cpassword"><br>
Phone Number:<input type="text" name="phone"><br>
<div id="abc">
</div>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html> -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Signup</title>
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
<script src="JavaScript/form.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>

<body style="background-color: #3c94bc;">
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
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" style="background-color: #e6bfae;" name="form1" onsubmit="return validateform()">
                <h1>Register Form</h1>
                <div class="form-group"><select class="form-control" id="Main" name="signup" onchange="check()"><option value="Select">Select</option><option value="Doctor">Doctor</option><option value="Patient">Patient</option></select></div>
                <div id="Signup1"></div>
                <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">I've read and accept the terms and conditions</label></div>
                <button class="btn btn-light submit-button" id="but" type="button">Submit Form</button></form>
        </div>
    </div>
    
 <script>
 function validname(email,event)
 { 
 	if(email==""||email=="null")
 		{alert("name can't be blank"); e.preventDefault();}
 	else
 		{}
 }
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
 function validadd(add,event)
 {
 	if(add==""||add=="null")
		{alert("pass can't be blank"); e.preventDefault();}
	else
		{}
 }
 function validphone(phone,event)
 {
 	if((phone.length)==10)
		{ 
 		var regx = /[7-9]\d{9}/;
 	      if(regx.test(phone))
 	      {
 	     
 	      }
 	      else
 	    	  {
 	    	 alert("Enter correct phone number"); 
 			e.preventDefault();
 	    	  }
		}
	else
		{
		alert("Enter correct phone number"); 
		e.preventDefault();
		}
 }
 function validcpass(cpass,pass,event)
 {
 	if(cpass.localeCompare(pass)!=0)
		{alert("Password not match"); e.preventDefault();}
	else
		{}
 }
 $(document).ready(function(){
			  $("#but").click(function()
					  {
				  var signup = document.form1.signup.value;
				   var n = signup.localeCompare("Doctor");
				   if(n==0)
					   {
					   var name = document.form1.name.value;
					   var email=document.form1.email.value;
					   var password =document.form1.password.value;
					   var cpass = document.form1.Cpassword.value;
					   var phone=document.form1.phone.value;
					   var spec=document.form1.spec.value;
					   var add=document.form1.add.value;
					   validname(name,event);
					   validemail(email,event);
				       validpass(password,event);
				       validcpass(cpass,password,event);
				       validphone(phone,event);
				       validadd(add,event);
						  var request = $.ajax({
							  url: "/Ehealthcare_Final/Signup",
							  type: "POST",
							  data: {signup:signup,name:name,email:email,password:password,phone:phone,spec:spec,add:add},
							  success: function(data)
							  {   
								 alert(data);
								 //window.location.href = 'Login.jsp'; 
								 document.getElementById('Signup1').innerText=data;
							  }
							}); 
					   }
				   else
                       {
					   var name = document.form1.name.value;
					   var email=document.form1.email.value;
					   var password =document.form1.password.value
					   var phone=document.form1.phone.value;
					   var info=document.form1.info.value;
					   var disease=document.form1.disease.value;
					   var cpass = document.form1.Cpassword.value;
					   validname(name,event);
					   validemail(email,event);
				       validpass(password,event);
				       validcpass(cpass,password,event);
				       validphone(phone,event);
					   var request = $.ajax({
							  url: "/Ehealthcare_Final/Signup",
							  type: "POST",
							  data: {signup:signup,name:name,email:email,password:password,phone:phone,info:info,disease:disease},
							  success: function(data)
							  {   
								 alert(data);
								 //window.location.href = 'Login.jsp';
								 document.getElementById('Signup1').innerText=data;
							  }
							});
					   }

			  
			  });
			});
   </script>
<!--     <script src="assets1/js/jquery.min.js"></script>
 -->    <script src="assets1/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets1/js/Advanced-NavBar---Multi-dropdown.js"></script>
    <script src="assets1/js/form.js"></script>
    <script src="assets1/js/Sidebar-Menu.js"></script>
</body>
</html>