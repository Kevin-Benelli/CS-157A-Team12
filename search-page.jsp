<%@ page import="java.sql.*"%>
<html>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <head>
    <title class="App-Header">FairComp Team 12</title>
    
    <br />
  </head>
    
  <body>
    <h1 class="title">FairComp Search Page</h1>
    <hr class="headerLineBreak" />
   
   <div class = "searchCompanyInput"> 
   		<form action="" method="get">
   			<input type="text" class="form-control" name="q" placeholder="Search company name..."/>
   		</form>
   </div>
	
   <div class = "searchCompany"> 
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
        	  data = "SELECT company_name, location, base_salary, sign_on_bonus, annual_bonus, other_pay FROM CompanyCompensation, CompanyInfo WHERE CompanyCompensation.CompanyID = CompanyInfo.CompanyID AND company_name LIKE '%"+query+"%'";
        	  ResultSet rsSearch = searchStat.executeQuery(data);
              
              while(rsSearch.next()){
            	  out.println(
            	  "<b>Company Name:</b> " + rsSearch.getString(1) + " "
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
  <button class="button_style" type="button" onclick="window.location.href='company-position.jsp'">View by Position Levels</button> 
  <button class="button_style" type="button" onclick="window.location.href='location-filter.jsp'">Filter by State</button> 
  <button class="button_style" type="button" onclick="window.location.href='job-name-filter.jsp'">Search by Job Name</button> 
  <button class="button_style" type="button" onclick="window.location.href='job-level-filter.jsp'">Search by Job Level</button> 
  </footer>
</html>