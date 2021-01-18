
// For login
$(document).ready(function(){
		  $("#loginbutton").click(function(){ alert("ajax");
			  var login= document.form1.login.value;
	          var email= document.form1.email.value;
              var pass= document.form1.pass.value;
		      console.log(login); console.log(email); console.log(pass);
              var request = $.ajax({
					  url: "/Ehealthcare_Final/Login",
					  type: "GET",
					  data: {login : login,email:email,pass:pass},
					  success: function(data)
					  {   
						 alert(data);
					  }
					});
		  });
		});