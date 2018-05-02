package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Itinerario;

public interface ServiceItinerario {
	public void insertar(Itinerario itinerario);
	public void borrar(Itinerario itinerario);
	public void actualizar(Itinerario itinerario);
	public Itinerario buscarPorNombre(String nombre);
	public List<Itinerario> buscarTodos();
	public List<String> buscarNombres();
}
