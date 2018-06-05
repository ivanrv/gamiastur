package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.ClienteHasActividad;

public interface ServiceClienteHasActividad {
	public void insertar(ClienteHasActividad clienteHasActividad);
	public void borrar(ClienteHasActividad clienteHasActividad);
	public void actualizar(ClienteHasActividad clienteHasActividad);
	public List<ClienteHasActividad> buscarTodos();
	public ClienteHasActividad buscarReserva(Cliente cliente, Actividad actividad);
}
