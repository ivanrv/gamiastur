package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Parada;

public interface ServiceParada {
	public void insertar(Parada parada);
	public void borrar(Parada parada);
	public void actualizar(Parada parada);
	public Parada buscarPorNombre(String nombre);
	public List<Parada> buscarTodos();
}
