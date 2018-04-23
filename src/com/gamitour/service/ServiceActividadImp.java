package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ActividadDAO;
import com.gamitour.modelo.Actividad;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceActividadImp implements ServiceActividad {

	MySQLDaoFactory f;
	ActividadDAO a;
	
	public ServiceActividadImp() {
		f = new MySQLDaoFactory();
		a = f.getActividadDAO();
	}
	
	@Override
	public void insertar(Actividad actividad) {
		a.insertar(actividad);
	}

	@Override
	public void borrar(Actividad actividad) {
		a.borrar(actividad);
	}

	@Override
	public void actualizar(Actividad actividad) {
		a.actualizar(actividad);
	}

	@Override
	public Actividad buscarPorNombre(String nombre) {
		return a.buscarPorNombre(nombre);
	}

	@Override
	public List<Actividad> buscarTodos() {
		return a.buscarTodos();
	}

}
