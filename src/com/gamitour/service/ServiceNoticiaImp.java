package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.NoticiaDAO;
import com.gamitour.modelo.Noticia;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceNoticiaImp implements ServiceNoticia {

	MySQLDaoFactory f;
	NoticiaDAO n;
	
	public ServiceNoticiaImp() {
		f = new MySQLDaoFactory();
		n = f.getNoticiaDAO();
	}
	
	@Override
	public void insertar(Noticia noticia) {
		n.insertar(noticia);
	}

	@Override
	public void borrar(Noticia noticia) {
		n.borrar(noticia);
	}

	@Override
	public void actualizar(Noticia noticia) {
		n.actualizar(noticia);
	}

	@Override
	public Noticia buscarPorNombre(String nombre) {
		return n.buscarPorNombre(nombre);
	}

	@Override
	public List<Noticia> buscarTodos() {
		return n.buscarTodos();
	}

	@Override
	public List<String> buscarNombres() {
		return n.buscarNombres();
	}

}
