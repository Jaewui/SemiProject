package com.kr.semiProject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kr.semiProject.board.model.BoardDAO;
import com.kr.semiProject.board.model.BoardVO;

@WebServlet("/boardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		//해당 번호
		int num = 	Integer.parseInt(request.getParameter("num"));
		
		//데이터 베이스에서 하나의 게시글에 대한 정보를 리턴 메소드 호출 
		BoardDAO bdao = new BoardDAO();
		BoardVO bean = bdao.getOneUpdateBoard(num);

		request.setAttribute("bean", bean);
		
		

		RequestDispatcher dis = request.getRequestDispatcher("BoardUpdateForm.jsp");
		dis.forward(request ,response);
	}

}
