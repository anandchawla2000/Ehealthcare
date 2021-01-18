 function check()
{
var a = document.getElementById("Main");
var b = a.options[a.selectedIndex].text;
var res =b.match(/Patient/);
var res1 =b.match(/Select/);
if(res!=null && res1==null)
{
document.getElementById("Signup1").innerHTML = '<div class="form-group"><input class="form-control" type="text" placeholder="Enter Name" name="name" id="name"></div><div class="form-group"><input class="form-control" type="email" placeholder="Enter Email" name="email" id="email"></div><div class="form-group"><input class="form-control" type="password" placeholder="Password" name="password" id="password"></div><div class="form-group"><input class="form-control" type="password" placeholder="Confirm Password" name="Cpassword" id="Cpassword"></div><div class="form-group"><input class="form-control" type="text" placeholder="Phone number" name="phone" id="phone"></div><div class="form-group"><select class="form-control" name="disease" id="disease"><option>Select Disease</option><option value="TB">TB</option><option value="fever">fever</option></select></div><div class="form-group"><input class="form-control" type="text" placeholder="Some More Information" name="info" id="info"></div>';
document.getElementById("but").innerHTML='Apply for Doctor';
}
else if(res1!=null){document.getElementById("Signup1").innerHTML="Select First";}
else if(res==null && res1==null)
    {
        document.getElementById("Signup1").innerHTML = '<div class="form-group"><input class="form-control" type="text" placeholder="Enter Name" name="name" id="name"></div><div class="form-group"><input class="form-control" type="email" placeholder="Enter Email" name="email" id="email"></div><div class="form-group"><input class="form-control" type="password" placeholder="Password" name="password" id="password"></div><div class="form-group"><input class="form-control" type="password" placeholder="Confirm Password" name="Cpassword" id="Cpassword"></div><div class="form-group"><input class="form-control" type="text" placeholder="Phone number" name="phone" id="phone"></div><div class="form-group"><select class="form-control" name="spec" id="spec"><option value="Select Specialist">Select Specialist-</option><option value="TB">TB</option><option value="fever">fever</option></select></div><div class="form-group"><input class="form-control" type="text" placeholder="Address" name="add" id="add"></div>';
        document.getElementById("but").innerHTML='Submit form';
    }
}