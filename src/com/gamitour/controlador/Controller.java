package com.gamitour.controlador;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

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
		
		if(ejecutar.equals("/index.jsp")){
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}else if(ejecutar.equals("Admin.do")){
			response.sendRedirect("/Admin.do");
		}else if(ejecutar.equals("Logout.do")){
			response.sendRedirect("Logout.do");
		}else if(ejecutar.equals("misActs")) {
			response.sendRedirect("/content/user/misActividades.jsp");
		}else if(ejecutar.equals("perfil.jsp")) {
			response.sendRedirect(request.getContextPath() + "/content/user/perfil.jsp");
		}else if(ejecutar.equals("misPrem")){
			response.sendRedirect(request.getContextPath() + "/content/user/misPremios.jsp");
		}else{
			despachador.forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath().substring(request.getServletPath().lastIndexOf("/"));
		String directorio;
		String fileName;
		Part archivo;
		InputStream archivoStream;
		File archivoSalida;
		Calendar fecha = Calendar.getInstance();
		
		if((request.getParameter("tipo") != null) && (!url.substring(1, url.length()-3).equals("Eliminar")) && (!url.substring(1, url.length()-3).equals("Admin")) && (!url.substring(1, url.length()-3).equals("Mostrar"))){
			switch(request.getParameter("tipo")) {
			case "actividad":
				if(request.getPart("archivo") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/actividades/";
					
					fileName = "ACT";
					archivo = request.getPart("archivo");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
									
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				break;
				
			case "parada":
				directorio = "/opt/tomcat/webapps/uploads/gamitour/paradas/";
				if(request.getPart("archivoImg") != null){					
					
					fileName = "PAR_IMG";
					archivo = request.getPart("archivoImg");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
									
					request.setAttribute("fileNameImg", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				
				
				if(request.getPart("archivoVideo") != null){
					fileName = "PAR_VID";
					archivo = request.getPart("archivoVideo");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
							
					request.setAttribute("fileNameVid", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				
				break;
				
			case "noticia":
				if(request.getPart("archivo") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/noticias/";
					
					fileName = "NOT";
					archivo = request.getPart("archivo");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
					
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				break;
				
			case "premio":
				if(request.getPart("archivo") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/premios/";
					
					fileName = "PRE";
					archivo = request.getPart("archivo");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
							
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				
				break;
				
			case "deportiva":
				if(request.getPart("archivo") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/deportivas/";
					
					fileName = "DEP";
					archivo = request.getPart("archivo");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
						
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				break;
			case "multimediaImg":
				if (request.getPart("archivoImg") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/multimedias/";
					
					fileName = "MUL";
					archivo = request.getPart("archivoImg");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
					
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				break;
				
			case "multimediaVid":
				if (request.getPart("archivoVideo") != null){
					directorio = "/opt/tomcat/webapps/uploads/gamitour/multimedias/";
					
					fileName = "MUL";
					archivo = request.getPart("archivoVid");
					
					fileName += "-" + fecha.getTimeInMillis() + "_" + fecha.get(Calendar.MONTH) + "_" + fecha.get(Calendar.YEAR) + "." + FilenameUtils.getExtension(archivo.getSubmittedFileName());
					
					request.setAttribute("fileName", fileName);
					archivoStream = archivo.getInputStream();
					archivoSalida = new File(directorio + fileName);
					FileUtils.copyInputStreamToFile(archivoStream, archivoSalida);
					archivoStream.close();
				}
				break;
			}
		}	
		
		doGet(request, response);
	}

}
