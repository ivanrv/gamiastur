package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.PruebaDeportivaDAO;
import com.gamitour.modelo.Pruebadeportiva;
import com.gamitour.util.MySQLDaoFactory;

public class ServicePruebaDeportivaImp implements ServicePruebaDeportiva {
	
	MySQLDaoFactory f;
	PruebaDeportivaDAO p;
	
	public ServicePruebaDeportivaImp() {
		f = new MySQLDaoFactory();
		p = f.getPruebaDeportivaDAO();
	}

	@Override
	public void insertar(Pruebadeportiva prueba) {
		p.insertar(prueba);
	}

	@Override
	public void borrar(Pruebadeportiva prueba) {
		p.borrar(prueba);
	}

	@Override
	public void actualizar(Pruebadeportiva prueba) {
		p.actualizar(prueba);
	}

	@Override
	public Pruebadeportiva buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<Pruebadeportiva> buscarTodos() {
		return p.buscarTodos();
	}

}
