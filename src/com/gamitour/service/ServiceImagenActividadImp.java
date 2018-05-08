package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.ImagenActividadDAO;
import com.gamitour.modelo.Imagenactividad;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceImagenActividadImp implements ServiceImagenActividad {

	MySQLDaoFactory f;
	ImagenActividadDAO i;
	
	public ServiceImagenActividadImp() {
		f = new MySQLDaoFactory();
		i = f.getImagenActividadDAO();
	}
	
	@Override
	public void insertar(Imagenactividad imagen) {
		i.insertar(imagen);
	}

	@Override
	public void borrar(Imagenactividad imagen) {
		i.borrar(imagen);
	}

	@Override
	public void actualizar(Imagenactividad imagen) {
		i.actualizar(imagen);
	}

	@Override
	public List<Imagenactividad> buscarTodos() {
		return i.buscarTodos();
	}

}
