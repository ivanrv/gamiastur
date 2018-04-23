package com.gamitour.accion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.service.ServiceActividad;
import com.gamitour.service.ServiceActividadImp;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.service.ServiceItinerario;
import com.gamitour.service.ServiceItinerarioImp;
import com.gamitour.service.ServiceMultimedia;
import com.gamitour.service.ServiceMultimediaImp;
import com.gamitour.service.ServiceNoticia;
import com.gamitour.service.ServiceNoticiaImp;
import com.gamitour.service.ServiceParada;
import com.gamitour.service.ServiceParadaImp;
import com.gamitour.service.ServicePremio;
import com.gamitour.service.ServicePremioImp;
import com.gamitour.service.ServicePruebaCultural;
import com.gamitour.service.ServicePruebaCulturalImp;
import com.gamitour.service.ServicePruebaDeportiva;
import com.gamitour.service.ServicePruebaDeportivaImp;
import com.gamitour.util.Accion;

public class MostrarUno extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {
		
		String url = "";
		
		ServiceCliente sCliente = new ServiceClienteImp();
		ServiceItinerario sItinerario = new ServiceItinerarioImp();
		ServiceMultimedia sMultimedia = new ServiceMultimediaImp();
		ServiceParada sParada = new ServiceParadaImp();
		ServicePruebaDeportiva sPruebaDeportiva = new ServicePruebaDeportivaImp();
		
		switch(request.getParameter("tipo")){
		
		case "cliente":
			request.setAttribute("cliente", sCliente.buscarPorEmail(request.getParameter("email")));
			url = "/content/admin/detalle/mostrarCliente.jsp";
			break;
			
		case "actividad":
			ServiceActividad sActividad = new ServiceActividadImp();
			request.setAttribute("actividad", sActividad.buscarPorNombre(request.getParameter("actividad")));
			url = "/content/admin/detalle/mostrarActividad.jsp";
			break;
			
		case "itinerario":
			request.setAttribute("itinerario", sItinerario.buscarPorNombre(request.getParameter("itinerario")));
			url = "/content/admin/detalle/mostrarItinerario.jsp";
			break;
			
		case "multimedia":
			request.setAttribute("multimedia", sMultimedia.buscarMultimedia(sCliente.buscarPorEmail(request.getParameter("email")), sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba"))));
			url = "/content/admin/detalle/mostrarMultimedia.jsp";
			break;
			
		case "noticia":
			ServiceNoticia sNoticia = new ServiceNoticiaImp();
			request.setAttribute("noticia", sNoticia.buscarPorNombre(request.getParameter("noticia")));
			url = "/content/admin/detalle/mostrarNoticia.jsp";
			break;
			
		case "parada":
			request.setAttribute("parada", sParada.buscarPorNombre(request.getParameter("parada")));
			url = "/content/admin/detalle/mostrarParada.jsp";
			break;
			
		case "premio":
			ServicePremio sPremio = new ServicePremioImp();
			request.setAttribute("premio", sPremio.buscarPorNombre(request.getParameter("premio")));
			url = "/content/admin/detalle/mostrarPremio.jsp";
			break;
			
		case "cultural":
			ServicePruebaCultural sPruebaCultural = new ServicePruebaCulturalImp();
			request.setAttribute("cultural", sPruebaCultural.buscarPorNombre(request.getParameter("prueba")));
			url = "/content/admin/detalle/mostrarCultural.jsp";
			break;
			
		case "deportiva":
			request.setAttribute("deportiva", sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba")));
			url = "/content/admin/detalle/mostrarDeportiva.jsp";
			break;
			
		}
		
		return url;
	}

}
