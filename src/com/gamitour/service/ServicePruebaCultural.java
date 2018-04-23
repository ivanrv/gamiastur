package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.PruebaCultural;

public interface ServicePruebaCultural {
	public void insertar(PruebaCultural prueba);
	public void borrar(PruebaCultural prueba);
	public void actualizar(PruebaCultural prueba);
	public PruebaCultural buscarPorNombre(String nombre);
	public List<PruebaCultural> buscarTodos();
}
