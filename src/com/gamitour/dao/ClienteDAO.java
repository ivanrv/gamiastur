package com.gamitour.dao;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Cliente;

public interface ClienteDAO extends GenericDAO<Cliente, String>{
	public Cliente buscarPorEmail(String email);
}
