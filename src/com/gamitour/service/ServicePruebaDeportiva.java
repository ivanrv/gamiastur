package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.PruebaDeportiva;

public interface ServicePruebaDeportiva {
	public void insertar(PruebaDeportiva prueba);
	public void borrar(PruebaDeportiva prueba);
	public void actualizar(PruebaDeportiva prueba);
	public PruebaDeportiva buscarPorNombre(String nombre);
	public List<PruebaDeportiva> buscarTodos();
}
