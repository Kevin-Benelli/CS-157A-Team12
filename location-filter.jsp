<%@ page import="java.sql.*"%>
<html>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <head>
    <title class="App-Header">FairComp Team 12</title>
    
    <br />
  </head>
    
  <body>
    <h1 class="title">FairComp State Filter Page</h1>
    <hr class="headerLineBreak" />

      <!-- <tr class = "table_align">
        <td>nursePositionTitle</td>
        <td>nurseYearsOfExperience</td>
        <td>nurseBaseSalary</td>
        <td>nurseOvertime</td>
        <td>nurseSignOnBonus</td>
   </tr> -->
   
   <div class = "filterStateInput"> 
   		<form action="" method="get">
   			<input type="text" class="form-control" name="q" placeholder="Enter State abbreviation..."/>
   		</form>
   </div>
	
   <div class = "filterLocation"> 
    <% 
      String database = "FairComp"; 
      String username = "root";
      String pwd = ""; 
      
      try {   
          java.sql.Connection connector; 
          Class.forName("com.mysql.jdbc.Driver");
          connector = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"?autoReconnect=true&useSSL=false",username, pwd);
          
     	  Statement searchStat = connector.createStatement();
          
          String query = request.getParameter("q");
          String data;
          if(query!=null)
          {
        	  data = "SELECT company_name, location, base_salary, sign_on_bonus, annual_bonus, other_pay FROM CompanyCompensation, CompanyInfo WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID AND location LIKE '"+query+"'";
        	  ResultSet rsSearch = searchStat.executeQuery(data);
              
              while(rsSearch.next()){
            	  out.println(
            	  "<b>Company Name:</b> <a href=top_companies>" + rsSearch.getString(1) + "</a> "
            	  + "<b>Location:</b> " + rsSearch.getString(2) + " "    
            	  + "<b>Base Hour Rate:</b> $" + rsSearch.getInt(3) + " "  
            	  + "<b>Sign On Bonus:</b> $" + rsSearch.getInt(4) + " "  
            	  + "<b>Annual Bonus:</b> $" + rsSearch.getInt(5) + " " 
                  + "<b>Other Pay:</b> $" + rsSearch.getInt(6) + " "     
            	  + "<br/><br/>");
              }
              
              rsSearch.close();
          }
          
          searchStat.close();
          connector.close();
      } catch(SQLException e) { 
          out.println("SQLException caught: " + e.getMessage()); 
      }
    %>
   </div>

  </body>
  <footer>
  <button class="button_style" type="button" onclick="window.location.href='home-page.jsp'">Homepage</button> 
  <button class="button_style" type="button" onclick="window.location.href='search-page.jsp'">Search by Company Name</button> 
  </footer>
</html>