<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>FairComp Team 12</title>
    </head>
  <body>
    <h1>FairComp</h1>
    

    <table border="1">
      <tr>
        <td>nursePositionTitle</td>
        <td>nurseYearsOfExperience</td>
        <td>nurseBaseSalary</td>
        <td>nurseOvertime</td>
        <td>nurseSignOnBonus</td>
   </tr>

    <% 
     	String db = "FairComp"; 
	    String table = "NurseCompensation";
      String user = "root";
      String password = ""; 
        
      try {   
          java.sql.Connection con; 
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
          out.println(db + " database successfully opened.<br/><br/>");
          
          out.println("Initial entries in table Nurse Compensation : <br/>");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT * FROM nurse_compensation");
          while (rs.next()) {
              out.println(rs.getString(1) + " " 
              + rs.getInt(2) + " " 
              + rs.getInt(3) + " " 
              + rs.getInt(4) + " " 
              + rs.getInt(5) + " " 
              + rs.getInt(6) 
              + "<br/><br/>");
          }
          rs.close();
          stmt.close();
          con.close();
      } catch(SQLException e) { 
          out.println("SQLException caught: " + e.getMessage()); 
      }
    %>
  </body>
</html>