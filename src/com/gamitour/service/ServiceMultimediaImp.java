package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.MultimediaDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.PruebaDeportiva;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceMultimediaImp implements ServiceMultimedia {
	
	MySQLDaoFactory f;
	MultimediaDAO m;
	
	public ServiceMultimediaImp() {
		f = new MySQLDaoFactory();
		m = f.getMultimediaDAO();
	}

	@Override
	public void insertar(Multimedia multimedia) {
		m.insertar(multimedia);
	}

	@Override
	public void borrar(Multimedia multimedia) {
		m.borrar(multimedia);
	}

	@Override
	public void actualizar(Multimedia multimedia) {
		m.actualizar(multimedia);
	}

	@Override
	public Multimedia buscarMultimedia(Cliente cliente, PruebaDeportiva prueba) {
		return m.buscarMultimedia(cliente, prueba);
	}

	@Override
	public List<Multimedia> buscarTodos() {
		return m.buscarTodos();
	}

}
