//package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.UserDao;
import net.javaguides.registration.model.User;
/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/userSubmitCompForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String companyID = request.getParameter("companyID");
		String jobID = request.getParameter("jobID");
		String location = request.getParameter("location");
		String baseSalary = request.getParameter("baseSalary");
		String signOnBonus = request.getParameter("signOnBonus");
		String annualBonus = request.getParameter("annualBonus");
		String otherPay = request.getParameter("otherPay");

		User user = new User();
		user.setCompanyID(companyID);
		user.setJobID(jobID);
		user.setLocation(location);
		user.setBaseSalary(baseSalary);
		user.setSignOnBonus(signOnBonus);
		user.setAnnualBonus(annualBonus);
		user.setOtherPay(otherPay);

		try {
			userDao.insert2DB(user);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/userdetails.jsp");
		dispatcher.forward(request, response);
	}

}
