package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;

public interface ServiceComentario {
	public void insertar(Comentario comentario);
	public void borrar(Comentario comentario);
	public void actualizar(Comentario comentario);
	public Comentario buscarComentario(Cliente cliente, Multimedia multimedia);
	public List<Comentario> buscarTodos();
}
