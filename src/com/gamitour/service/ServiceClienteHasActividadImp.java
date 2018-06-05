package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ClienteHasActividadDAO;
import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.ClienteHasActividad;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceClienteHasActividadImp implements ServiceClienteHasActividad {

	MySQLDaoFactory f;
	ClienteHasActividadDAO cha;
	
	public ServiceClienteHasActividadImp() {
		f = new MySQLDaoFactory();
		cha = f.getClienteHasActividadDAO();
	}
	
	@Override
	public void insertar(ClienteHasActividad clienteHasActividad) {
		cha.insertar(clienteHasActividad);
	}

	@Override
	public void borrar(ClienteHasActividad clienteHasActividad) {
		cha.borrar(clienteHasActividad);
	}

	@Override
	public void actualizar(ClienteHasActividad clienteHasActividad) {
		cha.actualizar(clienteHasActividad);
	}

	@Override
	public List<ClienteHasActividad> buscarTodos() {
		return cha.buscarTodos();
	}

	@Override
	public ClienteHasActividad buscarReserva(Cliente cliente, Actividad actividad) {
		return cha.buscarReserva(actividad, cliente);
	}

}
