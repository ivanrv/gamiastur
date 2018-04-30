package com.gamitour.service;

import java.util.List;

import com.gamitour.modelo.Cliente;

public interface ServiceCliente {
	public void insertar(Cliente cliente);
	public void borrar(Cliente cliente);
	public void actualizar(Cliente cliente);
	public Cliente buscarPorEmail(String email);
	public List<Cliente> buscarTodos();
	public List<String> buscarEmails();
}
