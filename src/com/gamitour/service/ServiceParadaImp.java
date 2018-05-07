package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ParadaDAO;
import com.gamitour.modelo.Parada;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceParadaImp implements ServiceParada {
	
	MySQLDaoFactory f;
	ParadaDAO p;
	
	public ServiceParadaImp() {
		f = new MySQLDaoFactory();
		p = f.getParadaDAO();
	}

	@Override
	public void insertar(Parada parada) {
		p.insertar(parada);
	}

	@Override
	public void borrar(Parada parada) {
		p.borrar(parada);
	}

	@Override
	public void actualizar(Parada parada) {
		p.actualizar(parada);
	}

	@Override
	public Parada buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<Parada> buscarTodos() {
		return p.buscarTodos();
	}

	@Override
	public List<String> buscarNombres() {
		return p.buscarNombres();
	}

}
