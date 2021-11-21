<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <link href="css/styles.css" rel="stylesheet" type="text/css">-->
<head>
<meta charset="UTF-8">
<title class="App-Header">FairComp Team12</title>
</head>
<body>
	<div align = "center">
	<h1 class="title" >FairComp</h1>
    <hr class="headerLineBreak" />
		<h2>Add a Compensation</h2>
		<form action= "<%= request.getContextPath() %>/UsersServlet" method="post"> 	
			<table style="width: 33%">
				<tr>
					<td> Company ID:</td>
					<td><input type="text" name="companyID" /></td>
				</tr>
				<tr>
					<td> Job ID:</td>
					<td><input type="text" name="jobID" /></td>
				</tr>
				<tr>
					<td> 2 Abbreviation of State:</td>
					<td><input type="text" name="location" /></td>
				</tr>
				<tr>
					<td> Base Salary(hourly):</td>
					<td><input type="text" name="baseSalary" /></td>
				</tr>
				<tr>
					<td> Sign On Bonus(yearly):</td>
					<td><input type="text" name="signOnBonus" /></td>
				</tr>
				<tr>
					<td> Annual Bonus(yearly):</td>
					<td><input type="text" name="annualBonus" /></td>
				</tr>
				<tr>
					<td> Other Pay(yearly):</td>
					<td><input type="text" name="otherPay" /></td>
				</tr>
			</table>
			
			<input type = "submit" value = "Submit" />
		</form>
	</div>
</body>
</html>
