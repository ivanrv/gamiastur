package com.gamitour.accion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.service.*;
import com.gamitour.util.Accion;

public class MostrarAccion extends Accion {

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {

		ServiceCliente sCliente = new ServiceClienteImp();
		ServiceActividad sActividad = new ServiceActividadImp();
		ServiceComentario sComentario = new ServiceComentarioImp();
		ServiceClienteHasActividad sCliAct = new ServiceClienteHasActividadImp();
		ServiceItinerario sItinerario = new ServiceItinerarioImp();
		ServiceMultimedia sMultimedia = new ServiceMultimediaImp();
		ServiceNoticia sNoticia = new ServiceNoticiaImp();
		ServiceParada sParada = new ServiceParadaImp();
		ServicePremio sPremio = new ServicePremioImp();
		ServicePruebaCultural sPruebaCultural = new ServicePruebaCulturalImp();
		ServicePruebaDeportiva sPruebaDeportiva = new ServicePruebaDeportivaImp();
		ServiceVoto sVoto = new ServiceVotoImp();

		request.getSession().setAttribute("listaClientes", sCliente.buscarTodos());
		request.getSession().setAttribute("listaActividades", sActividad.buscarTodos());
		request.getSession().setAttribute("listaComentarios", sComentario.buscarTodos());
		request.getSession().setAttribute("listaItinerarios", sItinerario.buscarTodos());
		request.getSession().setAttribute("listaMultimedias", sMultimedia.buscarTodos());
		request.getSession().setAttribute("listaNoticias", sNoticia.buscarTodos());
		request.getSession().setAttribute("listaParadas", sParada.buscarTodos());
		request.getSession().setAttribute("listaPremios", sPremio.buscarTodos());
		request.getSession().setAttribute("listaCulturales", sPruebaCultural.buscarTodos());
		request.getSession().setAttribute("listaDeportivas", sPruebaDeportiva.buscarTodos());
		request.getSession().setAttribute("listaVotos", sVoto.buscarTodos());
		request.getSession().setAttribute("listaReservas", sCliAct.buscarTodos());

		if (request.getSession().getAttribute("flag") != null) {
			request.setAttribute("flag", request.getSession().getAttribute("flag"));
			request.getSession().removeAttribute("flag");
		}

		return "/content/admin/mostrarAdmin.jsp";
	}

}
