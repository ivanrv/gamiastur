package com.gamitour.daoImp;

import javax.persistence.Query;

import org.hibernate.SessionFactory;

import com.gamitour.dao.VotoDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Voto;

public class VotoDAOImp extends GenericDAOImp<Voto, String> implements VotoDAO{

	SessionFactory sf;
	
	public VotoDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public Voto buscarVoto(Cliente cliente, Multimedia multimedia) {
		Voto voto;
		
		sf.getCurrentSession().beginTransaction(); //conexion con bd
		Query q = sf.getCurrentSession().createQuery("select v from Voto v where cliente_idcliente = :idcliente and multimedia_idmultimedia = :idmultimedia"); //secuencia de busqueda
		q.setParameter("idcliente", cliente.getIdcliente()); //asignacion id de cliente
		q.setParameter("idmultimedia", multimedia.getIdmultimedia()); //asignacion id multimedia
		voto = (Voto) q.getSingleResult(); //resultado de busqueda
		sf.getCurrentSession().getTransaction().commit(); //guardado de cambios
		sf.getCurrentSession().close(); //cierre de conexion
		
		return voto;
	}
}
