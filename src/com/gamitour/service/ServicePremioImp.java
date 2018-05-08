package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.PremioDAO;
import com.gamitour.modelo.Premio;
import com.gamitour.util.MySQLDaoFactory;

public class ServicePremioImp implements ServicePremio {
	
	MySQLDaoFactory f;
	PremioDAO p;
	
	public ServicePremioImp() {
		f = new MySQLDaoFactory();
		p = f.getPremioDAO();
	}

	@Override
	public void insertar(Premio premio) {
		p.insertar(premio);
	}

	@Override
	public void borrar(Premio premio) {
		p.borrar(premio);
	}

	@Override
	public void actualizar(Premio premio) {
		p.actualizar(premio);
	}

	@Override
	public Premio buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<Premio> buscarTodos() {
		return p.buscarTodos();
	}

	@Override
	public List<String> buscarNombres() {
		return p.buscarNombres();
	}

}
