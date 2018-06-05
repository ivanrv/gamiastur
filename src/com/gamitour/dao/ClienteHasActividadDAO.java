package com.gamitour.dao;

import com.gamitour.genericDao.GenericDAO;
import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.ClienteHasActividad;

public interface ClienteHasActividadDAO extends GenericDAO<ClienteHasActividad, String>{
	public ClienteHasActividad buscarReserva(Actividad actividad, Cliente cliente);
}