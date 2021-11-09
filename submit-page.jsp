<%@ page import="java.sql.*"%>
<html>
<link href="styles.css" rel="stylesheet" type="text/css">
<head>
<title class="App-Header">submit New Compensation</title><br />
</head>
<body>

  	<form action="" method="get">		
		<h1 class="title">FairComp</h1>
		<hr class="headerLineBreak" />
		<h2 class="subHeader">Add a Compensation</h2><br />
		<p>Company Information:</p><br /> 
		<br /> <input type="text" id="compID" placeholder="Company ID" /><br />
		<br /> <input type="text" id="jobID" placeholder="Job ID" /><br /> 
		<br /> <input type="text" id="stateLoc" placeholder="State Location of the office" /><br /> <br /><br />
		<p>Compensation Information:</p><br /> 
		<br /> <input type="text" id="BS" placeholder="Base Salary(hourly)" /><br /> 
		<br /> <input type="text" id="SOB" placeholder="Sign On Bonus(yearly)" /><br /> 
		<br /> <input type="text" id="AB" placeholder="Annual Bonus(yearly)" /><br />
		<br /> <input type="text" id="OP" placeholder="Other Pay(yearly)" />
			<span id = "inputs" ></span><br />
		<br /> <br /> <br />
		<button onclick="addNewComp2DB(); submissionConfirmationPage()">Submit My Compensation</button>
 	</form> 
 	<!-- addNewComp2DB(); submissionConfirmationPage() --> 


<script>

 	//Find out user's input info
  	int cid = document.getElementById("compID").value;
 	 //out.println("cid is: "+cid);
  	int jid = document.getElementById("jobID").value;
  	var sl = document.getElementById("stateLoc").value;
  	int bs = document.getElementById("BS").value;
  	int sob = document.getElementById("SOB").value;
  	int ab = document.getElementById("AB").value;
  	int op = document.getElementById("OP").value; 
  	 	
	function addNewComp2DB(){
     	String db = "cs157aprojectteam12"; 
	    var maxUserID; 
	     

 		try {   
    		java.sql.Connection con; 
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "Dabi464404");
            out.println(db + " database successfully opened.");

    		Statement stmt = con.createStatement();
    
    		//Find MaxUserID#
      		 ResultSet rs = stmt.executeQuery("SELECT MAX(userID) AS 'MaxUserID' FROM UserCompensation"); 
     		while(rs.next()){
    	 		maxUserID = rs.getInt(1) + 1;
     		} 	
     		String insertData = "INSERT INTO UserCompensation(userID, companyID, jobID, location, base_salary, sign_on_bonus, annual_bonus, other_pay) VALUES (maxUserID, cid, jid, sl, bs, sob, ab, op)";
	
     		int i = stmt.executeUpdate(insertData);
     		out.println("insertData Success or Fail?: "+i);
    		rs.close(); 
     		stmt.close();
    		con.close();
		} catch(SQLException e) { 
    		out.println("SQLException caught: " + e.getMessage()); 
			} 
	}
 	function submissionConfirmationPage(){
		window.location.href='/project1/submissionConfirmationPage.jsp';
	}
</script>

</body>
</html>