package com.gamitour.accion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
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
			try {
				Actividad actividad = new Actividad(request.getParameter("nombre"), sdf.parse(request.getParameter("inicio")), 0, Double.parseDouble(request.getParameter("precio")), Integer.parseInt(request.getParameter("puntos")), request.getParameter("ubicacion"), request.getParameter("ubicacion"));
				sActividad.insertar(actividad);
				request.getSession().setAttribute("listaActividades", sActividad.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException e) {
				e.printStackTrace();
			}			
			break;
			
		case "comentario":
			ServiceComentario sComentario = new ServiceComentarioImp();
			request.getSession().setAttribute("listaComentarios", sComentario.buscarTodos());
			break;
			
		case "itinerario":
			Itinerario itinerario = new Itinerario(0, request.getParameter("nombre"), request.getParameter("categoria"), request.getParameter("duracion"), request.getParameter("ubicacion"), request.getParameter("ubicacion"));
			sItinerario.insertar(itinerario);
			request.getSession().setAttribute("listaItinerarios", sItinerario.buscarTodos());
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
				sNoticia.insertar(noticia);
				request.getSession().setAttribute("listaNoticias", sNoticia.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "parada":
			Parada parada = new Parada(0, sItinerario.buscarPorNombre(request.getParameter("itinerario")), request.getParameter("nombre"), Integer.parseInt(request.getParameter("nParada")), request.getParameter("ubicacion"), request.getParameter("ubicacion"));
			sParada.insertar(parada);
			request.getSession().setAttribute("listaParadas", sParada.buscarTodos());
			break;
			
		case "premio":
			ServicePremio sPremio = new ServicePremioImp();
			Premio premio;
			try {
				premio = new Premio(sCliente.buscarPorEmail(request.getParameter("cliente")), request.getParameter("nombre"), request.getParameter("descripcion"), request.getParameter("imagen"), sdf.parse(request.getParameter("activacion")), sdf.parse(request.getParameter("consumo")), Integer.parseInt(request.getParameter("puntos")));
				sPremio.insertar(premio);
				request.getSession().setAttribute("listaPremios", sPremio.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException e1) {
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
				sPruebaDeportiva.insertar(deportiva);
				request.getSession().setAttribute("listaDeportivas", sPruebaDeportiva.buscarTodos());
				retorno = "/content/admin/mostrarAdmin.jsp";
			} catch (NumberFormatException | ParseException e) {
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
