package Databse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import beans.Chat;
import beans.Doctor;
import beans.Patient;
import beans.appoint;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject; 
public class DB 
{ //for connection
	public static Connection getconnect() throws SQLException
	{ 
		Connection con=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");  
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/full","root","1234");  
		  }catch (Exception e){ System.out.println(e);} 
	return con;
   }
	// for inserting values into doctor table
	public void signupdoc(Doctor doc)
	{ 
		try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("insert into Doctor values(?,?,?,?,?,?,?)");
			stmt.setInt(1, docnumber());
			stmt.setString(2,doc.getName());
			stmt.setString(3,doc.getEmail());
			stmt.setString(4,doc.getPassword());
			stmt.setString(5,doc.getSpecialist());
			stmt.setString(6,doc.getPhone());
			stmt.setString(7,doc.getAddress());
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);}
	}
	// for inserting values into patient table
	public void signuppat(Patient pat)
	{
		try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("insert into Patient values(?,?,?,?,?,?,?,?)");
			stmt.setInt(1, patnumber());
			stmt.setString(2,pat.getName());
			stmt.setString(3,pat.getEmail());
			stmt.setString(4,pat.getPassword());
			stmt.setString(5,pat.getPhone());
			stmt.setString(6,"false");
			stmt.setString(7,pat.getDisease());
			stmt.setString(8,pat.getInfo());
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);}
	}
	// for  doctor ID
	public int docnumber()
	{  int total=0;
		try { 
	    Connection con = getconnect();
		Statement smt = con.createStatement();
		ResultSet set = smt.executeQuery("select count(*) from doctor");
		while(set.next())
		total=set.getInt(1);
		con.close();
		}catch(Exception e){System.out.println(e);}
		int total1=total+1;
		return total1 ;
	}
	// for  Patient ID
	public int patnumber()
	{  int total=0;
		try { 
	    Connection con = getconnect();
		Statement smt = con.createStatement();
		ResultSet set = smt.executeQuery("select count(*) from patient");
		while(set.next())
		total=set.getInt(1);
		con.close();
		}catch(Exception e){System.out.println(e);}
		int total1=total+1;
		return total1 ;
	}
	// for  Doctor login
	public boolean checklogindoc(String email,String pass)
	{  boolean status=false;
	   try 
	   {
		Connection con= getconnect(); 
		PreparedStatement ps =con.prepareStatement("select * from Doctor where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, pass);
		ResultSet rs =ps.executeQuery();
		status=rs.next();
	   }catch (Exception e) {
		System.out.println(e);
	}
	   return status;
	}
	// for  Patient login
	public boolean checkloginpat(String email,String pass)
	{  boolean status=false;
	   try 
	   {
		Connection con= getconnect(); 
		PreparedStatement ps =con.prepareStatement("select * from patient where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, pass);
		ResultSet rs =ps.executeQuery();
		status=rs.next();
	   }catch (Exception e) {
		System.out.println(e);
	}
	   return status;
	}
    // for doctor session
    public int doclogin( String email)
    { int id = 0;
    try 
	   {
		Connection con= getconnect(); 
		PreparedStatement ps =con.prepareStatement("select ID from Doctor where email=?");
		ps.setString(1, email);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			id=rs.getInt(1);
	   }catch (Exception e) {
		System.out.println(e);
	}
    return id;
    }
    // patientList 
    public ArrayList<Patient> list()
    {
    	ArrayList<Patient> List = new ArrayList<>();
    	try { 
            Connection con = getconnect();
            Statement smt = con.createStatement();
        	ResultSet set = smt.executeQuery("select ID,Name,Disease,info from patient where status='false'");
        	while(set.next())
        	{
        		Patient dis1 = new Patient();
        		dis1.setId(set.getInt(1));
        		dis1.setName(set.getString(2));
        		dis1.setDisease(set.getString(3));
        		dis1.setInfo(set.getString(4));
        		List.add(dis1);
        	}
    	con.close();
    	}catch(Exception e){System.out.println(e);}
    	return List;
    }
     // disease from patient
    public String disease(int patientid)
    { String dis=null;
    try 
	   {
		Connection con= getconnect(); 
		PreparedStatement ps =con.prepareStatement("select Disease from patient where ID=?");
		ps.setInt(1,patientid);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			dis=rs.getString(1);
	   }catch (Exception e) {
		System.out.println(e);
	}
    
    return dis;
    }
     // appoint table
    public void appoint(appoint app)
    {
    	try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?)");
			stmt.setInt(1, app.getDoctorid());
			stmt.setInt(2, app.getPatientid());
			stmt.setString(3, app.getDisease());
			stmt.setString(4, app.getTime());
			stmt.setString(5, app.getDate());
			stmt.setString(6, "null");
			stmt.setInt(7, 0);
			stmt.setString(8, "false");
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);}
    	
    }
    // status true
    public void status(int patid) 
    {
    	try
    	{
    		Connection con  = getconnect();
    		PreparedStatement stmt=con.prepareStatement("UPDATE patient SET Status='true' WHERE ID = ?");
    		stmt.setInt(1, patid);
    		stmt.executeUpdate();
    	}catch (Exception e) {
    		System.out.println(e);
		}
    }
    // appointment doctorList
   public ArrayList<appoint> appointlist(int n)
   {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Patientid ,Disease,Date,Time from appointment where (Doctorid=? And billstatus='false')");
	  ps.setInt(1, n);
      ResultSet rs =ps.executeQuery();
      while(rs.next())
      {   int i=rs.getInt(1);
          String a = docname(i);
    	  appoint app1 = new appoint();
    	  app1.setName(a);
    	  app1.setDisease(rs.getString(2));
    	  app1.setDate(rs.getString(3));
    	  app1.setTime(rs.getString(4));
    	  app1.setPatientid(i);
    	  app.add(app1);
      }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
   }
    // appointment patient name
   public String docname(int i)
   {
	   String dis=null;
	    try 
		   {
			Connection con= getconnect(); 
			PreparedStatement ps =con.prepareStatement("select Name from patient where ID=?");
			ps.setInt(1,i);
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			dis=rs.getString(1);
		   }catch (Exception e) {System.out.println(e);}
	    return dis;
   }
   // medicines + bill
   public void updateappoint(appoint app)
	{ 
		try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("UPDATE appointment SET Medicines = ?, bill= ?,billstatus='pending' WHERE patientID = ?");
			stmt.setString(1,app.getMedicines());
			stmt.setInt(2,app.getBill());
			stmt.setInt(3,app.getPatientid());
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);}
	}
   // pending bill doctor page
   public ArrayList<appoint> pendindoclist(int n)
   {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Patientid ,Disease,bill,Time,Date from appointment where (Doctorid=? And billstatus='pending')");
	  ps.setInt(1, n);
      ResultSet rs =ps.executeQuery();
      while(rs.next())
      {   int i=rs.getInt(1);
          String a = docname(i);
    	  appoint app1 = new appoint();
    	  app1.setName(a);
    	  app1.setDisease(rs.getString(2));
    	  app1.setBill(rs.getInt(3));
    	  app1.setTime(rs.getString(4));
    	  app1.setDate(rs.getString(5));
    	  app.add(app1);
      }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
   }
    //payement done doctor
   public ArrayList<appoint> paymenrdonedoclist(int n)
   {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Patientid ,Disease,bill,Time,Date from appointment where (Doctorid=? And billstatus='true')");
	  ps.setInt(1, n);
      ResultSet rs =ps.executeQuery();
      while(rs.next())
      {   int i=rs.getInt(1);
          String a = docname(i);
    	  appoint app1 = new appoint();
    	  app1.setName(a);
    	  app1.setDisease(rs.getString(2));
    	  app1.setBill(rs.getInt(3));
    	  app1.setTime(rs.getString(4));
    	  app1.setDate(rs.getString(5));
    	  app.add(app1);
      }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
   }
   // for patient session
   public int patlogin( String email)
   { int id = 0;
   try 
	   {
		Connection con= getconnect(); 
		PreparedStatement ps =con.prepareStatement("select ID from patient where email=?");
		ps.setString(1, email);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			id=rs.getInt(1);
	   }catch (Exception e) {
		System.out.println(e);
	}
   return id;
   }
   // for patient appoint
   public ArrayList<appoint> patientapplist(int n)
   {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Doctorid ,Date,Time from appointment where (Patientid=? And billstatus='false')");
	  ps.setInt(1, n);
      ResultSet rs =ps.executeQuery();
      while(rs.next())
      {   int i=rs.getInt(1);
          String a = patname(i);
          String add = patadd(i);
    	  appoint app1 = new appoint();
    	  app1.setName(a);
          app1.setAddress(add);
          app1.setDate(rs.getString(2));
          app1.setTime(rs.getString(3));
    	  app.add(app1);
      }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
   }
   // for doctor name
   public String patname(int i)
   {
	   String dis=null;
	    try 
		   {
			Connection con= getconnect(); 
			PreparedStatement ps =con.prepareStatement("select Name from Doctor where ID=?");
			ps.setInt(1,i);
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			dis=rs.getString(1);
		   }catch (Exception e) {System.out.println(e);}
	    return dis;
   }
   // for doctor address
   public String patadd(int i)
   {
	   String dis=null;
	    try 
		   {
			Connection con= getconnect(); 
			PreparedStatement ps =con.prepareStatement("select Address from Doctor where ID=?");
			ps.setInt(1,i);
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			dis=rs.getString(1);
		   }catch (Exception e) {System.out.println(e);}
	    return dis;
   }
 // for patient bill
   public ArrayList<appoint> patientbill(int n)
   {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Doctorid ,Disease,Medicines,bill from appointment where (Patientid=? And billstatus='pending')");
	  ps.setInt(1, n);
      ResultSet rs =ps.executeQuery();
      while(rs.next())
      {   int i=rs.getInt(1);
          String a = patname(i);
    	  appoint app1 = new appoint();
    	  app1.setDoctorid(i);
    	  app1.setName(a);
          app1.setDisease(rs.getString(2));
          app1.setMedicines(rs.getString(3));
          app1.setBill(rs.getInt(4));
    	  app.add(app1);
      }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
   }
   // payment done
   public void paymentdone(int app,int doc)
	{ 
		try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("UPDATE appointment SET billstatus='true' WHERE PatientID = ? AND Doctorid = ?");
			stmt.setInt(1,app);
			stmt.setInt(2, doc);
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);}
	}
   
   //payement done doctor
  public ArrayList<appoint> paymenrdonepatlist(int n)
  {
	  ArrayList<appoint> app = new ArrayList<>();
	  try { 
	  Connection con = getconnect();
	  PreparedStatement ps =con.prepareStatement("select Doctorid ,Disease,bill,Time,Date from appointment where (Patientid=? And billstatus='true')");
	  ps.setInt(1, n);
     ResultSet rs =ps.executeQuery();
     while(rs.next())
     {   int i=rs.getInt(1);
         String a = patname(i);
         String add = patadd(i);
   	  appoint app1 = new appoint();
   	  app1.setName(a);
   	  app1.setDisease(rs.getString(2));
   	  app1.setBill(rs.getInt(3));
   	  app1.setTime(rs.getString(4));
   	  app1.setDate(rs.getString(5));
   	  app1.setAddress(add);
   	  app.add(app1);
     }
	  }catch (Exception e) {System.out.println(e);}
	  return app;
  }
  // reappoint
public void reschedule(int id,String info,String dis)
{
	try { 
        Connection con = getconnect();
		PreparedStatement stmt=con.prepareStatement("UPDATE patient SET Status='false',disease=?, info=? WHERE ID = ?");
		stmt.setString(1, dis);
		stmt.setString(2,info);
		stmt.setInt(3,id);
		stmt.executeUpdate(); 
	con.close();
	}catch(Exception e){System.out.println(e);}
}
 // for chat box - doctor list
  public ArrayList<Doctor> chatdoclist()
  {
	  ArrayList<Doctor> doclist = new ArrayList<>();
      try {
		Connection con = getconnect();
		Statement smt = con.createStatement();
    	ResultSet set = smt.executeQuery("select ID,Name,specialist from Doctor");
    	while(set.next()) 
    	{
    		Doctor doc = new Doctor();
    		doc.setId(set.getInt(1));
    		doc.setName(set.getString(2));
    		doc.setSpecialist(set.getString(3));
    		doclist.add(doc);
    	}con.close();
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e);
	}
	  return doclist;
  }
  //  update chat
  public String update(int sendid, int recid,String msg) 
  {   String done="update done";
	  try { 
	        Connection con = getconnect();
			PreparedStatement stmt=con.prepareStatement("insert into chat values(?,?,?)");
			stmt.setInt(1,sendid);
			stmt.setInt(2,recid);
			stmt.setString(3,msg);
			stmt.executeUpdate(); 
		con.close();
		}catch(Exception e){System.out.println(e);} return done;
}
  // chats history
  public String chathis(int sendid,int recid)
  {
	  ArrayList<Chat> chatlist = new ArrayList<>();
	  JSONObject obj = new JSONObject();
      try {
		Connection con = getconnect();
		PreparedStatement stmt = con.prepareStatement("select msg from chat WHERE (sendid=? AND recid=?) OR (sendid=? AND recid=?)");
		stmt.setInt(1, sendid); stmt.setInt(2, recid); stmt.setInt(3, recid); stmt.setInt(4, sendid);
		ResultSet rs =stmt.executeQuery();
		JSONArray jsonarray = new JSONArray();
		while(rs.next())
		 {
			 Chat chat = new Chat();
			 chat.setMsg(rs.getString(1));
			 JSONObject obj1 = new JSONObject();
			 obj1.put("msg",rs.getString(1));
			 jsonarray.add(obj1);
			 obj.put("msg",jsonarray);
			 chatlist.add(chat);
		 }
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e);
	}
	  return (obj.toString());
  }
  // datail 
  public String deatil(int a)
  {   JSONObject obj = new JSONObject(); JSONArray jsonarray = new JSONArray();
  try {
	Connection con = getconnect();
	PreparedStatement stmt = con.prepareStatement("select Name,Address,Email from doctor WHERE id=?");
	stmt.setInt(1, a);
	ResultSet rs =stmt.executeQuery();
	while(rs.next())
	 { 
	 String name = rs.getString(1);
	 String add=rs.getString(2);
	 String email= rs.getString(3);
		/*
		 * System.out.println(name); System.out.println(add); System.out.println(email);
		 */
	 jsonarray.add(name);
	 jsonarray.add(email);
	 jsonarray.add(add);
	 obj.put("details", jsonarray);
	 }
	con.close();
} catch (Exception e) {
	// TODO: handle exception
	System.out.println(e);
}  return (obj.toString());
  }
  public String patdeatil(int a)
  {   JSONObject obj = new JSONObject(); JSONArray jsonarray = new JSONArray();
  try {
	Connection con = getconnect();
	PreparedStatement stmt = con.prepareStatement("select Name,phone,Email from patient WHERE id=?");
	stmt.setInt(1, a);
	ResultSet rs =stmt.executeQuery();
	while(rs.next())
	 { 
	 String name = rs.getString(1);
	 String add=rs.getString(2);
	 String email= rs.getString(3);
		/*
		 * System.out.println(name); System.out.println(add); System.out.println(email);
		 */
	 jsonarray.add(name);
	 jsonarray.add(email);
	 jsonarray.add(add);
	 obj.put("details", jsonarray);
	 }
	con.close();
} catch (Exception e) {
	// TODO: handle exception
	System.out.println(e);
}  return (obj.toString());
  }
  //Doctor Chatbox
  public ArrayList<Patient> chatpatlist(int n)
  {
	  ArrayList<Patient> List = new ArrayList<>();
      try {
		Connection con = getconnect();
		Statement smt = con.createStatement();
		PreparedStatement stmt = con.prepareStatement("select DISTINCT sendid from chat where recid=?;");
		stmt.setInt(1, n);
		ResultSet rs =stmt.executeQuery();
    	while(rs.next()) 
    	{   Patient pat = new Patient();
    	      int i=rs.getInt(1);
    	 	String name= docname(i);
    	 	String dis = patdis(i);
    	 	pat.setId(i);
    	 	pat.setDisease(dis);
    	 	pat.setName(name); List.add(pat);
    	}con.close();
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e);
	}
	  return List;
  }
  // patient dis
  public String patdis(int i)
  {
	   String dis=null;
	    try 
		   {
			Connection con= getconnect(); 
			PreparedStatement ps =con.prepareStatement("select disease from patient where ID=?");
			ps.setInt(1,i);
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			dis=rs.getString(1);
		   }catch (Exception e) {System.out.println(e);}
	    return dis;
  }
 
//chat doc page
  public String chathisdoc(int sendid,int recid)
  {
	  ArrayList<Chat> chatlist = new ArrayList<>();
	  JSONObject obj = new JSONObject();
      try {
		Connection con = getconnect();
		PreparedStatement stmt = con.prepareStatement("select msg from chat WHERE (sendid=? AND recid=?) OR (sendid=? AND recid=?)");
		stmt.setInt(1, sendid); stmt.setInt(2, recid); stmt.setInt(3, recid); stmt.setInt(4, sendid);
		ResultSet rs =stmt.executeQuery();
		JSONArray jsonarray = new JSONArray();
		while(rs.next())
		 {
			 Chat chat = new Chat();
			 chat.setMsg(rs.getString(1));
			 JSONObject obj1 = new JSONObject();
			 obj1.put("msg",rs.getString(1));
			 jsonarray.add(obj1);
			 obj.put("msg",jsonarray);
			 chatlist.add(chat);
		 }
		con.close();
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e);
	}
	  return (obj.toString());
  }
 
}


