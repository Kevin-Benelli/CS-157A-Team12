<%@ page import="java.sql.*"%>
<html>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <head>
    <title class="App-Header">FairComp Team 12</title>
    
    <br />
  </head>
    
  <body>
    <h1 class="title">FairComp Job Position Filter Page</h1>
    <hr class="headerLineBreak" />


   <div class = "filterStateInput"> 
   		<form action="" method="get">
   			<input type="text" class="form-control" name="q" placeholder="Enter Job Position Abbreviation (i.e. RN, CNA, MSN, DNP, APRN, NME)..."/>
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
        	  data = "SELECT company_name, job_name, job_level, location, CompanyCompensation.base_salary, sign_on_bonus, annual_bonus, other_pay FROM CompanyCompensation, CompanyInfo, JobPositionCompensation WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID AND job_name = '"+query+"'";
            
        	  ResultSet rsSearch = searchStat.executeQuery(data);
              
              while(rsSearch.next()){
            	  out.println(
            	    "<b>Company Name:</b> <a href=all_user_entries>" + rsSearch.getString(1) + "</a> "
                  + "<b>Job Name:</b> " + rsSearch.getString(2) + " "    
                  + "<b>Job Level:</b> " + rsSearch.getString(3) + " "  
                  + "<b>Location:</b> " + rsSearch.getString(4) + " "  
                  + "<b>Base Hour Rate:</b> $" + rsSearch.getInt(5) + " " 
                    + "<b>Annual Bonus:</b> $" + rsSearch.getInt(6) + " "     
                    + "<b>Sign On Bonus:</b> $" + rsSearch.getInt(7) + " "    
                    + "<b>Other Pay:</b> $" + rsSearch.getInt(8) + " "   
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
  <button class="button_style" type="button" onclick="window.location.href='location-filter.jsp'">Search by Location</button> 
  <button class="button_style" type="button" onclick="window.location.href='job-level-filter.jsp'">Search by Job Name</button>
  </footer>
</html>