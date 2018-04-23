package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Voto;

public interface ServiceVoto {
	public void insertar(Voto voto);
	public void borrar(Voto voto);
	public void actualizar(Voto voto);
	public Voto buscarVoto(Cliente cliente, Multimedia multimedia);
	public List<Voto> buscarTodos();
}
