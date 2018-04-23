package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Actividad;

public interface ServiceActividad {
	public void insertar(Actividad actividad);
	public void borrar(Actividad actividad);
	public void actualizar(Actividad actividad);
	public Actividad buscarPorNombre(String nombre);
	public List<Actividad> buscarTodos();
}
