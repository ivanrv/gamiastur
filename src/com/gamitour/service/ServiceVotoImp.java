package com.gamitour.service;

import java.util.List;

import com.gamitour.dao.VotoDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Voto;
import com.gamitour.util.MySQLDaoFactory;

public class ServiceVotoImp implements ServiceVoto {
	
	MySQLDaoFactory f;
	VotoDAO v;
	
	public ServiceVotoImp() {
		f = new MySQLDaoFactory();
		v = f.getVotoDAO();
	}

	@Override
	public void insertar(Voto voto) {
		v.insertar(voto);
	}

	@Override
	public void borrar(Voto voto) {
		v.borrar(voto);
	}

	@Override
	public void actualizar(Voto voto) {
		v.actualizar(voto);
	}

	@Override
	public Voto buscarVoto(Cliente cliente, Multimedia multimedia) {
		return v.buscarVoto(cliente, multimedia);
	}

	@Override
	public List<Voto> buscarTodos() {
		return v.buscarTodos();
	}

}
