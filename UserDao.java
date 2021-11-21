package net.javaguides.registration.dao;
//write JDBC code to connect MySQL'
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.javaguides.registration.model.User;

public class UserDao {
	public int insert2DB(User user) throws ClassNotFoundException{



		int maxUserID =0;

		//


		Class.forName("com.mysql.jdbc.Driver");
		String database = "cs157aprojectteam12";
		String username = "root";
		String pwd = "Dabi464404";

		//connect MySQL
		try{Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database + "?autoReconnect=true&useSSL=false",username, pwd);

		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT MAX(userID) AS MaxUserID FROM UserCompensation");


		while(rs.next()){
			maxUserID = rs.getInt(1) + 1;
			System.out.println("maxUserID is:"+maxUserID);
		}



		}catch(SQLException e) {
			e.printStackTrace();
		}

		String INSERT_USERS_SQL = "INSERT INTO UserCompensation" + 
				"(userID, companyID, jobID, location, base_salary, sign_on_bonus, annual_bonus, other_pay) VALUES " +
				"(?, ?, ?, ?, ?, ?, ?, ?);";

		int result =0;

		Class.forName("com.mysql.jdbc.Driver");
		String database2 = "cs157aprojectteam12";
		String username2 = "root";
		String pwd2 = "Dabi464404";

		//connect MySQL
		try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database2 + "?autoReconnect=true&useSSL=false",
				username2, pwd2);


			PreparedStatement prepareStatement = connection.prepareStatement(INSERT_USERS_SQL)){
			prepareStatement.setInt(1, maxUserID);
			prepareStatement.setString(2, user.getCompanyID());
			prepareStatement.setString(3, user.getJobID());
			prepareStatement.setString(4, user.getLocation());
			prepareStatement.setString(5, user.getBaseSalary());
			prepareStatement.setString(6, user.getSignOnBonus());
			prepareStatement.setString(7, user.getAnnualBonus());
			prepareStatement.setString(8, user.getOtherPay());

			System.out.println(prepareStatement);

			result = prepareStatement.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;

	}




}
