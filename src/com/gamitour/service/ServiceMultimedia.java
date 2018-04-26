package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Pruebadeportiva;

public interface ServiceMultimedia {
	public void insertar(Multimedia multimedia);
	public void borrar(Multimedia multimedia);
	public void actualizar(Multimedia multimedia);
	public Multimedia buscarMultimedia(Cliente cliente, Pruebadeportiva prueba);
	public List<Multimedia> buscarTodos();
}
