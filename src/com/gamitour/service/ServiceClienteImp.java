package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ClienteDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceClienteImp implements ServiceCliente {
	
	MySQLDaoFactory f;
	ClienteDAO c;
	
	public ServiceClienteImp() {
		f = new MySQLDaoFactory();
		c = f.getClienteDAO();
	}
	
	@Override
	public Cliente buscarPorEmail(String email) {
		return c.buscarPorEmail(email);
	}

	@Override
	public void insertar(Cliente cliente) {
		c.insertar(cliente);
	}

	@Override
	public void borrar(Cliente cliente) {
		c.borrar(cliente);	
	}

	@Override
	public void actualizar(Cliente cliente) {
		c.actualizar(cliente);	
	}

	@Override
	public List<Cliente> buscarTodos() {
		return c.buscarTodos();
	}

}
