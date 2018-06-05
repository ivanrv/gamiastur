package com.gamitour.dao;

import java.util.List;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Premio;

public interface PremioDAO extends GenericDAO<Premio, String>{
	public List<Premio> buscarDisponibles();
}
