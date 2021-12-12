<%@ page import="java.sql.*"%>
<html>
  <link href="css/styles.css" rel="stylesheet" type="text/css">
  <head>
    <title class="App-Header">FairComp Team 12</title>
    
    <br />
  </head>
    
    <body>
    <h1 class="title">Company Position Levels Page</h1>
    <hr class="headerLineBreak" />
   
   <div class = "companyInput"> 
   		<form action="" method="get">
   			<input type="text" class="form-control" name="q" placeholder="Exact Company Name..."/>
   		</form>
   </div>
    
   <div class = "companyPosition"> 
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
        	  data = "SELECT company_name, job_level, job_name, UserCompensation.base_salary, sign_on_bonus, annual_bonus, other_pay FROM CompanyInfo, JobPositionCompensation, UserCompensation WHERE CompanyInfo.companyID = UserCompensation.companyID AND UserCompensation.jobID = JobPositionCompensation.jobID AND company_name LIKE '"+query+"' ORDER BY job_level DESC";
        	  ResultSet rsSearch = searchStat.executeQuery(data);
              
              while(rsSearch.next()){
            	  out.println(
            	  "<b>Company Name:</b> " + rsSearch.getString(1) + " "
            	  + "<b>Job Level:</b> " + rsSearch.getString(2) + " "    
            	  + "<b>Job Name:</b> " + rsSearch.getString(3) + " "  
            	  + "<b>Base Salary:</b> $" + rsSearch.getInt(4) + " "  
            	  + "<b>Sign On Bonus:</b> $" + rsSearch.getInt(5) + " " 
                  + "<b>Annual Bonus:</b> $" + rsSearch.getInt(6) + " "    
                  + "<b>Other Pay:</b> $" + rsSearch.getInt(7) + " " 
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
  </footer>
</html>