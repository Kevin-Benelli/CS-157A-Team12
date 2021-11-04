<%@ page import="java.sql.*"%>
<html>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <head>
    <title class="App-Header">FairComp Team 12</title>
    
    <br />
  </head>
    
  <body>
    <h1 class="title">Welcome To FairComp</h1>
    <hr class="headerLineBreak" />

      <!-- <tr class = "table_align">
        <td>nursePositionTitle</td>
        <td>nurseYearsOfExperience</td>
        <td>nurseBaseSalary</td>
        <td>nurseOvertime</td>
        <td>nurseSignOnBonus</td>
   </tr> -->

   <h2 class="subHeader"> Top 5 Most Popular Companies </h2>
   

   <div class = "sqlData"> 
    <% 
     	String db = "FairComp"; 
      String user = "root";
      String password = "FluxIntegral!1"; 
        
      try {   
          java.sql.Connection con; 
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
          //out.println(db + " database successfully opened.<br/><br/>");
          
          Statement stmt = con.createStatement();
          
          ResultSet rs = stmt.executeQuery("SELECT company_name, location, base_salary, sign_on_bonus, annual_bonus, other_pay FROM CompanyCompensation, CompanyInfo WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID ORDER BY base_salary DESC LIMIT 5"); 


          /*while (rs.next()) {
              out.println(rs.getString(1) + " " 
              + rs.getInt(2) + " " 
              + rs.getInt(3) + " " 
              + rs.getInt(4) + " " 
              + rs.getInt(5) + " " 
              + rs.getInt(6) 
              + "<br/><br/>");
          }*/
          while(rs.next()){
            out.println(
              "<b>Job Title:</b> <a href=top_companies>" + rs.getString(1) + "</a> "
              + "<b>Location:</b> " + rs.getString(2) + " "    
              + "<b>Base Hour Rate:</b> $" + rs.getInt(3) + " "  
              + "<b>Sign On Bonus:</b> $" + rs.getInt(4) + " "  
              + "<b>Annual Bonus:</b> $" + rs.getInt(5) + " " 
              + "<b>Other Pay:</b> $" + rs.getInt(6) + " "     
              + "<br/><br/>");
          }
          rs.close();
          stmt.close();
          con.close();
      } catch(SQLException e) { 
          out.println("SQLException caught: " + e.getMessage()); 
      }
    %>
    </div>
  </body>
  <footer>
  <button onclick="window.location.href='/submit-page.jsp'"> Submit New Compensation Information </button>
   <input type=text placeholder="Search Company Here" /> 
  </footer>
</html>