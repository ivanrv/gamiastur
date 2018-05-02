package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Pruebadeportiva;

public interface ServicePruebaDeportiva {
	public void insertar(Pruebadeportiva prueba);
	public void borrar(Pruebadeportiva prueba);
	public void actualizar(Pruebadeportiva prueba);
	public Pruebadeportiva buscarPorNombre(String nombre);
	public List<Pruebadeportiva> buscarTodos();
	public List<String> buscarNombres();
}
