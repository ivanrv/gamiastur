package com.gamitour.accion;

import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Imagenactividad;
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
import com.gamitour.service.ServiceRol;
import com.gamitour.service.ServiceRolImp;
import com.gamitour.service.ServiceVoto;
import com.gamitour.service.ServiceVotoImp;
import com.gamitour.util.Accion;

public class Nuevo extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		ServiceCliente sCliente = new ServiceClienteImp();
		ServiceItinerario sItinerario = new ServiceItinerarioImp();
		ServiceMultimedia sMultimedia = new ServiceMultimediaImp();
		ServiceParada sParada = new ServiceParadaImp();
		ServicePruebaDeportiva sPruebaDeportiva = new ServicePruebaDeportivaImp();
		ServiceRol sRol = new ServiceRolImp();
		String retorno = "";
		

		switch(request.getParameter("tipo")){
		case "cliente":
			
			String telefono, direccion, codigopostal, avatar;
			
			if(request.getParameter("telefono") == ""){
				telefono = null;
			}else{
				telefono = request.getParameter("telefono");
			}
			
			if(request.getParameter("direccion") == ""){
				direccion = null;
			}else{
				direccion = request.getParameter("direccion");
			}
			
			if(request.getParameter("CP") == ""){
				codigopostal = null;
			}else{
				codigopostal = request.getParameter("CP");
			}
			
			if(request.getParameter("avatar") == null){
				avatar = null;
			}else{
				avatar = request.getParameter("avatar");
			}
			
			Cliente cliente;
			try {
				cliente = new Cliente(sRol.buscarPorNombre("user"), request.getParameter("nombre"), request.getParameter("apellidos"), sdf.parse(request.getParameter("fechaNac")), request.getParameter("email"), request.getParameter("password"), telefono, direccion, codigopostal, avatar, 0, new Date());
				sCliente.insertar(cliente);
				
				System.out.println("tamos cool");
				
				request.getSession().setAttribute("userRol", cliente.getRol().getNombre());
				request.getSession().setAttribute("username",
						cliente.getNombre() + " " + cliente.getApellidos().substring(0, cliente.getApellidos().indexOf(" ")));
				request.getSession().setAttribute("userEmail", cliente.getEmail());
				
				retorno = "/content/user/index.jsp";
			
			} catch (ParseException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			break;
			
		case "actividad":
			ServiceActividad sActividad = new ServiceActividadImp();
			ServiceImagenActividad sImgActividad = new ServiceImagenActividadImp();
			try {
				Actividad actividad = new Actividad(request.getParameter("nombre"), sdf.parse(request.getParameter("inicio")), 0, Double.parseDouble(request.getParameter("precio")), Integer.parseInt(request.getParameter("puntos")), request.getParameter("lat"), request.getParameter("lng"));
				
				if(!request.getParameter("fin").equals(""))
					actividad.setFechafin(sdf.parse(request.getParameter("fin")));
				
				sActividad.insertar(actividad);
				
				Imagenactividad imagen = new Imagenactividad(sActividad.buscarPorNombre(actividad.getNombre()), "/actividades/" + request.getParameter("nombre") + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				if(!request.getParameter("archivoTitulo").equals(""))
					imagen.setTitulo(request.getParameter("archivoTitulo"));
					
				sImgActividad.insertar(imagen);
				
				request.getSession().setAttribute("listaActividades", sActividad.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException | IOException | ServletException e) {
				e.printStackTrace();
			}			
			break;
			
		case "comentario":
			ServiceComentario sComentario = new ServiceComentarioImp();
			request.getSession().setAttribute("listaComentarios", sComentario.buscarTodos());
			break;
			
		case "itinerario":
			Itinerario itinerario = new Itinerario(0, request.getParameter("nombre"), request.getParameter("categoria"), request.getParameter("duracion"), request.getParameter("lat"), request.getParameter("lng"));
			sItinerario.insertar(itinerario);
			request.getSession().setAttribute("listaItinerarios", sItinerario.buscarTodos());
			if(request.getSession().getAttribute("itinerarios") != null)
				request.getSession().setAttribute("itinerarios", sItinerario.buscarNombres());
			retorno = "/content/admin/mostrarAdmin.jsp";
			break;
			
		case "multimedia":
			request.getSession().setAttribute("listaMultimedias", sMultimedia.buscarTodos());
			break;
			
		case "noticia":
			ServiceNoticia sNoticia = new ServiceNoticiaImp();
			Noticia noticia;
			try {
				noticia = new Noticia(0, request.getParameter("nombre"), request.getParameter("texto"), sdf.parse(request.getParameter("alta")), null); //HAY QUE CAMBIAR EL NULL DE LA IMAGEN
				
				if(!request.getParameter("caducidad").equals(""))
					noticia.setFechacaducidad(sdf.parse(request.getParameter("caducidad")));
				
				noticia.setImagen("/noticias/" + noticia.getNombre() + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				sNoticia.insertar(noticia);
				request.getSession().setAttribute("listaNoticias", sNoticia.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (ParseException | IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "parada":
			Parada parada = new Parada(0, sItinerario.buscarPorNombre(request.getParameter("itinerario")), request.getParameter("nombre"), Integer.parseInt(request.getParameter("nParada")), request.getParameter("lat"), request.getParameter("lng"));
			
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
			
			sParada.insertar(parada);
			request.getSession().setAttribute("listaParadas", sParada.buscarTodos());
			retorno = "/content/admin/mostrarAdmin.jsp";
			break;
			
		case "premio":
			ServicePremio sPremio = new ServicePremioImp();
			Premio premio;
			try {
				premio = new Premio(null, request.getParameter("nombre"), request.getParameter("descripcion"), sdf.parse(request.getParameter("activacion")), Integer.parseInt(request.getParameter("puntos")));
				
				if(request.getPart("archivo") != null)
					premio.setImagen("/premios/" + premio.getNombre() + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
				
				sPremio.insertar(premio);			
				request.getSession().setAttribute("listaPremios", sPremio.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException | IOException | ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
			
		case "cultural":
			ServicePruebaCultural sPruebaCultural = new ServicePruebaCulturalImp();
			Pruebacultural cultural = new Pruebacultural(sParada.buscarPorNombre(request.getParameter("parada")), request.getParameter("nombre"), request.getParameter("pregunta"), request.getParameter("respuesta"), Integer.parseInt(request.getParameter("puntos")));
			sPruebaCultural.insertar(cultural);
			request.getSession().setAttribute("listaCulturales", sPruebaCultural.buscarTodos());
			retorno = "/content/admin/mostrarAdmin.jsp";
			break;
			
		case "deportiva":
			try {
				Pruebadeportiva deportiva = new Pruebadeportiva(sParada.buscarPorNombre(request.getParameter("parada")), request.getParameter("nombre"), sdf.parse(request.getParameter("inicio")), Integer.parseInt(request.getParameter("puntos")));
				
				if(!request.getParameter("fin").equals(""))
					deportiva.setFechafin(sdf.parse(request.getParameter("fin")));
				
				deportiva.setExplicacion("/deportivas/" + deportiva.getNombre() + "-" + Paths.get(request.getPart("archivo").getSubmittedFileName()).getFileName().toString());
					
				sPruebaDeportiva.insertar(deportiva);
				request.getSession().setAttribute("listaDeportivas", sPruebaDeportiva.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException | IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "voto":
			ServiceVoto sVoto = new ServiceVotoImp();
			request.getSession().setAttribute("listaVotos", sVoto.buscarTodos());
			break;
		}		
		
		return retorno;
	}

}
