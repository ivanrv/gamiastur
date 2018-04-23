package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Premio;

public interface ServicePremio {
	public void insertar(Premio premio);
	public void borrar(Premio premio);
	public void actualizar(Premio premio);
	public Premio buscarPorNombre(String nombre);
	public List<Premio> buscarTodos();
}
