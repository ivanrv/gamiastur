package com.gamitour.daoImp;

import java.util.List;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ImagenActividadDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Imagenactividad;

public class ImagenActividadDAOImp extends GenericDAOImp<Imagenactividad, String> implements ImagenActividadDAO {

	SessionFactory sf;
	
	public ImagenActividadDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

}
