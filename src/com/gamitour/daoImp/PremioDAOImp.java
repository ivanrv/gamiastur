package com.gamitour.daoImp;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;

import com.gamitour.dao.PremioDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Premio;

public class PremioDAOImp extends GenericDAOImp<Premio, String> implements PremioDAO{

	SessionFactory sf;
	
	public PremioDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public List<Premio> buscarDisponibles() {
		ArrayList<Premio> lista = new ArrayList<Premio>();
		
		sf.getCurrentSession().beginTransaction();
		Query q = sf.getCurrentSession().createQuery("select p from Premio p where cliente_idcliente is null");
		lista = (ArrayList<Premio>) q.getResultList();
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
		
		return lista;
	}

}
