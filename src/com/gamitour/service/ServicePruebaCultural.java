package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Pruebacultural;

public interface ServicePruebaCultural {
	public void insertar(Pruebacultural prueba);
	public void borrar(Pruebacultural prueba);
	public void actualizar(Pruebacultural prueba);
	public Pruebacultural buscarPorNombre(String nombre);
	public List<Pruebacultural> buscarTodos();
}
