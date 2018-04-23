package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.PruebaCulturalDAO;
import com.gamitour.modelo.PruebaCultural;
import com.gamitour.util.MySQLDaoFactory;

public class ServicePruebaCulturalImp implements ServicePruebaCultural {
	
	MySQLDaoFactory f;
	PruebaCulturalDAO p;
	
	public ServicePruebaCulturalImp() {
		f = new MySQLDaoFactory();
		p = f.getPruebaCulturalDAO();
	}

	@Override
	public void insertar(PruebaCultural prueba) {
		p.insertar(prueba);
	}

	@Override
	public void borrar(PruebaCultural prueba) {
		p.borrar(prueba);
	}

	@Override
	public void actualizar(PruebaCultural prueba) {
		p.actualizar(prueba);
	}

	@Override
	public PruebaCultural buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<PruebaCultural> buscarTodos() {
		return p.buscarTodos();
	}

}
