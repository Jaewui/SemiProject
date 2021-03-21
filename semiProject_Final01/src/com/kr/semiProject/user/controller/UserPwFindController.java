package com.kr.semiProject.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kr.semiProject.user.model.UserDAOImpl;

@WebServlet("/userPwFind.do")
public class UserPwFindController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("userId");
		String name = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		
		UserDAOImpl userDAO = new UserDAOImpl();
		String pw = userDAO.getUserPw(id, name, email);
		request.setAttribute("userId", id);
		request.setAttribute("userPw", pw);
		
		if(pw.equals("")) {
			response.sendRedirect("/semiProject_Final/userFindFailed.jsp");
		}else {
			response.sendRedirect("/semiProject_Final/userPwUpd.jsp");
		}
	}
}


