package com.gamitour.controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.util.Accion;

/**
 * Servlet implementation class ClienteController
 */
@WebServlet("/ClienteController")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher despachador = null;
		Accion accion = null;
		
		String url = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		accion = Accion.getAccion(url.substring(1, url.length()-3));
		
		String ejecutar = accion.ejecutar(request, response);
		
		despachador = request.getRequestDispatcher(ejecutar);
		
		if(ejecutar.equals("/index.html")){
			response.sendRedirect(request.getContextPath() + ejecutar);
		}else{
			despachador.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
