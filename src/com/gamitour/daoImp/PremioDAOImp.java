package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.PremioDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Premio;

public class PremioDAOImp extends GenericDAOImp<Premio, String> implements PremioDAO{

	public PremioDAOImp(SessionFactory sf) {
		super(sf);
	}

}
