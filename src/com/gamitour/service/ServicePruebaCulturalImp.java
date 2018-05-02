package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.PruebaCulturalDAO;
import com.gamitour.modelo.Pruebacultural;
import com.gamitour.util.MySQLDaoFactory;

public class ServicePruebaCulturalImp implements ServicePruebaCultural {
	
	MySQLDaoFactory f;
	PruebaCulturalDAO p;
	
	public ServicePruebaCulturalImp() {
		f = new MySQLDaoFactory();
		p = f.getPruebaCulturalDAO();
	}

	@Override
	public void insertar(Pruebacultural prueba) {
		p.insertar(prueba);
	}

	@Override
	public void borrar(Pruebacultural prueba) {
		p.borrar(prueba);
	}

	@Override
	public void actualizar(Pruebacultural prueba) {
		p.actualizar(prueba);
	}

	@Override
	public Pruebacultural buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<Pruebacultural> buscarTodos() {
		return p.buscarTodos();
	}

	@Override
	public List<String> buscarNombres() {
		return p.buscarNombres();
	}

}
