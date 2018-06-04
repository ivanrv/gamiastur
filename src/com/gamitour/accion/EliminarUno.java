package com.gamitour.accion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.gamitour.service.ServiceActividad;
import com.gamitour.service.ServiceActividadImp;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.service.ServiceComentario;
import com.gamitour.service.ServiceComentarioImp;
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
import com.gamitour.service.ServiceVoto;
import com.gamitour.service.ServiceVotoImp;
import com.gamitour.util.Accion;

public class EliminarUno extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {
		
		String retorno = null;
		
		ServiceCliente sCliente = new ServiceClienteImp();
		ServiceActividad sActividad = new ServiceActividadImp();
		ServiceComentario sComentario = new ServiceComentarioImp();
		ServiceItinerario sItinerario = new ServiceItinerarioImp();
		ServiceMultimedia sMultimedia = new ServiceMultimediaImp();
		ServiceNoticia sNoticia = new ServiceNoticiaImp();
		ServiceParada sParada = new ServiceParadaImp();
		ServicePremio sPremio = new ServicePremioImp();
		ServicePruebaCultural sPruebaCultural = new ServicePruebaCulturalImp();
		ServicePruebaDeportiva sPruebaDeportiva = new ServicePruebaDeportivaImp();
		ServiceVoto sVoto = new ServiceVotoImp();
		
		switch(request.getParameter("tipo")){
		case "cliente":
			sCliente.borrar(sCliente.buscarPorEmail(request.getParameter("email")));
			request.getSession().setAttribute("listaClientes", sCliente.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "clienteUSER":
			sCliente.borrar(sCliente.buscarPorEmail(request.getParameter("email")));
			retorno = "/index.jsp";
			break;
			
		case "actividad":
			sActividad.borrar(sActividad.buscarPorNombre(request.getParameter("actividad")));
			request.getSession().setAttribute("listaActividades", sActividad.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "comentario":
			sComentario.buscarComentario(sCliente.buscarPorEmail(request.getParameter("email")), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail(request.getParameter("emailMult")), sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba"))));
			request.getSession().setAttribute("listaComentarios", sComentario.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "itinerario":
			sItinerario.borrar(sItinerario.buscarPorNombre(request.getParameter("itinerario")));
			request.getSession().setAttribute("listaItinerarios", sItinerario.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "multimedia":
			sMultimedia.borrar(sMultimedia.buscarMultimedia(sCliente.buscarPorEmail(request.getParameter("email")), sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba"))));
			request.getSession().setAttribute("listaMultimedias", sMultimedia.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "noticia":
			sNoticia.borrar(sNoticia.buscarPorNombre(request.getParameter("noticia")));
			request.getSession().setAttribute("listaNoticias", sNoticia.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "parada":
			sParada.borrar(sParada.buscarPorNombre(request.getParameter("parada")));
			request.getSession().setAttribute("listaParadas", sParada.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "premio":
			sPremio.borrar(sPremio.buscarPorNombre(request.getParameter("premio")));
			request.getSession().setAttribute("listaPremios", sPremio.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "cultural":
			sPruebaCultural.borrar(sPruebaCultural.buscarPorNombre(request.getParameter("prueba")));
			request.getSession().setAttribute("listaCulturales", sPruebaCultural.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "deportiva":
			sPruebaDeportiva.borrar(sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba")));
			request.getSession().setAttribute("listaDeportivas", sPruebaDeportiva.buscarTodos());
			retorno = "Admin.do";
			break;
			
		case "voto":
			sVoto.borrar(sVoto.buscarVoto(sCliente.buscarPorEmail(request.getParameter("email")), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail(request.getParameter("emailMult")), sPruebaDeportiva.buscarPorNombre(request.getParameter("prueba")))));
			request.getSession().setAttribute("listaVotos", sVoto.buscarTodos());
			retorno = "Admin.do";
			break;
		}
		
		return retorno;
	}

}
