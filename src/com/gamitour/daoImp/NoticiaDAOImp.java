package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.NoticiaDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Noticia;

public class NoticiaDAOImp extends GenericDAOImp<Noticia, String> implements NoticiaDAO{

	public NoticiaDAOImp(SessionFactory sf) {
		super(sf);
	}

}
