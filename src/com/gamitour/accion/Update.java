package com.gamitour.accion;

import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Itinerario;
import com.gamitour.modelo.Noticia;
import com.gamitour.modelo.Parada;
import com.gamitour.modelo.Premio;
import com.gamitour.modelo.Pruebacultural;
import com.gamitour.modelo.Pruebadeportiva;
import com.gamitour.service.ServiceActividad;
import com.gamitour.service.ServiceActividadImp;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.service.ServiceComentario;
import com.gamitour.service.ServiceComentarioImp;
import com.gamitour.service.ServiceImagenActividad;
import com.gamitour.service.ServiceImagenActividadImp;
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

public class Update extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		ServiceCliente sCliente = new ServiceClienteImp();
		ServiceItinerario sItinerario = new ServiceItinerarioImp();
		ServiceMultimedia sMultimedia = new ServiceMultimediaImp();
		ServiceParada sParada = new ServiceParadaImp();
		
		
		ServicePruebaDeportiva sPruebaDeportiva = new ServicePruebaDeportivaImp();
		

		switch(request.getParameter("tipo")){
		case "cliente":
			request.getSession().setAttribute("listaClientes", sCliente.buscarTodos());
			break;
			
		case "actividad":
			ServiceActividad sActividad = new ServiceActividadImp();
			ServiceImagenActividad sImgAct = new ServiceImagenActividadImp();
			try {
				Actividad actividad = sActividad.buscarPorNombre(request.getParameter("nombre"));
				
				actividad.setFechainicio(sdf.parse(request.getParameter("inicio")));
				actividad.setLatitud(request.getParameter("lat"));
				actividad.setLongitud(request.getParameter("lng"));
				actividad.setPrecio(Float.parseFloat(request.getParameter("precio")));
				actividad.setPuntos(Integer.parseInt(request.getParameter("puntos")));
				
				if(request.getPart("archivo") != null)
					actividad.getImagenactividads().iterator().next().setArchivo("/actividades/" + request.getParameter("nombre") + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				if(!request.getParameter("fin").equals(""))
					actividad.setFechafin(sdf.parse(request.getParameter("fin")));
				
				if(!request.getParameter("archivoTitulo").equals(""))
					actividad.getImagenactividads().iterator().next().setTitulo(request.getParameter("titulo"));
				
				sImgAct.actualizar(actividad.getImagenactividads().iterator().next());
				sActividad.actualizar(actividad);
				request.getSession().setAttribute("listaActividades", sActividad.buscarTodos());
			} catch (NumberFormatException | ParseException | IOException | ServletException e) {
				e.printStackTrace();
			}			
			break;
			
		case "comentario":
			ServiceComentario sComentario = new ServiceComentarioImp();
			request.getSession().setAttribute("listaComentarios", sComentario.buscarTodos());
			break;
			
		case "itinerario":
			Itinerario itinerario = sItinerario.buscarPorNombre(request.getParameter("nombre"));
			
			itinerario.setCategoria(request.getParameter("categoria"));
			itinerario.setDuracion(request.getParameter("duracion"));
			itinerario.setLatitud(request.getParameter("lat"));
			itinerario.setLongitud(request.getParameter("lng"));
			
			sItinerario.actualizar(itinerario);
			request.getSession().setAttribute("listaItinerarios", sItinerario.buscarTodos());
			break;
			
		case "multimedia":
			request.getSession().setAttribute("listaMultimedias", sMultimedia.buscarTodos());
			break;
			
		case "noticia":
			ServiceNoticia sNoticia = new ServiceNoticiaImp();
			Noticia noticia;
			try {
				noticia = sNoticia.buscarPorNombre(request.getParameter("nombre"));
				
				noticia.setFechaalta(sdf.parse(request.getParameter("alta")));				
				noticia.setTexto(request.getParameter("texto"));
				
				if(request.getPart("archivo") != null)
					noticia.setImagen("/noticias/" + noticia.getNombre() + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				if(!request.getParameter("caducidad").equals(""))
					noticia.setFechacaducidad(sdf.parse(request.getParameter("caducidad")));
				
				sNoticia.actualizar(noticia);
				request.getSession().setAttribute("listaNoticias", sNoticia.buscarTodos());
			} catch (ParseException | IOException | ServletException e) {
				e.printStackTrace();
			}
			break;
			
		case "parada":
			Parada parada = sParada.buscarPorNombre(request.getParameter("nombre"));
			
			parada.setItinerario(sItinerario.buscarPorNombre(request.getParameter("itinerario")));
			parada.setNumeroParada(Integer.parseInt(request.getParameter("nParada")));
			
			if(!request.getParameter("historia").equals(""))
				parada.setHistoria(request.getParameter("historia"));
			
			if(!request.getParameter("anecdotario").equals(""))
				parada.setAnecdotario(request.getParameter("anecdotario"));
			
			if(!request.getParameter("gastronomia").equals(""))
				parada.setGastronomia(request.getParameter("gastronomia"));
			
			try {
				if(request.getPart("archivoImg") != null)
					parada.setImagen("/paradas/" + parada.getNombre() + "-" + Paths.get(request.getPart("archivoImg").getSubmittedFileName()).getFileName().toString());
				
				if(request.getPart("archivoVideo") != null)
					parada.setVideo("/paradas/" + parada.getNombre() + "-" + Paths.get(request.getPart("archivoVideo").getSubmittedFileName()).getFileName().toString());
			} catch (IOException | ServletException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			parada.setLatitud(request.getParameter("lat"));
			parada.setLongitud(request.getParameter("lng"));
			
			sParada.actualizar(parada);
			request.getSession().setAttribute("listaParadas", sParada.buscarTodos());
			break;
			
		case "premio":
			ServicePremio sPremio = new ServicePremioImp();
			request.getSession().setAttribute("listaPremios", sPremio.buscarTodos());
			break;
			
		case "cultural":
			ServicePruebaCultural sPruebaCultural = new ServicePruebaCulturalImp();
			Pruebacultural cultural = sPruebaCultural.buscarPorNombre(request.getParameter("nombre"));
			
			cultural.setParada(sParada.buscarPorNombre(request.getParameter("parada")));
			cultural.setPregunta(request.getParameter("pregunta"));
			cultural.setRespuesta(request.getParameter("respuesta"));
			cultural.setPuntos(Integer.parseInt(request.getParameter("puntos")));
			
			sPruebaCultural.actualizar(cultural);
			request.getSession().setAttribute("listaCulturales", sPruebaCultural.buscarTodos());
			break;
			
		case "deportiva":
			try {
				Pruebadeportiva deportiva = sPruebaDeportiva.buscarPorNombre(request.getParameter("nombre"));
				
				deportiva.setParada(sParada.buscarPorNombre(request.getParameter("parada")));
				deportiva.setFechainicio(sdf.parse(request.getParameter("inicio")));				
				deportiva.setPuntos(Integer.parseInt(request.getParameter("puntos")));
				
				if(!request.getParameter("fin").equals(""))
					deportiva.setFechafin(sdf.parse(request.getParameter("fin")));
				
				if(request.getPart("archivo") != null)
					deportiva.setExplicacion("/deportivas/" + deportiva.getNombre() + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				sPruebaDeportiva.actualizar(deportiva);
				request.getSession().setAttribute("listaDeportivas", sPruebaDeportiva.buscarTodos());
			} catch (NumberFormatException | ParseException | IOException | ServletException e) {
				e.printStackTrace();
			}
			break;
			
		case "voto":
			ServiceVoto sVoto = new ServiceVotoImp();
			request.getSession().setAttribute("listaVotos", sVoto.buscarTodos());
			break;
		}		
		
		return "/content/admin/mostrarAdmin.jsp";
	}

}
