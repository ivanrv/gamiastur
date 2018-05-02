package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Noticia;

public interface ServiceNoticia {
	public void insertar(Noticia noticia);
	public void borrar(Noticia noticia);
	public void actualizar(Noticia noticia);
	public Noticia buscarPorNombre(String nombre);
	public List<Noticia> buscarTodos();
	public List<String> buscarNombres();
}
