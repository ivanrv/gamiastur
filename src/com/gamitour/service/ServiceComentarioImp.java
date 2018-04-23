package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ComentarioDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceComentarioImp implements ServiceComentario {

	MySQLDaoFactory f;
	ComentarioDAO c;
	
	public ServiceComentarioImp() {
		f = new MySQLDaoFactory();
		c = f.getComentarioDAO();
	}
	
	@Override
	public void insertar(Comentario comentario) {
		c.insertar(comentario);	
	}

	@Override
	public void borrar(Comentario comentario) {
		c.borrar(comentario);	
	}

	@Override
	public void actualizar(Comentario comentario) {
		c.actualizar(comentario);
	}

	@Override
	public Comentario buscarComentario(Cliente cliente, Multimedia multimedia) {
		return c.buscarComentario(cliente, multimedia);
	}

	@Override
	public List<Comentario> buscarTodos() {
		return c.buscarTodos();
	}

}
