package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ItinerarioDAO;
import com.gamitour.modelo.Itinerario;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceItinerarioImp implements ServiceItinerario {
	
	MySQLDaoFactory f;
	ItinerarioDAO i;
	
	public ServiceItinerarioImp() {
		f = new MySQLDaoFactory();
		i = f.getItinerarioDAO();
	}

	@Override
	public void insertar(Itinerario itinerario) {
		i.insertar(itinerario);
	}

	@Override
	public void borrar(Itinerario itinerario) {
		i.borrar(itinerario);	
	}

	@Override
	public void actualizar(Itinerario itinerario) {
		i.actualizar(itinerario);
	}

	@Override
	public Itinerario buscarPorNombre(String nombre) {
		return i.buscarPorNombre(nombre);
	}

	@Override
	public List<Itinerario> buscarTodos() {
		return i.buscarTodos();
	}

	@Override
	public List<String> buscarNombres() {
		return i.buscarNombres();
	}

}
