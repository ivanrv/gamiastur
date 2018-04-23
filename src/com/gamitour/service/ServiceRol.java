package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Rol;

public interface ServiceRol{
	public void insertar(Rol rol);
	public void borrar(Rol rol);
	public void actualizar(Rol rol);
	public Rol buscarPorNombre(String nombre);
	public List<Rol> buscarTodos();
}
