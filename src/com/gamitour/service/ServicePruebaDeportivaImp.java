package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.PruebaDeportivaDAO;
import com.gamitour.modelo.PruebaDeportiva;
import com.gamitour.util.MySQLDaoFactory;

public class ServicePruebaDeportivaImp implements ServicePruebaDeportiva {
	
	MySQLDaoFactory f;
	PruebaDeportivaDAO p;
	
	public ServicePruebaDeportivaImp() {
		f = new MySQLDaoFactory();
		p = f.getPruebaDeportivaDAO();
	}

	@Override
	public void insertar(PruebaDeportiva prueba) {
		p.insertar(prueba);
	}

	@Override
	public void borrar(PruebaDeportiva prueba) {
		p.borrar(prueba);
	}

	@Override
	public void actualizar(PruebaDeportiva prueba) {
		p.actualizar(prueba);
	}

	@Override
	public PruebaDeportiva buscarPorNombre(String nombre) {
		return p.buscarPorNombre(nombre);
	}

	@Override
	public List<PruebaDeportiva> buscarTodos() {
		return p.buscarTodos();
	}

}
