package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Imagenactividad;

public interface ServiceImagenActividad {
	public void insertar(Imagenactividad imagen);
	public void borrar (Imagenactividad imagen);
	public void actualizar (Imagenactividad imagen);
	public List<Imagenactividad> buscarTodos();
}
