package com.gamitour.controlador;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

import com.gamitour.service.ServiceImagenActividad;
import com.gamitour.service.ServiceImagenActividadImp;
import com.gamitour.util.Accion;

/**
 * Servlet implementation class ClienteController
 */
@MultipartConfig
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
		try {
			switch(request.getParameter("tipo")) {
			case "actividad":
				
				String directorio = request.getContextPath() + "/uploads/actividades/";
				System.out.println(directorio);
				
				String fileName = request.getParameter("nombre");
				Part archivo = request.getPart("archivo");
				
				fileName += "-" + Paths.get(archivo.getSubmittedFileName()).getFileName().toString();
				
				System.out.println(fileName);
				
				InputStream archivoStream = archivo.getInputStream();
				File archivoSalida = new File(directorio + fileName);
				FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
				archivoStream.close();
				
				break;
			}
		}catch(NullPointerException e) {
			System.out.println("Nullpointer lokete.");
		}
		
		
		
		doGet(request, response);
	}

}
