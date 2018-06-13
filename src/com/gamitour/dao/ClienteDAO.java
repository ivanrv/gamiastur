package com.gamitour.dao;

import java.util.List;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Cliente;

public interface ClienteDAO extends GenericDAO<Cliente, String>{
	public Cliente buscarPorEmail(String email);
	public List<String> buscarEmails();
	public int buscarPuntos(String email);
}
