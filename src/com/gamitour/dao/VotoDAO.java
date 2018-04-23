package com.gamitour.dao;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Voto;

public interface VotoDAO extends GenericDAO<Voto, String>{
	public Voto buscarVoto(Cliente cliente, Multimedia multimedia);
}
