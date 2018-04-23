package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.PruebaCulturalDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.PruebaCultural;

public class PruebaCulturalDAOImp extends GenericDAOImp<PruebaCultural, String> implements PruebaCulturalDAO{

	public PruebaCulturalDAOImp(SessionFactory sf) {
		super(sf);
	}

}
