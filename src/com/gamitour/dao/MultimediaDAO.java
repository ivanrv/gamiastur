package com.gamitour.dao;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Pruebadeportiva;

public interface MultimediaDAO extends GenericDAO<Multimedia, String>{
	public Multimedia buscarMultimedia(Cliente cliente, Pruebadeportiva prueba);
	public Multimedia buscarPorId(int id);
}
