package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ActividadDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Actividad;

public class ActividadDAOImp extends GenericDAOImp<Actividad, String> implements ActividadDAO {
	
	SessionFactory sf;

	public ActividadDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}
}
