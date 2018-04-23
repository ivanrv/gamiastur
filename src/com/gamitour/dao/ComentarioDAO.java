package com.gamitour.dao;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;

public interface ComentarioDAO extends GenericDAO<Comentario, String>{
	public Comentario buscarComentario(Cliente cliente, Multimedia multimedia);
}
