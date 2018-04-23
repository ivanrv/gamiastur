package com.gamitour.util;

import java.util.Date;
import java.util.HashSet;

import com.gamitour.modelo.*;
import com.gamitour.service.*;

public class Principal {
	
	ServiceCliente sCliente;
	ServiceRol sRol;
	ServiceActividad sActividad;
	ServiceComentario sComentario;
	ServiceItinerario sItinerario;
	ServiceMultimedia sMultimedia;
	ServiceNoticia sNoticia;
	ServiceParada sParada;
	ServicePremio sPremio;
	ServicePruebaCultural sPruebaCultural;
	ServicePruebaDeportiva sPruebaDeportiva;
	ServiceVoto sVoto;
	
	public Principal(){
		sCliente = new ServiceClienteImp();
		sRol = new ServiceRolImp();
		sActividad = new ServiceActividadImp();
		sComentario = new ServiceComentarioImp();
		sItinerario = new ServiceItinerarioImp();
		sMultimedia = new ServiceMultimediaImp();
		sNoticia = new ServiceNoticiaImp();
		sParada = new ServiceParadaImp();
		sPremio = new ServicePremioImp();
		sPruebaCultural = new ServicePruebaCulturalImp();
		sPruebaDeportiva = new ServicePruebaDeportivaImp();
		sVoto = new ServiceVotoImp();
	}

	public static void main(String[] args) {
		Principal p = new Principal();
		
		p.pruebasRol();
		
		p.pruebasCliente();
		
		//p.pruebasActividad();
		
		//p.pruebasComentario();
		
		//p.pruebasItinerario();
		
		//p.pruebasMultimedia();
		
		//p.pruebasNoticia();
		
		//p.pruebasParada();
		
		//p.pruebasPremio();
		
		//p.pruebasPruebaCultural();
		
		//p.pruebasPruebaDeportiva();
		
		//p.pruebasVoto();
		
	}
	
	public void pruebasRol(){
		//pruebas tabla rol
				
		
		Rol rol = new Rol("user", new HashSet<Cliente>(0));
		sRol.insertar(rol);
		
		
		//System.out.println("IDRol: " + sRol.buscarPorNombre("user").getIdrol());
		
		/*
		for(Rol r:sRol.buscarTodos()){
			System.out.println("ID: " + r.getIdrol() + " || Nombre: " + r.getNombre());
		}
		*/
		
		//sRol.borrar(sRol.buscarPorNombre("usuario"));
		
		/*
		Rol rol = sRol.buscarPorNombre("user");	
		rol.setNombre("usuario");
		sRol.actualizar(rol);
		*/
	}
	
	public void pruebasCliente(){
		//pruebas tabla cliente
		
		
		Cliente cliente = new Cliente(sRol.buscarPorNombre("user"), "ivan", "rguez", new Date(), "email", "1234", "987", "direccion", "33700", "avatar", 200, new Date(), null, null, null, null, null);
		sCliente.insertar(cliente);
		
		
		//System.out.println("Nombre: " + sCliente.buscarPorEmail("email").getNombre());
		
		/*
		for(Cliente c:sCliente.buscarTodos()){
			System.out.println("Nombre: " + c.getNombre() + " || Email: " + c.getEmail());
		}
		*/
		
		//sCliente.borrar(sCliente.buscarPorEmail("email"));
		
		/*
		Cliente cliente = sCliente.buscarPorEmail("email");
		cliente.setNombre("nuevoNombre");
		sCliente.actualizar(cliente);
		*/
	}

	public void pruebasActividad(){
		//pruebas tabla actividad
		
		/*
		HashSet<Cliente> clientes = new HashSet<Cliente>();
		clientes.add(sCliente.buscarPorEmail("email"));
		Actividad actividad = new Actividad("act", new Date(), new Date(), "ubicacion", clientes.size(), (float) 12, "imagen", 50, clientes);
		sActividad.insertar(actividad);
		*/
		
		//System.out.println("Ubicacion: " + sActividad.buscarPorNombre("act").getUbicacion());
		
		/*
		for(Actividad a: sActividad.buscarTodos()){
			System.out.println("Nombre: " + a.getNombre());
		}
		*/
		
		//sActividad.borrar(sActividad.buscarPorNombre("act"));
		
		/*
		Actividad actividad = sActividad.buscarPorNombre("act");
		actividad.setImagen("img");
		sActividad.actualizar(actividad);
		*/
	}
	
	public void pruebasComentario(){
		//pruebas tabla comentario
		
		/*
		Cliente cliente = sCliente.buscarPorEmail("email");
		PruebaDeportiva prueba = sPruebaDeportiva.buscarPorNombre("dep1");
		Multimedia multimedia = sMultimedia.buscarMultimedia(cliente, prueba);
		 */
		
		/*
		Comentario comentario = new Comentario(sCliente.buscarPorEmail("email"), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1")), "texto");
		sComentario.insertar(comentario);
		*/
		
		//System.out.println("Contenido comentario: " + sComentario.buscarComentario(cliente, multimedia).getTexto());
		
		/*
		for(Comentario c: sComentario.buscarTodos()){
			System.out.println("Contenido comentario: " + c.getTexto() + " || Autor: " + c.getCliente().getNombre());
		}
		*/
	
		//sComentario.borrar(sComentario.buscarComentario(cliente, multimedia));
	
		/*
		Comentario comentario = sComentario.buscarComentario(cliente, multimedia);
		comentario.setTexto("Comentario");
		sComentario.actualizar(comentario);
		*/
	}
	
	public void pruebasItinerario(){
		//pruebas tabla itinerario
		
		/*
		Itinerario itinerario = new Itinerario("it1", "categoria", "duracion", "ubicacion", null);
		sItinerario.insertar(itinerario);
		*/
		
		//System.out.println("Duracion itinerario: " + sItinerario.buscarPorNombre("it1").getDuracion());
		
		/*
		for(Itinerario i: sItinerario.buscarTodos()){
			System.out.println("Nombre de itinerario: " + i.getNombre());
		}
		*/
		
		//sItinerario.borrar(sItinerario.buscarPorNombre("it1"));
		
		/*
		Itinerario itinerario = sItinerario.buscarPorNombre("it1");
		itinerario.setDuracion("larga");
		sItinerario.actualizar(itinerario);
		*/
	}
	
	public void pruebasMultimedia(){
		//pruebas tabla multimedia
		
		/*
		Multimedia multimedia = new Multimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1"), new Date(), "comentario", "imagen", "video", 150, null, null);
		sMultimedia.insertar(multimedia);
		*/
		
		//System.out.println("Fecha: " + sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1")).getFecha());
		
		/*
		for(Multimedia m: sMultimedia.buscarTodos()){
			System.out.println("Prueba: " +m.getPruebaDeportiva().getNombre() + " || Autor: " + m.getCliente().getNombre());
		}
		*/
		
		//sMultimedia.borrar(sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1")));
		
		/*
		Multimedia multimedia = sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1"));
		multimedia.setComentario("Nuevo comentario");
		sMultimedia.actualizar(multimedia);
		*/
	}
	
	public void pruebasNoticia(){
		//pruebas tabla noticia
		
		/*
		Noticia noticia = new Noticia("not1", "texto", new Date(), new Date(), "imagen");
		sNoticia.insertar(noticia);
		*/
		
		//System.out.println("Contenido: " + sNoticia.buscarPorNombre("not1").getTexto());
		
		/*
		for(Noticia n: sNoticia.buscarTodos()){
			System.out.println("Nombre: " + n.getNombre());
		}
		*/
		
		//sNoticia.borrar(sNoticia.buscarPorNombre("not1"));
		
		/*
		Noticia noticia = sNoticia.buscarPorNombre("not1");
		noticia.setTexto("Contenido noticia");
		sNoticia.actualizar(noticia);
		*/
	}
	
	public void pruebasParada(){
		//pruebas tabla parada
		
		/*
		Parada parada = new Parada(sItinerario.buscarPorNombre("it1"), "parada1", 1, "ubicacion", "historia", "anecdotario", "gastronomia", "imagen", null, null);
		sParada.insertar(parada);
		*/
		
		//System.out.println("Numero de parada: " + sParada.buscarPorNombre("parada1").getNumeroParada());
		
		/*
		for(Parada p: sParada.buscarTodos()){
			System.out.println("Nombre: " + p.getNombre());
		}
		*/
		
		//sParada.borrar(sParada.buscarPorNombre("parada1"));
		
		/*
		Parada parada = sParada.buscarPorNombre("parada1");
		parada.setAnecdotario("Muchas anecdotas");
		sParada.actualizar(parada);
		*/
	}
	
	public void pruebasPremio(){
		//pruebas tabla premio
		
		/*
		Premio premio = new Premio(sCliente.buscarPorEmail("email"), "prem1", "descripcion", "imagen", new Date(), new Date(), 50);
		sPremio.insertar(premio);
		*/
		
		//System.out.println("Propietario: " + sPremio.buscarPorNombre("prem1").getCliente().getNombre());
		
		/*
		for(Premio p: sPremio.buscarTodos()){
			System.out.println("Nombre: " + p.getNombre());
		}
		*/
		
		//sPremio.borrar(sPremio.buscarPorNombre("prem1"));
		
		/*
		Premio premio = sPremio.buscarPorNombre("prem1");
		premio.setDescripcion("Participar en prueba deportiva");
		sPremio.actualizar(premio);
		*/
	}
	
	public void pruebasPruebaCultural(){
		//pruebas tabla pruebaCultural
		
		/*
		PruebaCultural prueba = new PruebaCultural(sParada.buscarPorNombre("parada1"), "cul1", "pregunta", "respuesta", 50);
		sPruebaCultural.insertar(prueba);
		*/
		
		//System.out.println("Parada: " + sPruebaCultural.buscarPorNombre("cul1").getParada().getNombre());
		
		/*
		for(PruebaCultural p: sPruebaCultural.buscarTodos()){
			System.out.println("Nombre: " + p.getNombre());
		}
		*/
		
		//sPruebaCultural.borrar(sPruebaCultural.buscarPorNombre("cul1"));
		
		/*
		PruebaCultural prueba = sPruebaCultural.buscarPorNombre("cul1");
		prueba.setPuntos(70);
		sPruebaCultural.actualizar(prueba);
		*/
	}
	
	public void pruebasPruebaDeportiva(){
		//pruebas tabla pruebaDeportiva
		
		/*
		PruebaDeportiva prueba = new PruebaDeportiva(sParada.buscarPorNombre("parada1"), "dep1", new Date(), new Date(), "explicacion", 50, null);
		sPruebaDeportiva.insertar(prueba);
		*/
		
		//System.out.println("Parada: " + sPruebaDeportiva.buscarPorNombre("dep1").getParada().getNombre());
		
		/*
		for(PruebaDeportiva pd: sPruebaDeportiva.buscarTodos()){
			System.out.println("Nombre: " + pd.getNombre());
		}
		*/
		
		//sPruebaDeportiva.borrar(sPruebaDeportiva.buscarPorNombre("dep1"));
		
		/*
		PruebaDeportiva prueba = sPruebaDeportiva.buscarPorNombre("dep1");
		prueba.setExplicacion("Dificil");
		sPruebaDeportiva.actualizar(prueba);
		*/
	}
	
	public void pruebasVoto(){
		//pruebas tabla voto
		
		/*
		Voto voto = new Voto(sCliente.buscarPorEmail("email"), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1")), 50);
		sVoto.insertar(voto);
		*/
		
		//System.out.println("Puntos de voto: " + sVoto.buscarVoto(sCliente.buscarPorEmail("email"), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1"))).getPuntos());
		
		/*
		for(Voto v: sVoto.buscarTodos()){
			System.out.println("IDVotos: " + v.getIdvoto());
		}
		*/
		
		//sVoto.borrar(sVoto.buscarVoto(sCliente.buscarPorEmail("email"), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1"))));
	
		/*
		Voto voto = sVoto.buscarVoto(sCliente.buscarPorEmail("email"), sMultimedia.buscarMultimedia(sCliente.buscarPorEmail("email"), sPruebaDeportiva.buscarPorNombre("dep1")));
		voto.setPuntos(100);
		sVoto.actualizar(voto);
		*/
	}
	
}
