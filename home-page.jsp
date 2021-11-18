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
      String password = ""; 
      
      try {   
          java.sql.Connection con; 
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false",user, password);
          //out.println(db + " database successfully opened.<br/><br/>");
          
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT company_name, CompanyInfo.location, CompanyCompensation.base_salary, CompanyCompensation.sign_on_bonus, CompanyCompensation.annual_bonus, CompanyCompensation.other_pay, COUNT(UserCompensation.CompanyID) as 'most_popular_companies' FROM CompanyCompensation, CompanyInfo, UserCompensation WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID GROUP BY company_name, location, base_salary, sign_on_bonus, annual_bonus, other_pay ORDER BY most_popular_companies DESC LIMIT 5"); 

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
              "<b>Company Name:</b> <a href=top_companies>" + rs.getString(1) + "</a> "
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
    <br /><br />

    <h2 class = "subHeader"> Top 10 User Compensation Entries Based on Total Annual Compensation</h2>
    <% 
    String db2 = "FairComp"; 
    String user2 = "root";
    String password2 = ""; 
    String sqlQuery = "SELECT company_name, ((base_salary *52 * 40) + sign_on_bonus + annual_bonus + other_pay) AS 'total_annual_compensation', base_salary, base_salary, sign_on_bonus, annual_bonus, other_pay, location FROM CompanyCompensation, CompanyInfo WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID ORDER BY total_annual_compensation DESC LIMIT 10;";
      try {   
          java.sql.Connection con2; 
          Class.forName("com.mysql.jdbc.Driver");
          con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db2+"?autoReconnect=true&useSSL=false",user2, password2);
          //out.println(db2 + " database successfully opened.<br/><br/>");
          Statement stmt2 = con2.createStatement();
          
          ResultSet rs = stmt2.executeQuery(sqlQuery); 

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
              "<b>Company Name:</b> <a href=top_companies>" + rs.getString(1) + "</a> "
              + "<b>Total Annual Compensation:</b> " + rs.getInt(2) + " "    
              + "<b>Base Hourly Rate:</b> $" + rs.getInt(3) + " "  
              + "<b>Sign On Bonus:</b> $" + rs.getInt(4) + " "  
              + "<b>Annual Bonus:</b> $" + rs.getInt(5) + " " 
              + "<b>Other Pay:</b> $" + rs.getInt(6) + " "     
              + "<b>Location:</b> $" + rs.getInt(6) + " "     
              + "<br/><br/>");
          }
          rs.close();
          stmt2.close();
          con2.close();
      } catch(SQLException e) { 
          out.println("SQLException caught: " + e.getMessage()); 
      }
    %>
    
  </body>
  <footer>
  <button type="button" onclick="window.location.href='search-page.jsp'">Search for a Company</button> 
  <button onclick="window.location.href='/submit-page.jsp'"> Submit New Compensation Information </button> 
  </footer>
</html>