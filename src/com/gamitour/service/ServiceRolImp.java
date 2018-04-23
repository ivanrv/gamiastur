package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.RolDAO;
import com.gamitour.modelo.Rol;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceRolImp implements ServiceRol {

	MySQLDaoFactory f;
	RolDAO r;
	
	public ServiceRolImp() {
		f = new MySQLDaoFactory();
		r = f.getRolDAO();
	}
	
	@Override
	public Rol buscarPorNombre(String nombre) {
		return r.buscarPorNombre(nombre);
	}

	@Override
	public void insertar(Rol rol) {
		r.insertar(rol);
	}

	@Override
	public void borrar(Rol rol) {
		r.borrar(rol);	
	}

	@Override
	public void actualizar(Rol rol) {
		r.actualizar(rol);	
	}

	@Override
	public List<Rol> buscarTodos() {
		return r.buscarTodos();
	}

}
